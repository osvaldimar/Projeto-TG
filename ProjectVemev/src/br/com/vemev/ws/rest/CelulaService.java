package br.com.vemev.ws.rest;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import br.com.vemev.dao.CelulaDAO;
import br.com.vemev.dao.MembroDAO;
import br.com.vemev.modelo.Celula;
import br.com.vemev.modelo.Membro;


@Path("/celulaWS")
@Produces(MediaType.APPLICATION_JSON+";charset=utf-8")
@Consumes(MediaType.APPLICATION_JSON+";charset=utf-8")
public class CelulaService {
	

	@GET
	@Path("/listaCelulasService")
	public Response listaCelulasService(){

		System.out.println("Chamou servico RESTful - listaCelulasService()");		
		CelulaDAO dao = new CelulaDAO();
		ArrayList<Celula> listaDeCelulas = dao.getLista();		
		return AuxiliarService.responseOK_toJson(listaDeCelulas);		
	}
	
	@GET
	@Path("/readCelulaService/{nome_celula}")
	public Response readCelulaService(@PathParam("nome_celula") String nome){

		System.out.println("Chamou servico RESTful - readCelulaService()");		
		CelulaDAO dao = new CelulaDAO();
		Celula celula = dao.read(nome);
		return AuxiliarService.responseOK_toJson(celula);
		
	}
	
}
