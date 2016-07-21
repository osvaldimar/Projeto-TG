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

import org.apache.log4j.Logger;

import br.com.vemev.modelo.Membro;
import br.com.vemev.modelo.MembroUserWeb;

/**
 * Servlet Filter implementation class FiltroPrincipal
 */
@WebFilter(filterName="FiltroPrincipal", urlPatterns="/*")
public class FiltroPrincipal implements Filter {

	static final Logger log = Logger.getLogger(FiltroPrincipal.class);
	private String encoding = "UTF-8";
	
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
		
		request.setCharacterEncoding(encoding);		//forca encoding utf-8
		response.setCharacterEncoding(encoding);
		
		//regras de negocio
		//valida login session
		log.info("Filter access - start! - URI: " + httpRequest.getRequestURI());
		MembroUserWeb membroSession = (MembroUserWeb) session.getAttribute(MembroUserWeb.MEMBRO_SESSION);	//recupera membro escopo de sessao
		
		if(membroSession != null && membroSession.getAcesso().equals(MembroUserWeb.TipoAcessoLogin.LIDER_ACESSO)){
			log.info("Login membro ok - tipo de acesso: LIDER_ACESSO \n");
		}else if(membroSession != null && membroSession.getAcesso().equals(MembroUserWeb.TipoAcessoLogin.MEMBRO_ACESSO)){
			log.info("Login membro ok - tipo de acesso: MEMBRO_ACESSO \n");
		}else{
			//ignora controlador login
			if(httpRequest.getRequestURI().equals("/vemev/login") || httpRequest.getRequestURL().toString().contains("/index.html")
					|| httpRequest.getRequestURL().toString().contains("style-login") || httpRequest.getRequestURL().toString().contains("index.js")
					|| httpRequest.getRequestURL().toString().contains("logo_quadrangular.jpeg")
					|| httpRequest.getRequestURL().toString().contains("log_server.jsp")){
				//ignore
			}else{
				log.warn("Login invalid - redirect para pagina de login /index.html");
				HttpResponse.sendRedirect("/index.html");
				return;
			}
		}
		
		//continue request
		chain.doFilter(request, response);
		log.info("Filter access - end!");
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		encoding = fConfig.getInitParameter("requestEncoding");
	    if( encoding==null ) encoding = "UTF-8";
	}

}
