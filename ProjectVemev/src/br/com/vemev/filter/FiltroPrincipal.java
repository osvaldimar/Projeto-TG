package br.com.vemev.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.vemev.modelo.Membro;
import br.com.vemev.modelo.MembroUserWeb;

/**
 * Servlet Filter implementation class FiltroPrincipal
 */
@WebFilter(filterName="FiltroPrincipal", urlPatterns="/vemev/*")
public class FiltroPrincipal implements Filter {

    /**
     * Default constructor. 
     */
    public FiltroPrincipal() {
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		HttpServletRequest httpRequest = (HttpServletRequest) request;		//http request protocol
		HttpSession session = httpRequest.getSession();						//session aplication web
		HttpServletResponse HttpResponse = (HttpServletResponse) response;	//response http protocol 
		
		//regras de negocio
		//valida login session
		System.out.println("Filter access - start! - URI: " + httpRequest.getRequestURI());
		MembroUserWeb membroSession = (MembroUserWeb) session.getAttribute(MembroUserWeb.MEMBRO_SESSION);	//recupera membro escopo de sessao
		
		if(membroSession != null && membroSession.getAcesso().equals(MembroUserWeb.TipoAcessoLogin.LIDER_ACESSO)){
			System.out.println("Login membro ok - tipo de acesso: LIDER_ACESSO \n");
		}else if(membroSession != null && membroSession.getAcesso().equals(MembroUserWeb.TipoAcessoLogin.MEMBRO_ACESSO)){
			System.out.println("Login membro ok - tipo de acesso: MEMBRO_ACESSO \n");
		}else{
			//ignora controlador login
			if(httpRequest.getRequestURI().equals("/vemev/login")){
				//ignore
			}else{
				System.out.println("Login invalid - redirect para pagina de login /index.html");
				HttpResponse.sendRedirect("/index.html");
				return;
			}
		}
		
		//continue request
		chain.doFilter(request, response);
		System.out.println("Filter access - end!");
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
