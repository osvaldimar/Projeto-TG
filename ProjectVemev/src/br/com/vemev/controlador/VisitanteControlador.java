package br.com.vemev.controlador;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.vemev.dao.VisitanteDAO;
import br.com.vemev.modelo.Membro;
import br.com.vemev.modelo.Visitante;

@Controller
public class VisitanteControlador {

	private VisitanteDAO dao = new VisitanteDAO();	//data access object - classe de acesso ao banco de dados
	
	
	@RequestMapping(value={"/visitante/ajaxRelatorioDadosVisitante"}, method = RequestMethod.GET)
	public String ajaxRelatorioDadosVisitante(@RequestParam(required=true, value="id_visit") int id, Model model){
				
		//regras de negocio	- recupera dados do visitante
		Visitante visitante = dao.read(id);
		model.addAttribute("visitante", visitante);		
		
		return "formulario-relatorio-visitante.jsp";		//retorna um formulario via ajax com os dados do visitante
	}
	
	@RequestMapping(value={"/visitante/createVisitante"}, method=RequestMethod.POST)
	public String cadastrarVisitante(Visitante visitante){
				
		//regras de negocio - salva visitante no banco		
		dao.create(visitante);
		
		return "redirect:/vemev/visitante/consultaVisitantes";			//redireciona pagina mostrar consulta dos visitantes
	}
	
	@RequestMapping(value={"/visitante/consultaVisitantes"}, method=RequestMethod.GET)
	public String listarVisitantes(Model model){
				
		//regras de negocio
		ArrayList<Visitante> listaVisitantes = dao.getLista();			//recupera todas as visitantes no banco		
		model.addAttribute("listaVisitantes", listaVisitantes);			//seta lista na view para jsp			
		
		return "Tela de consulta dos visitantes.jsp"; 					//retorna pagina listar todas as visitantes
	}
	
	@RequestMapping(value={"/visitante/alterarDadosVisitante"}, method = RequestMethod.GET)
	public String paginaVisitante(@RequestParam int id_visit, Model model){
				
		//regras de negocio		
		Visitante visitante = dao.read(id_visit);		//ler visitante pelo id no parametro	
		model.addAttribute("visitante", visitante);		//seta objeto visitante na view para jsp		
		
		return "Tela alterar visitante.jsp";			//retorna pagina para alterar o visitante
	}
	
	@RequestMapping(value={"/visitante/updateVisitante"}, method=RequestMethod.POST)
	public String updateVisitante(Visitante visitante){
				
		//regras de negocio - atualiza visitante no banco		
		dao.update(visitante);
		
		return "redirect:/vemev/visitante/consultaVisitantes";		//redireciona pagina mostrar consulta dos visitantes
	}
	
	@RequestMapping(value={"/visitante/deleteVisitante"}, method=RequestMethod.POST)
	public String deleteVisitante(@RequestParam int id_visit){
				
		//regras de negocio	- deleta visitante pelo id
		dao.delete(id_visit);
		
		return "redirect:/vemev/visitante/consultaVisitantes";		//redireciona pagina mostrar consulta dos visitantes
	}
	
	
}
