package br.com.vemev.controlador;

import java.awt.image.SampleModel;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.com.vemev.dao.CelulaDAO;
import br.com.vemev.dao.MembroDAO;
import br.com.vemev.dao.ParticipaCelulaDAO;
import br.com.vemev.dao.SetorDAO;
import br.com.vemev.modelo.Celula;
import br.com.vemev.modelo.Membro;
import br.com.vemev.modelo.ParticipaCelula;
import br.com.vemev.modelo.Setor;

@Controller
public class CelulaControlador {
	
	private CelulaDAO dao = new CelulaDAO();	//data access object - classe de acesso ao banco de dados
	
	
	@RequestMapping(value={"/celula/"}, method = RequestMethod.GET)
	public ModelAndView paginaCelula(@RequestParam String nome, Model model){
				
		//regras de negocio		
		Celula celula = dao.read(nome);			//ler celula pelo nome no banco		
		model.addAttribute("celula", celula);	//seta objeto celula na view para jsp		
		
		return new ModelAndView("naotem.jsp");	//retorna pagina visualizar celula
	}
	
	@RequestMapping(value={"/celula/cadastrarCelula"}, method=RequestMethod.GET)
	public String telaCadastroCelula(Celula celula, Model model){
				
		//regras de negocio	- busca no banco os setores das redes para popular a combo
		SetorDAO daoSetor = new SetorDAO();
		ArrayList<Setor> listaDeSetores = daoSetor.getLista();		//recupera lista dos setores no bd
		model.addAttribute("listaSetores", listaDeSetores);			//add lista na view jsp
		
		return "/Tela de cadastro de Celula.jsp";	//retorna pagina Tela de cadastro de Celula.jsp
	}
	
	
	@RequestMapping(value={"/celula/createCelula"}, method=RequestMethod.POST)
	public String createCelula(Celula celula) throws UnsupportedEncodingException{
				
		//regras de negocio - salva celula no banco		
		dao.create(celula);		
		
		//redireciona pagina consulta da celula - metodo URLEncoder.encode formata url para caracteres utf-8
		return "redirect:/vemev/celula/consultaCelula?nome=" + URLEncoder.encode(celula.getNome_celula(), "utf-8");	
	}
	
	
	@RequestMapping(value={"/celulas"}, method=RequestMethod.GET)
	public ModelAndView listarCelulas(Model model){
				
		//regras de negocio
		ArrayList<Celula> listaCelulas = dao.getLista();			//recupera todas as celulas no banco		
		model.addAttribute("listaCelulas", listaCelulas);			//seta lista na view para jsp			
		
		return new ModelAndView("naotem.jsp"); 	//retorna pagina listar todas as celulas
	}
	
	
	
	@RequestMapping(value={"/celula/updateCelula"}, method=RequestMethod.POST)
	public String updateCelula(@RequestParam String nomeAtual, Celula celula){
				
		//regras de negocio - atualiza celula no banco
		dao.update(celula, nomeAtual);
		
		return "redirect:/naotem?nome=" + celula.getNome_celula();	//redireciona pagina da celula
	}
	
	@RequestMapping(value={"/celula/deleteCelula"}, method=RequestMethod.POST)
	public String deleteCelula(@RequestParam String nome){
				
		//regras de negocio	- deleta celula pelo nome
		dao.delete(nome);		
		
		return "redirect:/naotem.jsp";		//redireciona pagina listar todas as celulas
	}
	
	
	@RequestMapping(value={"/celula/consultaCelula"}, method=RequestMethod.GET)
	public ModelAndView consultaCelula(HttpServletRequest request, Model model) {

		//regras de negocio
		//lista de todas celulas para a combobox
		ArrayList<Celula> listaTodasCelulas = dao.getLista();	
		model.addAttribute("listaTodasCelulas", listaTodasCelulas);		//add o objeto na view jsp
		
		
		//lista de todos membros para incluir na celula
		MembroDAO daoDoMembro = new MembroDAO();
		ArrayList<Membro> listaTodosMembros = daoDoMembro.getLista();
		model.addAttribute("listaTodosMembros", listaTodosMembros);		//add o objeto na view jsp
		
		
		//busca no banco de dados a celula selecionada na combo
		String nomeCelula = request.getParameter("nome");
		Celula celula = null;
		if(nomeCelula != null && !nomeCelula.isEmpty()){
			celula = dao.read(nomeCelula);				//ler celula no bd
			model.addAttribute("celula", celula);		//add o objeto na view jsp
			
			if(celula != null){
				//lista dos membros participantes da celula
				ArrayList<Membro> listaMembrosDaCelula = daoDoMembro.getListaMembrosDaCelula(nomeCelula);
				model.addAttribute("listaMembrosDaCelula", listaMembrosDaCelula);							//add o objeto na view jsp
			}
		}
		
		return new ModelAndView("Tela de consulta da celula.jsp"); 	//retorna pagina consulta da celula
	}
	
	@RequestMapping(value={"/participaCelula/incluirMembro"}, method=RequestMethod.GET)
	public String participaCelula(HttpServletRequest request) throws UnsupportedEncodingException {
				
		//regras de negocio		
		int idMembro = Integer.parseInt(request.getParameter("id_membro"));		//id membro
		String nomeCelula = request.getParameter("nome_celula");				//nome celula
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");			//formato data
		String dataInicio = format.format(new Date());							//data agora
		
		ParticipaCelula participa = new ParticipaCelula();
		participa.setId_membro(idMembro);
		participa.setNome_celula(nomeCelula);
		participa.setData_ini(dataInicio);
		
		ParticipaCelulaDAO daoParticipa = new ParticipaCelulaDAO();		//dao acesso ao bd
		daoParticipa.create(participa);									//cria participacao membro da celula
		
		//atualiza total de membros
		Celula celula = dao.read(nomeCelula);	//ler celula no bd
		int totalAtual = celula.getTotal();		//total atual
		
		celula.setTotal(totalAtual + 1);		//incrementa total
		dao.update(celula, nomeCelula);			//atualiza a celula no bd
		
		return "redirect:/vemev/celula/consultaCelula?nome=" + URLEncoder.encode(nomeCelula, "utf-8");	//redireciona pagina consulta da celula
	}
	
	@RequestMapping(value={"/participaCelula/excluirMembro"}, method=RequestMethod.GET)
	public String excluirMembro(HttpServletRequest request) throws UnsupportedEncodingException {
				
		//regras de negocio		
		int idMembro = Integer.parseInt(request.getParameter("id_membro"));		//id membro
		String nomeCelula = request.getParameter("nome_celula");				//nome celula
		
		ParticipaCelulaDAO daoParticipa = new ParticipaCelulaDAO();				//dao acesso ao bd
		daoParticipa.delete(idMembro, nomeCelula);								//excluir participacao do membro da celula
		
		//atualiza total de membros
		Celula celula = dao.read(nomeCelula);	//ler celula no bd
		int totalAtual = celula.getTotal();		//total atual
		
		celula.setTotal(totalAtual - 1);		//total-1
		dao.update(celula, nomeCelula);			//atualiza a celula no bd
		
		return "redirect:/vemev/celula/consultaCelula?nome=" + URLEncoder.encode(nomeCelula, "utf-8");	//redireciona pagina consulta da celula
	}
}
