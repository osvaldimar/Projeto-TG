package br.com.vemev.controlador;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.vemev.dao.CelulaDAO;
import br.com.vemev.dao.ReuniaoDAO;
import br.com.vemev.modelo.Celula;
import br.com.vemev.modelo.Reuniao;

@Controller
public class ReuniaoControlador {

	
	private ReuniaoDAO dao = new ReuniaoDAO();	//data access object - classe de acesso ao banco de dados
	
	
	@RequestMapping(value={"/reuniao/ajaxAlterarDadosReuniao"}, method = RequestMethod.GET)
	public String ajaxFormularioAlterarDadosMembro(@RequestParam(required=true, value="id_reuniao") int id, Model model){
				
		//regras de negocio		
		Reuniao reuniao = dao.read(id);									//ler reuniao pelo id no banco
		model.addAttribute("reuniao", reuniao);							//seta objeto reuniao na view para jsp
		
		CelulaDAO dao = new CelulaDAO();
		ArrayList<Celula> listaTodasCelulas = dao.getLista();	
		model.addAttribute("listaTodasCelulas", listaTodasCelulas);		//add o objeto na view jsp, lista celulas para o combo box
		
		return "formulario-alterar-reuniao.jsp";		//retorna somente um formulario(pop up) para alterar os dados da reuniao
	}
	
	@RequestMapping(value={"/reuniao/cadastrarReuniao"}, method=RequestMethod.GET)
	public String cadastrarReuniao(Model model) throws IOException{
		CelulaDAO dao = new CelulaDAO();
		ArrayList<Celula> listaTodasCelulas = dao.getLista();	
		model.addAttribute("listaTodasCelulas", listaTodasCelulas);		//add o objeto na view jsp
		return "Tela de cadastro de reunioes.jsp";
	}
	
	@RequestMapping(value={"/reuniao/createReuniao"}, method=RequestMethod.POST)
	public String createReuniao(Reuniao reuniao){
				
		//regras de negocio - salva reuniao no banco		
		dao.create(reuniao);		
		
		//redireciona consulta reunioes
		return "redirect:/vemev/reuniao/consultaReunioes";	
	}
	
	@RequestMapping(value={"/reuniao/updateReuniao"}, method=RequestMethod.POST)
	public String updateReuniao(Reuniao reuniao){
				
		//regras de negocio - atualiza reuniao no banco		
		dao.update(reuniao);		
		
		//redireciona consulta reunioes
		return "redirect:/vemev/reuniao/consultaReunioes";	
	}
	
	@RequestMapping(value={"/reuniao/consultaReunioes"}, method=RequestMethod.GET)
	public String consultaReunioes(Reuniao reuniao, Model model){
				
		//regras de negocio
		ArrayList<Reuniao> listaReunioes = dao.getLista();
		model.addAttribute("listaReunioes", listaReunioes);
		
		//redireciona consulta reunioes
		return "Tela de consulta das reunioes.jsp";	
	}
}
