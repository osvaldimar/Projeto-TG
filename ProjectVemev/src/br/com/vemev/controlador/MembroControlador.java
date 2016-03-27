package br.com.vemev.controlador;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.com.vemev.dao.MembroDAO;
import br.com.vemev.modelo.Celula;
import br.com.vemev.modelo.Membro;

@Controller
public class MembroControlador {

	
	private MembroDAO dao = new MembroDAO();	//data access object - classe de acesso ao banco de dados
	
	
	@RequestMapping(value={"/membro/"}, method = RequestMethod.GET)
	public ModelAndView paginaMembro(@RequestParam int id_membro, Model model){
				
		//regras de negocio		
		Membro membro = dao.read(id_membro);	//ler membro pelo id no banco		
		model.addAttribute("membro", membro);	//seta objeto membro na view para jsp		
		
		return new ModelAndView("membro.jsp");	//retorna pagina visualizar membro
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
		
		return "redirect:/membro?id_membro=" + membro.getId_membro();	//redireciona pagina da membro
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
