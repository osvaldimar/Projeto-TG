package br.com.vemev.controlador;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.vemev.dao.CelulaDAO;
import br.com.vemev.dao.ContataVisitanteDAO;
import br.com.vemev.dao.MembroDAO;
import br.com.vemev.dao.SetorDAO;
import br.com.vemev.dao.VisitanteDAO;
import br.com.vemev.modelo.Celula;
import br.com.vemev.modelo.ContataVisitante;
import br.com.vemev.modelo.Membro;
import br.com.vemev.modelo.Setor;
import br.com.vemev.modelo.Visitante;

@Controller
public class ContatoControlador {

	static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(EmailControlador.class);	
	
	@RequestMapping(value={"/agenda/ajaxAgendamentoDeVisita"}, method = RequestMethod.GET)
	public String consultarAgenda(@RequestParam(required=true, value="id_contato") int idContato, Model model){
				
		//regras de negocio
		ContataVisitante contato = new ContataVisitanteDAO().read(idContato);
		ArrayList<Membro> listaMembrosCelula = new MembroDAO().getListaMembrosDaCelula(contato.getNome_celula());
		Visitante visitante = new VisitanteDAO().read(contato.getId_visit());
		Celula celula = new CelulaDAO().read(contato.getNome_celula());
		Membro responsavel = new MembroDAO().read(contato.getId_membro());
		
		//add o objetos na view jsp do formulario
		model.addAttribute("visitante", visitante);
		model.addAttribute("contato", contato);
		model.addAttribute("celula", celula);
		model.addAttribute("responsavel", responsavel);
		model.addAttribute("listaMembrosCelula", listaMembrosCelula);		
		
		return "formulario-agendamento-visita.jsp";		//retorna somente um formulario(pop up) para o agendamento da visita
	}
	
	@RequestMapping(value={"/agenda/visitantes"})
	public String consultarAgendaCelula(@RequestParam String nomeCelula, @RequestParam String status, Model model) throws UnsupportedEncodingException{
		
		nomeCelula = new String(nomeCelula.getBytes("iso-8859-1"), "UTF-8");
		status = new String(status.getBytes("iso-8859-1"), "UTF-8");
		ContataVisitanteDAO dao = new ContataVisitanteDAO();	//data access object - classe de acesso ao banco de dados
		ArrayList<HashMap<String,HashMap<String,String>>> listaAgenda;
		
		if(nomeCelula.equals("Todas")){
			listaAgenda = dao.getListaContataVisitantesTodasCelulaPorStatus(status);
		}else{
			listaAgenda = dao.getListaContataVisitantesDaCelulaPorStatus(nomeCelula, status);				//add o objeto Setor na view jsp
		}
		
		ArrayList<Celula> listaTodasCelulas = new CelulaDAO().getLista();			
		model.addAttribute("listaTodasCelulas", listaTodasCelulas);		//add o objeto na view jsp
		model.addAttribute("listaContatosVisitantes", listaAgenda);			//add o objeto na view jsp
		model.addAttribute("celulaSelecionada", nomeCelula);
		model.addAttribute("statusSelecionado", status);
		
		return "agenda.jsp";		//direciona pagina consulta agenda da celula
	}
	
	@RequestMapping(value={"/agenda/updateContataVisitante"}, method=RequestMethod.POST)
	public String update(ContataVisitante contato) throws UnsupportedEncodingException{
				
		//regras de negocio - atualiza contato	
		new ContataVisitanteDAO().update(contato);
		
		return "redirect:/vemev/agenda/visitantes?nomeCelula=Todas&status="+URLEncoder.encode("Agendado", "utf-8");	//redireciona pagina agenda
	}
	
	@RequestMapping(value={"/agenda/updateContatoOutraCelula"}, method=RequestMethod.POST)
	public String updateDelegaCelula(ContataVisitante contato, 
									@RequestParam(required=true, value="nome_celula_ant") String nomeCelAnterior) throws UnsupportedEncodingException{
				
		//regras de negocio - atualiza contato
		
		new ContataVisitanteDAO().update(contato);		//salva contato
		final Visitante v = new VisitanteDAO().read(contato.getId_visit());	//ler visitante
		final String nomeCelula = contato.getNome_celula();
				
		CelulaDAO dao = new CelulaDAO();
		final Celula celAnt = dao.read(nomeCelAnterior);	//celula anterior
		final Celula c = dao.read(nomeCelula);			//celula atual
		final String destinos = (c.getEndereco() +" "+ c.getCidade() +" "+ c.getCep() +" "+ c.getEstado());
		final String origem = v.getEndereco() +" "+ v.getCidade() +" "+ v.getCep() +" "+ v.getEstado();
		
		Thread run = new Thread(new Runnable(){
			@Override
			public void run() {
				log.info("Geocalizacao: id_visit = "+v.getId_visit() + "origem: " + origem + "\ndestinos: " + destinos);
				GoogleMapsControlador maps = new GoogleMapsControlador();
				HashMap<String, String> valores = maps.calcularDistanciaKm(origem, destinos);
				String km = valores.get("text");
				
				//ENVIA EMAIL PARA LIDERES DA CELULA
				log.info("PROCESSO ENVIA EMAIL PARA LIDERES DA CELULA - DIRECIONAMENTO!\n"
							+ "*DE PARA* - DE '" +(celAnt != null ? celAnt.getNome_celula() : "N/A") + "' PARA '" +c.getNome_celula()+ "'");
				EmailControlador email = new EmailControlador();
				email.enviaEmailsParaLideresDelegarOutraCelula(c, v, km, celAnt);
			}
		});
		run.start();
		
		return "redirect:/vemev/agenda/visitantes?nomeCelula=Todas&status="+URLEncoder.encode("Não contatado", "utf-8");	//redireciona pagina agenda
	}
	
}
