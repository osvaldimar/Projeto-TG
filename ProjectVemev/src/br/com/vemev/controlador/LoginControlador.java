package br.com.vemev.controlador;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.vemev.modelo.MembroUserWeb;
import br.com.vemev.modelo.MembroUserWeb.TipoAcessoLogin;

@Controller
public class LoginControlador {
	
	static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(LoginControlador.class);
	
	private String userDefaultAdmin = "admin";
	private String passwordDefaultAdmin = "admin";
	
	private String userDefaultMembro = "membro";
	private String passwordDefaultMembro = "membro";
	
	@RequestMapping(value={"/login"})
	public String login(HttpServletRequest request, HttpServletResponse response){
				
		//regras de negocio para login
		String usuario = request.getParameter("usuario");
		String senha = request.getParameter("senha");
		
		//valida usuario e senha padrao do sistema
		if(usuario != null && senha != null){
			if(usuario.equalsIgnoreCase(this.userDefaultAdmin) && senha.equals(this.passwordDefaultAdmin)){
				log.info("Login ok - Usuario admin lider logado!");				
				MembroUserWeb membroSession = new MembroUserWeb();								//objeto usuario membro acesso
				membroSession.setAcesso(TipoAcessoLogin.LIDER_ACESSO);							//tipo acesso
				request.getSession().setAttribute(MembroUserWeb.MEMBRO_SESSION, membroSession);	//set objeto na session			
				return "redirect:/home.jsp";			//redireciona para action /home
				
			}else if(usuario.equalsIgnoreCase(this.userDefaultMembro) && senha.equals(this.passwordDefaultMembro)){
				log.info("Login ok - Usuario membro logado!");
				MembroUserWeb membroSession = new MembroUserWeb();								//objeto usuario membro acesso
				membroSession.setAcesso(TipoAcessoLogin.MEMBRO_ACESSO);							//tipo acesso
				request.getSession().setAttribute(MembroUserWeb.MEMBRO_SESSION, membroSession);	//set objeto na session
				return "redirect:/home.jsp";			//redireciona para action /home
				
			}else{
				log.warn("Erro login - usuario ou senha invalidos!");
				return "redirect:/index.html?error=login";	//redireciona para tela login informando erro de login
			}
		}else{
			log.warn("Erro login - usuario ou senha invalidos!");
			return "redirect:/index.html?error=login";		//redireciona para tela login informando erro de login
		}
		
	}
	
	@RequestMapping(value={"/logout"})
	public String logout(HttpServletRequest request, HttpServletResponse response){
		
		//remove objeto usuario login da sessao da aplicacao
		request.getSession().removeAttribute(MembroUserWeb.MEMBRO_SESSION);
		
		//redireciona para pagina login
		return "redirect:/index.html";
	}

}
