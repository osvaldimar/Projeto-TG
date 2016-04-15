package br.com.vemev.controlador;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.vemev.dao.CelulaDAO;
import br.com.vemev.dao.LiderSetorDAO;
import br.com.vemev.dao.LiderTreinamentoDAO;
import br.com.vemev.dao.MembroDAO;
import br.com.vemev.dao.SetorDAO;
import br.com.vemev.modelo.Celula;
import br.com.vemev.modelo.LiderSetor;
import br.com.vemev.modelo.LiderTreinamento;
import br.com.vemev.modelo.Membro;
import br.com.vemev.modelo.Setor;

@Controller
public class SetorControlador {

	
	private SetorDAO dao = new SetorDAO();	//data access object - classe de acesso ao banco de dados
	
	@RequestMapping(value={"/setor/createSetor"}, method=RequestMethod.POST)
	public String cadastrarMembro(Setor setor){
				
		//regras de negocio - salva membro no banco		
		dao.create(setor);
		
		return "redirect:/membro?id_membro=" + setor.getId_setor();	//redireciona pagina da membro cadastrada
	}
	
	@RequestMapping(value={"/setor/updateSetor"}, method=RequestMethod.GET)
	public String updateSetor(Setor setor) {
		
		//atualiza setor
		dao.update(setor);
		
		return "redirect:/vemev/setor/consultaSetor?id_setor=" + setor.getId_setor();	//direciona para pagina consulta setor
	}
	
	@RequestMapping(value={"/setor/consultaSetor"}, method=RequestMethod.GET)
	public String consultaSetores(HttpServletRequest request, Model model){
				
		//regras de negocio	
		ArrayList<Setor> listaSetores = dao.getLista();
		model.addAttribute("listaSetores", listaSetores);
		
		String id_setor = request.getParameter("id_setor");		//recupera do parametro http o valor do input
		
		if(id_setor != null && !id_setor.isEmpty()){
			int id = Integer.parseInt(id_setor);
			Setor setor = dao.read(id);
			model.addAttribute("setor", setor);
			
			//ler os dados dos Lideres de Setor
			LiderSetorDAO daoLiderSetor = new LiderSetorDAO();
			ArrayList<HashMap<String,HashMap<String,String>>> listaLideres = daoLiderSetor.getListaDadosLideresSetores();
			model.addAttribute("listaLideresSetor", listaLideres);	//add o objeto na view jsp
			
			//recupera do bd uma lista de celulas do setor
			CelulaDAO daoDaCelula = new CelulaDAO();
			ArrayList<Celula> listaCelulasSetor = daoDaCelula.getListaCelulasPeloSetor(id);
			model.addAttribute("listaCelulasSetor", listaCelulasSetor);	//add o objeto na view jsp
			
		}
		return "Tela de consulta dos setores.jsp";			//redireciona pagina consulta dos setores
	}
	
	
}
