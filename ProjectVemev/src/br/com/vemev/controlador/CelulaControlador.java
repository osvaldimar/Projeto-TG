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

import br.com.vemev.dao.CelulaDAO;
import br.com.vemev.modelo.Celula;

@Controller
public class CelulaControlador {

	
	private CelulaDAO dao = new CelulaDAO();	//data access object - classe de acesso ao banco de dados
	
	
	
	
	@RequestMapping(value={"/celula/"}, method = RequestMethod.GET)
	public ModelAndView paginaCelula(@RequestParam String nome, Model model){
				
		//regras de negocio		
		Celula celula = dao.read(nome);			//ler celula pelo nome no banco		
		model.addAttribute("celula", celula);	//seta objeto celula na view para jsp		
		
		return new ModelAndView("celula.jsp");	//retorna pagina visualizar celula
	}
	
	@RequestMapping(value={"/celula/createCelula"}, method=RequestMethod.POST)
	public String cadastrarCelula(Celula celula){
				
		//regras de negocio - salva celula no banco		
		dao.create(celula);
		
		return "redirect:/celula?nome=" + celula.getNome_celula();	//redireciona pagina da celula cadastrada
	}
	
	@RequestMapping(value={"/celulas"}, method=RequestMethod.GET)
	public ModelAndView listarCelulas(Model model){
				
		//regras de negocio
		ArrayList<Celula> listaCelulas = dao.getLista();			//recupera todas as celulas no banco		
		model.addAttribute("listaCelulas", listaCelulas);			//seta lista na view para jsp			
		
		return new ModelAndView("celulas.jsp"); 	//retorna pagina listar todas as celulas
	}
	
	
	
	@RequestMapping(value={"/celula/updateCelula"}, method=RequestMethod.POST)
	public String updateCelula(@RequestParam String nomeAtual, Celula celula){
				
		//regras de negocio - atualiza celula no banco
		dao.update(celula, nomeAtual);
		
		return "redirect:/celula?nome=" + celula.getNome_celula();	//redireciona pagina da celula
	}
	
	@RequestMapping(value={"/celula/deleteCelula"}, method=RequestMethod.POST)
	public String deleteCelula(@RequestParam String nome){
				
		//regras de negocio	- deleta celula pelo nome
		dao.delete(nome);		
		
		return "redirect:/celulas.jsp";		//redireciona pagina listar todas as celulas
	}
	
}
