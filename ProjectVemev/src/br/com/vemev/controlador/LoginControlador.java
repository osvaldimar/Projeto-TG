package br.com.vemev.controlador;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginControlador {
	
	private String userDefault = "admin";
	private String passwordDefault = "admin";
	
	@RequestMapping(value={"/login"})
	public String hello(HttpServletRequest request, HttpServletResponse response){
				
		//regras de negocio para login
		String usuario = request.getParameter("usuario");
		String senha = request.getParameter("senha");
		
		//valida usuario e senha padrao do sistema
		if(usuario != null && senha != null){
			if(usuario.equalsIgnoreCase(this.userDefault) && senha.equals(this.passwordDefault)){
				System.out.println("Login ok - Usuario admin logado!");
				return "redirect:/home.html";			//redireciona para action /home
			}else{
				System.out.println("Erro login - usuario ou senha invalidos!");
				return "redirect:/index.html?error=login";	//redireciona para tela login informando erro de login
			}
		}else{
			System.out.println("Erro login - usuario ou senha invalidos!");
			return "redirect:/index.html?error=login";		//redireciona para tela login informando erro de login
		}
		
	}

}