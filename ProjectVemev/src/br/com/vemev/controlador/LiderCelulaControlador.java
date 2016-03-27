package br.com.vemev.controlador;

import java.io.IOException; 
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.vemev.dao.CelulaDAO;
import br.com.vemev.dao.LiderCelulaDAO;
import br.com.vemev.dao.MembroDAO;
import br.com.vemev.modelo.Celula;
import br.com.vemev.modelo.LiderCelula;
import br.com.vemev.modelo.Membro;

@Controller
public class LiderCelulaControlador {

	
	private LiderCelulaDAO dao = new LiderCelulaDAO();	//data access object - classe de acesso ao banco de dados
		
	//direcionar tela cadastro de lider
	@RequestMapping(value={"/cadastro/liderCelula"}, method=RequestMethod.GET)
	public ModelAndView liderCelula(Model model){
				
		//regras de negocio
		CelulaDAO dao = new CelulaDAO();
		ArrayList<Celula> listaTodasCelulas = dao.getLista();	
		model.addAttribute("listaTodasCelulas", listaTodasCelulas);		//add o objeto na view jsp
		
		MembroDAO dao1 = new MembroDAO();
		ArrayList<Membro> listaMembros = dao1.getLista();			//recupera todas as celulas no banco		
		model.addAttribute("listaMembros", listaMembros);			//seta lista na view para jsp			
		
		return new ModelAndView("Tela de cadastro do Lider da celula.jsp"); 	//retorna pagina listar todas as celulas
	}
		
	@RequestMapping(value={"/lider/createLiderCelula"}, method=RequestMethod.POST)
	public void cadastrarLider(LiderCelula lider, HttpServletRequest request, HttpServletResponse response) throws IOException{
				
		//regras de negocio - pode salvar ate dois lideres para uma mesma rede
		
		String[] idsDosMembros = request.getParameterValues("id_membro"); //recupera vetor de checkbox
		
		//valida quantidade de lideres ativo
		int totalLiderAtivo = dao.getListaLideresAtivo(lider.getNome_celula()).size();		//retorna tamanho da lista
		if(totalLiderAtivo == 1 && idsDosMembros.length > 1){
			//ja possui 1 lider ativo, pode adicionar so mais 1
			response.getWriter().write("Rede já possui 1 líder ativo, só é possível adicionar mais 1");	//msg de resposta
			response.setStatus(200);		//status resposta http 200 success
			return;							//finaliza metodo
		}
		if(totalLiderAtivo == 2 && idsDosMembros.length >= 1){			
			//ja possui 2 lideres ativos, nao pode adicionar mais nenhum
			response.getWriter().write("Rede já possui 2 líderes ativos!");		//msg de resposta
			response.setStatus(200);		//status resposta http 200 success
			return;							//finaliza metodo
		}
		
		if(idsDosMembros.length == 1){			//1 lider
			//salva lider 1
			lider.setId_membro(Integer.parseInt(idsDosMembros[0]));
			lider.setStatus_lider("Ativo");
			dao.create(lider);
			
		}else if(idsDosMembros.length == 2){	//2 lideres
			//salva lider 1
			lider.setId_membro(Integer.parseInt(idsDosMembros[0]));
			lider.setStatus_lider("Ativo");
			dao.create(lider);
			
			//salva lider 2
			lider.setId_membro(Integer.parseInt(idsDosMembros[1]));
			lider.setStatus_lider("Ativo");
			dao.create(lider);
		}	
		response.getWriter().write("ok");
		response.setStatus(200);
		//return "redirect:/vemev/lider/consultaLiderRede";	//redireciona pagina consulta lideres
	}
	
	
	@RequestMapping(value={"/lider/consultaLiderCelula"}, method=RequestMethod.GET)
	public ModelAndView consultaCelula(Model model) {
		
		ArrayList<HashMap<String,HashMap<String,String>>> listaLideres = dao.getListaDadosLideresCelulas();		//recupera todos lideres do bd
		model.addAttribute("listaLideres", listaLideres);		//add lista na view jsp
		
		return new ModelAndView("Tela de consulta dos lideres.jsp"); //retorna tela de consulta lideres
	}
	
}
