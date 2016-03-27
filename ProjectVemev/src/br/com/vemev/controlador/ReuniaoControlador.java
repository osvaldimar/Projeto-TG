package br.com.vemev.controlador;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
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
import br.com.vemev.dao.LiderRedeDAO;
import br.com.vemev.dao.ReuniaoDAO;
import br.com.vemev.modelo.Celula;
import br.com.vemev.modelo.LiderRede;
import br.com.vemev.modelo.Reuniao;

@Controller
public class ReuniaoControlador {

	
	private ReuniaoDAO dao = new ReuniaoDAO();	//data access object - classe de acesso ao banco de dados
	
	@RequestMapping(value={"/reuniao/cadastrarReuniao"}, method=RequestMethod.GET)
	public String cadastrarReuniao(Model model) throws IOException{
		CelulaDAO dao = new CelulaDAO();
		ArrayList<Celula> listaTodasCelulas = dao.getLista();	
		model.addAttribute("listaTodasCelulas", listaTodasCelulas);		//add o objeto na view jsp
		return "Tela de cadastro de reuniões.jsp";
	}
	
	@RequestMapping(value={"/reuniao/createReuniao"}, method=RequestMethod.POST)
	public String createReuniao(Reuniao reuniao) throws UnsupportedEncodingException{
				
		//regras de negocio - salva reuniao no banco		
		dao.create(reuniao);		
		
		//redireciona pagina home
		return "redirect:/home.html";	
	}
}
