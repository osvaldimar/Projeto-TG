package br.com.vemev.controlador;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.fabric.Response;

import br.com.vemev.dao.VisitanteDAO;
import br.com.vemev.modelo.Visitante;

@Controller
public class VisitanteControlador {

	private VisitanteDAO dao = new VisitanteDAO();	//data access object - classe de acesso ao banco de dados
	
	
	@RequestMapping(value={"/visitante/"}, method = RequestMethod.GET)
	public ModelAndView paginaVisitante(@RequestParam int id_visit, Model model){
				
		//regras de negocio		
		Visitante visitante = dao.read(id_visit);		//ler visitante pelo nome no banco		
		model.addAttribute("visitante", visitante);		//seta objeto visitante na view para jsp		
		
		return new ModelAndView("visitante.jsp");		//retorna pagina visualizar visitante
	}
	
	@RequestMapping(value={"/visitante/createVisitante"}, method=RequestMethod.POST)
	public String cadastrarVisitante(Visitante visitante) throws IOException{
				
		//regras de negocio - salva visitante no banco		
		dao.create(visitante);

		return "redirect:/home.html";	//redireciona pagina da visitante cadastrada
	}
	
	@RequestMapping(value={"/visitantes"}, method=RequestMethod.GET)
	public ModelAndView listarVisitantes(Model model){
				
		//regras de negocio
		ArrayList<Visitante> listaVisitantes = dao.getLista();			//recupera todas as visitantes no banco		
		model.addAttribute("listaVisitantes", listaVisitantes);			//seta lista na view para jsp			
		
		return new ModelAndView("visitantes.jsp"); 						//retorna pagina listar todas as visitantes
	}
	
	
	@RequestMapping(value={"/visitante/updateVisitante"}, method=RequestMethod.POST)
	public String updateVisitante(Visitante visitante){
				
		//regras de negocio - atualiza visitante no banco		
		dao.update(visitante);
		
		return "redirect:/visitante?nome=" + visitante.getId_visit();	//redireciona pagina da visitante
	}
	
	@RequestMapping(value={"/visitante/deleteVisitante"}, method=RequestMethod.POST)
	public String deleteVisitante(@RequestParam int id_visit){
				
		//regras de negocio	- deleta visitante pelo id
		dao.delete(id_visit);		
		
		return "redirect:/visitantes.jsp";		//redireciona pagina listar todas as visitantes
	}
}
