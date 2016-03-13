package br.com.vemev.controlador;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.vemev.dao.SetorDAO;
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
	
}
