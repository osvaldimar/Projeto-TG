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

import br.com.vemev.dao.MembroDAO;
import br.com.vemev.modelo.Membro;


@Path("/membroWS")
@Produces(MediaType.APPLICATION_JSON+";charset=utf-8")
@Consumes(MediaType.APPLICATION_JSON+";charset=utf-8")
public class MembroService {
	

	@GET
	@Path("/listaMembrosService")
	public Response listaMembrosService(){

		System.out.println("Chamou servico RESTful - listaMembros()");		
		MembroDAO dao = new MembroDAO();
		ArrayList<Membro> listaMembros = dao.getLista();
		
		//classe AuxiliarService transforma qualquer objeto ou lista em formato json e retorna resposta http status 200
		return AuxiliarService.responseOK_toJson(listaMembros);		
	}
	
	@GET
	@Path("/readMembroService/{id_membro}")
	public Response readMembroService(@PathParam("id_membro") int id){

		System.out.println("Chamou servico RESTful - readMembroService()");		
		MembroDAO dao = new MembroDAO();
		Membro membro = dao.read(id);
		return AuxiliarService.responseOK_toJson(membro);
		
	}
	
	@GET
	@Path("/createMembroService/{dados}")
	public Response createMembroService(@PathParam("dados") String json){

		System.out.println("Chamou servico RESTful - createMembroService()");		
		Membro membro = (Membro) AuxiliarService.converteJsonParaObjetoJava(json, Membro.class);
		MembroDAO dao = new MembroDAO();
		//dao.create(membro);
		return AuxiliarService.responseOK_toJson("Membro criado ok!");		
		
	}
	
	
}
