package br.com.vemev.controlador;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.vemev.dao.CelulaDAO;
import br.com.vemev.dao.LiderTreinamentoDAO;
import br.com.vemev.dao.MembroDAO;
import br.com.vemev.modelo.Celula;
import br.com.vemev.modelo.LiderTreinamento;
import br.com.vemev.modelo.Membro;

@Controller
public class LiderTreinamentoControlador {

	
	private LiderTreinamentoDAO dao = new LiderTreinamentoDAO();	//data access object - classe de acesso ao banco de dados
		
	//direcionar tela cadastro de lider
	@RequestMapping(value={"/cadastro/liderTreinamento"}, method=RequestMethod.GET)
	public String liderTreinamento(Model model){
				
		//regras de negocio
		CelulaDAO dao = new CelulaDAO();
		ArrayList<Celula> listaTodasCelulas = dao.getLista();	
		model.addAttribute("listaTodasCelulas", listaTodasCelulas);		//add o objeto na view jsp
		
		MembroDAO dao1 = new MembroDAO();
		ArrayList<Membro> listaMembros = dao1.getLista();			//recupera todas as celulas no banco		
		model.addAttribute("listaMembros", listaMembros);			//seta lista na view para jsp			
		
		return "Tela de cadastro do Lider em Treinamento.jsp"; 		//retorna tela cadastrar lider treinamento
	}
		
	@RequestMapping(value={"/lider/createLiderTreinamento"}, method=RequestMethod.POST)
	public void cadastrarLider(LiderTreinamento lider, HttpServletRequest request, HttpServletResponse response) throws IOException{
				
		//regras de negocio - pode salvar ate dois lideres em Treinamento de uma mesma C�lula
		
		String[] idsDosMembros = request.getParameterValues("id_membro"); //recupera vetor de checkbox
		
		//valida quantidade de lideres ativo
		int totalLiderAtivo = dao.getListaLideresAtivo(lider.getNome_celula()).size();		//retorna tamanho da lista
		if(totalLiderAtivo == 1 && idsDosMembros.length > 1){
			//ja possui 1 lider ativo, pode adicionar so mais 1
			response.getWriter().write("Célula já possui 1 líder em treinamento ativo, só é possível adicionar mais 1");	//msg de resposta
			response.setStatus(200);		//status resposta http 200 success
			return;							//finaliza metodo
		}
		if(totalLiderAtivo == 2 && idsDosMembros.length >= 1){			
			//ja possui 2 lideres ativos, nao pode adicionar mais nenhum
			response.getWriter().write("Célula já possui 2 líderes em Treinamento ativos!");		//msg de resposta
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
		response.getWriter().write("ok");		//retorna resposta ok do server
		response.setStatus(200);				//status resposta http 200=ok
	}
	
	
}
