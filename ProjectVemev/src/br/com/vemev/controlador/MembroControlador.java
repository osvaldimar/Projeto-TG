package br.com.vemev.controlador;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.com.vemev.dao.LiderCelulaDAO;
import br.com.vemev.dao.LiderRedeDAO;
import br.com.vemev.dao.LiderSetorDAO;
import br.com.vemev.dao.LiderTreinamentoDAO;
import br.com.vemev.dao.MembroDAO;
import br.com.vemev.dao.ParticipaCelulaDAO;
import br.com.vemev.modelo.LiderCelula;
import br.com.vemev.modelo.LiderRede;
import br.com.vemev.modelo.LiderSetor;
import br.com.vemev.modelo.LiderTreinamento;
import br.com.vemev.modelo.Membro;
import br.com.vemev.modelo.ParticipaCelula;

@Controller
public class MembroControlador {

	
	private MembroDAO dao = new MembroDAO();	//data access object - classe de acesso ao banco de dados
	
	
	@RequestMapping(value={"/membro/ajaxAlterarDadosMembro"}, method = RequestMethod.GET)
	public String ajaxFormularioAlterarDadosMembro(@RequestParam(required=true, value="id_membro") int id, Model model){
				
		//regras de negocio		
		Membro membro = dao.read(id);				//ler membro pelo id no banco
		model.addAttribute("membro", membro);		//seta objeto membro na view para jsp	
		
		return "formulario-alterar-membro.jsp";		//retorna somente um formulario(pop up) para alterar os dados do membro
	}
	
	@RequestMapping(value={"/membro/ajaxRelatorioDadosMembro"}, method = RequestMethod.GET)
	public String ajaxRelatorioDadosMembro(@RequestParam(required=true, value="id_membro") int id, Model model){
				
		//regras de negocio	- recupera dados do membro, participaceos em celulas e liderancas.	
		Membro membro = dao.read(id);
		model.addAttribute("membro", membro);
		
		ParticipaCelulaDAO daoParticipa = new ParticipaCelulaDAO();
		ArrayList<ParticipaCelula> listaParticipacoes = daoParticipa.getListaParticipacoesCelulaDeUmMembro(id);
		model.addAttribute("listaParticipacoes", listaParticipacoes);
		
		
		//lideres celula, treinamento, setor e rede
		
		LiderCelulaDAO daoLiderCelula = new LiderCelulaDAO();
		ArrayList<LiderCelula> listaLiderancaCelulas = daoLiderCelula.getListaLiderancaCelulaDeUmMembro(id);
		model.addAttribute("listaLiderancaCelulas", listaLiderancaCelulas);
		
		LiderTreinamentoDAO daoLiderTrein = new LiderTreinamentoDAO();
		ArrayList<LiderTreinamento> listaLiderancaTrein = daoLiderTrein.getListaLiderancaTreinamentoDeUmMembro(id);
		model.addAttribute("listaLiderancaTrein", listaLiderancaTrein);
		
		LiderSetorDAO daoLiderSetor = new LiderSetorDAO();
		ArrayList<LiderSetor> listaLiderancaSetores = daoLiderSetor.getListaLiderancaSetorDeUmMembro(id);
		model.addAttribute("listaLiderancaSetores", listaLiderancaSetores);
		
		LiderRedeDAO daoLiderRede = new LiderRedeDAO();
		ArrayList<LiderRede> listaLiderancaRedes = daoLiderRede.getListaLiderancaRedeDeUmMembro(id);
		model.addAttribute("listaLiderancaRedes", listaLiderancaRedes);
		
		
		return "formulario-relatorio-membro.jsp";		//retorna um formulario via ajax com os dados do membro
	}
	
	@RequestMapping(value={"/membro/createMembro"}, method=RequestMethod.POST)
	public String cadastrarMembro(Membro membro){
				
		//regras de negocio - salva membro no banco		
		dao.create(membro);
		
		return "redirect:/vemev/membros";		//redireciona pagina listar todos os membros
	}
	
	@RequestMapping(value={"/membros"}, method=RequestMethod.GET)
	public ModelAndView listarMembros(Model model){
				
		//regras de negocio
		ArrayList<Membro> listaMembros = dao.getLista();			//recupera todas as membros no banco		
		model.addAttribute("listaMembros", listaMembros);			//seta lista na view para jsp			
		
		return new ModelAndView("Tela de consulta dos membros.jsp"); 	//retorna pagina listar todas as membros
	}
	
	
	@RequestMapping(value={"/membro/updateMembro"}, method=RequestMethod.POST)
	public String updateMembro(Membro membro){
				
		//regras de negocio - atualiza membro no banco		
		dao.update(membro);
		
		return "redirect:/vemev/membro/consultaMembros";	//redireciona pagina da membro
	}
	
	@RequestMapping(value={"/membro/deleteMembro"}, method=RequestMethod.POST)
	public String deleteMembro(@RequestParam int id_membro){
				
		//regras de negocio	- deleta membro pelo nome
		dao.delete(id_membro);		
		
		return "redirect:/membros";		//redireciona pagina listar todas as membros
	}
	
	
	@RequestMapping(value={"/membro/consultaMembros"}, method=RequestMethod.GET)
	public ModelAndView consultaMembros(Model model){
				
		//regras de negocio
		MembroDAO dao = new MembroDAO();
		ArrayList<Membro> listaMembros = dao.getLista();		//recupera todos membros no banco		
		model.addAttribute("listaMembros", listaMembros);		//seta lista na view para jsp			
		
		return new ModelAndView("Tela de consulta dos membros.jsp"); 	//retorna pagina consulta dos membros
	}
	
	
	//direcionar tela cadastro de lider
	@RequestMapping(value={"/cadastro/liderRede"}, method=RequestMethod.GET)
	public ModelAndView liderRede(Model model){
				
		//regras de negocio
		ArrayList<Membro> listaMembros = dao.getLista();			//recupera todas as celulas no banco		
		model.addAttribute("listaMembros", listaMembros);			//seta lista na view para jsp			
		
		return new ModelAndView("Tela de cadastro do Lider da rede.jsp"); 	//retorna pagina listar todas as celulas
	}
	
}
