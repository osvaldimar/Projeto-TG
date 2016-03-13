package br.com.vemev.controlador;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.vemev.dao.LiderRedeDAO;
import br.com.vemev.modelo.LiderRede;

@Controller
public class LiderRedeControlador {

	
	private LiderRedeDAO dao = new LiderRedeDAO();	//data access object - classe de acesso ao banco de dados
	
	@RequestMapping(value={"/lider/createLiderRede"}, method=RequestMethod.POST)
	public String cadastrarMembro(LiderRede lider){
				
		//regras de negocio - salva membro no banco		
		dao.create(lider);
		
		return "redirect:/membro?id_membro=" + lider.getId_membro();	//redireciona pagina da membro cadastrada
	}
	
}
