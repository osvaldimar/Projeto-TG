package br.com.vemev.controlador;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.spi.LoggingEvent;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.vemev.dao.LoginDAO;
import br.com.vemev.modelo.Login;
import br.com.vemev.modelo.MembroUserWeb;
import br.com.vemev.modelo.MembroUserWeb.TipoAcessoLogin;

@Controller
public class LoginControlador {
	
	static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(LoginControlador.class);
	
	private LoginDAO dao = new LoginDAO();
	private String userDefaultAdmin = "lider";
	private String passwordDefaultAdmin = dao.read("lider").getPassword();		//"admin";
	
	private String userDefaultMembro = "membro";
	private String passwordDefaultMembro = dao.read("membro").getPassword();	//"membro";
	
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
	
	@RequestMapping(value={"/alterarSenha"})
	public void alterarSenhas(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String tipo = request.getParameter("tipo");
		String senhaAtual = request.getParameter("senhaAtual");
		String novaSenha = request.getParameter("novaSenha");
		Login login = dao.read(tipo);
		
		//valida senha atual e atualiza a nova senha
		if(login.getPassword().equals(senhaAtual)){
			login.setPassword(novaSenha);
			dao.update(login);
			response.getWriter().write("ok");
			response.setStatus(200);
		}else{
			response.getWriter().write("Senha atual inv�lida!");
			response.setStatus(200);
		}
	}

}
