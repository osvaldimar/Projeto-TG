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

	
	@RequestMapping(value={"/login"})
	public String login(HttpServletRequest request, HttpServletResponse response){
		
		//regras de negocio para login
		LoginDAO dao = new LoginDAO();
		String userDefaultAdmin = "lider";
		String passwordDefaultAdmin = dao.read("lider").getSenha();		//"admin";
		
		String userDefaultMembro = "membro";
		String passwordDefaultMembro = dao.read("membro").getSenha();	//"membro";
		
		String usuario = request.getParameter("usuario");
		String senha = request.getParameter("senha");
		
		String usuario2 = request.getParameter("usuario2");
		String senha2 = request.getParameter("senha2");
		
		//verifica mobile
		if(usuario2 != null && !usuario2.isEmpty() && senha2 != null && !senha2.isEmpty()){
			usuario = usuario2;
			senha = senha2;
		}
		//valida usuario e senha padrao do sistema
		if(usuario != null && senha != null){
			if(usuario.equalsIgnoreCase(userDefaultAdmin) && senha.equals(passwordDefaultAdmin)){
				log.info("Login ok - Usuario admin lider logado!");				
				MembroUserWeb membroSession = new MembroUserWeb();								//objeto usuario membro acesso
				membroSession.setAcesso(TipoAcessoLogin.LIDER_ACESSO);							//tipo acesso
				request.getSession().setAttribute(MembroUserWeb.MEMBRO_SESSION, membroSession);	//set objeto na session			
				return "redirect:/home.jsp";			//redireciona para action /home
				
			}else if(usuario.equalsIgnoreCase(userDefaultMembro) && senha.equals(passwordDefaultMembro)){
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
		
		LoginDAO dao = new LoginDAO();
		String tipo = request.getParameter("tipo");
		String senhaAtual = request.getParameter("senhaAtual");
		String novaSenha = request.getParameter("novaSenha");
		Login login = dao.read(tipo);
		
		//valida senha atual e atualiza a nova senha
		if(login.getSenha().equals(senhaAtual)){
			login.setSenha(novaSenha);
			dao.update(login);
			response.getWriter().write("ok");
			response.setStatus(200);
		}else{
			response.getWriter().write("Senha atual inválida!");
			response.setStatus(200);
		}
	}

}
