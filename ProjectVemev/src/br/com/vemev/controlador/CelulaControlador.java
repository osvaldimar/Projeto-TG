package br.com.vemev.controlador;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.com.vemev.dao.CelulaDAO;
import br.com.vemev.dao.LiderCelulaDAO;
import br.com.vemev.dao.LiderTreinamentoDAO;
import br.com.vemev.dao.MembroDAO;
import br.com.vemev.dao.ParticipaCelulaDAO;
import br.com.vemev.dao.SetorDAO;
import br.com.vemev.modelo.Celula;
import br.com.vemev.modelo.LiderCelula;
import br.com.vemev.modelo.LiderTreinamento;
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
	public String updateCelula(HttpServletRequest request, Celula celula) throws UnsupportedEncodingException{
				
		//regras de negocio - atualiza celula no banco
		String nomeAtual = request.getParameter("nomeAtual");
		dao.update(celula, nomeAtual);
		
		return "redirect:/vemev/celula/consultaCelula?nome=" + URLEncoder.encode(celula.getNome_celula(), "utf-8");	//redireciona pagina consulta da celula
	}
	
	@RequestMapping(value={"/celula/deleteCelula"}, method=RequestMethod.POST)
	public String deleteCelula(@RequestParam String nome){
				
		//regras de negocio	- deleta celula pelo nome
		dao.delete(nome);		
		
		return "redirect:/naotem.jsp";		//redireciona pagina listar todas as celulas
	}
	
	
	@RequestMapping(value={"/celula/consultaCelula"})
	public ModelAndView consultaCelula(HttpServletRequest request, Model model) throws UnsupportedEncodingException {

		request.setCharacterEncoding("UTF-8");
		
		//regras de negocio
		//lista de todas celulas para a combobox
		ArrayList<Celula> listaTodasCelulas = dao.getLista();	
		model.addAttribute("listaTodasCelulas", listaTodasCelulas);		//add o objeto na view jsp
		
		
		//lista de todos membros para incluir na celula
		MembroDAO daoDoMembro = new MembroDAO();
		ArrayList<HashMap<String,HashMap<String,String>>> listaTodosMembros = daoDoMembro.getListaMembrosDetalhes();
		model.addAttribute("listaTodosMembros", listaTodosMembros);		//add o objeto na view jsp
		

		//busca no banco de dados a celula selecionada na combo
		String nomeCelula = request.getParameter("nome_celula");
		Celula celula = null;
		if(nomeCelula != null && !nomeCelula.isEmpty()){
			celula = dao.read(nomeCelula);				//ler celula no bd
			if(celula == null){
				nomeCelula = new String(nomeCelula.getBytes("iso-8859-1"), "UTF-8"); //parse utf-8
				celula = dao.read(nomeCelula);	//tenta ler apos parse
			}
			model.addAttribute("celula", celula);		//add o objeto na view jsp
			
			if(celula != null){
				//lista dos membros participantes da celula
				ArrayList<Membro> listaMembrosDaCelula = daoDoMembro.getListaMembrosDaCelula(nomeCelula);
				model.addAttribute("listaMembrosDaCelula", listaMembrosDaCelula);							//add o objeto na view jsp
				
				//ler os dados de Setor/Rede da celula
				SetorDAO daoSetor = new SetorDAO();
				Setor setor = daoSetor.read(celula.getId_setor());
				model.addAttribute("setor", setor);		//add o objeto Setor na view jsp
				
				//adiciona na view jsp a lista de setores para a combo de alteracao
				ArrayList<Setor> listaDeSetores = daoSetor.getLista();		//recupera lista dos setores no bd
				model.addAttribute("listaSetores", listaDeSetores);			//add lista na view jsp
				
				//ler os dados dos Lideres da Celula
				LiderCelulaDAO daoLider = new LiderCelulaDAO();
				ArrayList<LiderCelula> listCel = daoLider.getListaLideresAtivo(nomeCelula); //lista lider celula 	
				ArrayList<Membro> listaLideresCelula = new ArrayList<Membro>();	//lista com dados do membro lider da celula
				for(LiderCelula l : listCel){
					Membro m = daoDoMembro.read(l.getId_membro());
					listaLideresCelula.add(m);
				}
				model.addAttribute("listaLideresCelula", listaLideresCelula);	//add o objeto na view jsp				
			
				//ler os dados dos Lideres em Treinamento
				LiderTreinamentoDAO daoLiderTrein = new LiderTreinamentoDAO();
				ArrayList<LiderTreinamento> listTrein = daoLiderTrein.getListaLideresAtivo(nomeCelula);	//lista lider treinamento			
				ArrayList<Membro> listaLideresTrein = new ArrayList<Membro>();	//lista com dados do membro lider em treinamento
				for(LiderTreinamento l : listTrein){
					Membro m = daoDoMembro.read(l.getId_membro());
					listaLideresTrein.add(m);			
				}
				model.addAttribute("listaLideresTrein", listaLideresTrein);		//add o objeto na view jsp
			}
		}
		
		return new ModelAndView("Tela de consulta da celula.jsp"); 	//retorna pagina consulta da celula
	}
	
	@RequestMapping(value={"/participaCelula/incluirMembro"})
	public String participaCelula(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
				
		//regras de negocio		
		int idMembro = Integer.parseInt(request.getParameter("id_membro"));		//id membro
		String nomeCelula = request.getParameter("nome_celula");				//nome celula
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");			//formato data
		String dataInicio = format.format(new Date());							//data agora
		
		ParticipaCelula participa = new ParticipaCelula();
		participa.setId_membro(idMembro);
		participa.setNome_celula(nomeCelula);
		participa.setData_ini(dataInicio);
		participa.setFrequenta("Sim");
		
		ParticipaCelulaDAO daoParticipa = new ParticipaCelulaDAO();		//dao acesso ao bd
		daoParticipa.create(participa);									//cria participacao membro da celula
		
		//calcula total de membros atual
		MembroDAO daoDoMembro = new MembroDAO();
		ArrayList<Membro> listaMembrosDaCelula = daoDoMembro.getListaMembrosDaCelula(nomeCelula);
		int totalAtual = listaMembrosDaCelula.size();	//total atual da lista de membros		
		
		//atualiza total de membros
		Celula celula = dao.read(nomeCelula);	//ler celula no bd
		celula.setTotal(totalAtual);		//incrementa total
		dao.update(celula, nomeCelula);			//atualiza a celula no bd
	
		String contentType= "text/html;charset=UTF-8";
	    response.setContentType(contentType);
	    response.setCharacterEncoding("utf-8"); 
		return "redirect:/vemev/celula/consultaCelula?nome_celula=" + URLEncoder.encode(nomeCelula, "utf-8");	//redireciona pagina consulta da celula
	}
	
	@RequestMapping(value={"/participaCelula/excluirMembro"})
	public String excluirMembro(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
				
		//regras de negocio
		int idMembro = Integer.parseInt(request.getParameter("id_membro"));		//recupera do parametro http o id_participa
		String nomeCelula = request.getParameter("nome_celula");				//recupera do parametro http a nome da celula
		
		ParticipaCelulaDAO daoParticipa = new ParticipaCelulaDAO();								//dao acesso ao bd
		ParticipaCelula participa = daoParticipa.readPeloMembroCelula(idMembro, nomeCelula);	//recupera participacao atual
		
		daoParticipa.delete(participa.getId_participa());	//excluir participacao do membro da celula
		
		//calcula total de membros atual
		MembroDAO daoDoMembro = new MembroDAO();
		ArrayList<Membro> listaMembrosDaCelula = daoDoMembro.getListaMembrosDaCelula(nomeCelula);
		int totalAtual = listaMembrosDaCelula.size();	//total atual da lista de membros	
		
		//atualiza total de membros
		Celula celula = dao.read(nomeCelula);				//ler celula no bd
		celula.setTotal(totalAtual);					//total-1
		dao.update(celula, participa.getNome_celula());		//atualiza a celula no bd
		
		String contentType= "text/html;charset=UTF-8";
	    response.setContentType(contentType);
	    response.setCharacterEncoding("utf-8");  
		return "redirect:/vemev/celula/consultaCelula?nome_celula=" + URLEncoder.encode(nomeCelula, "utf-8");	//redireciona pagina consulta da celula
	}
	
	@RequestMapping(value={"/participaCelula/desvincularMembro"})
	public String desvincularMembro(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
				
		//regras de negocio
		int idMembro = Integer.parseInt(request.getParameter("id_membro"));		//recupera do parametro http o id_membro
		String nomeCelula = request.getParameter("nome_celula");				//recupera do parametro http a nome da celula
		String dataFim = request.getParameter("data_fim");						//recupera do parametro http a data final
		
		ParticipaCelulaDAO daoParticipa = new ParticipaCelulaDAO();								//dao acesso ao bd
		ParticipaCelula participa = daoParticipa.readPeloMembroCelula(idMembro, nomeCelula);	//recupera participacao atual
		
		participa.setData_fim(dataFim);			//set data final para desvincular membro e guardar historico
		participa.setFrequenta("Não"); 			//set frequenta Nao para desvincular membro e guardar historico
		daoParticipa.update(participa);			//atualiza participacao do membro da celula
		
		//calcula total de membros atual
		MembroDAO daoDoMembro = new MembroDAO();
		ArrayList<Membro> listaMembrosDaCelula = daoDoMembro.getListaMembrosDaCelula(nomeCelula);
		int totalAtual = listaMembrosDaCelula.size();	//total atual da lista de membros
		
		//atualiza total de membros
		Celula celula = dao.read(nomeCelula);	//ler celula no bd
		celula.setTotal(totalAtual);		//total-1
		dao.update(celula, nomeCelula);			//atualiza a celula no bd
		
		
		String contentType= "text/html;charset=UTF-8";
	    response.setContentType(contentType);
	    response.setCharacterEncoding("utf-8");  
		return "redirect:/vemev/celula/consultaCelula?nome_celula=" + URLEncoder.encode(nomeCelula, "utf-8");	//redireciona pagina consulta da celula
	}
	
}
