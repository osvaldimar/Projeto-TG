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

		System.out.println("chamou servico restful - listaMembros()");
		
		MembroDAO dao = new MembroDAO();
		ArrayList<Membro> listaMembros = dao.getLista();
		
		//classe AuxiliarService transforma qualquer objeto ou lista em formato json e retorna resposta http status 200
		return AuxiliarService.responseOK_toJson(listaMembros);		
		
	}
	
	@GET
	@Path("/createMembroService/{dados}")
	public Response createMembroService(@PathParam("dados") String json){

		System.out.println("chamou servico restful - createMembroService()");
		
		Membro membro = (Membro) AuxiliarService.converteJsonParaObjetoJava(json, Membro.class);
		MembroDAO dao = new MembroDAO();
		//dao.create(membro);
		
		//classe AuxiliarService transforma qualquer objeto ou lista em formato json e retorna resposta http status 200
		return AuxiliarService.responseOK_toJson("Membro criado ok!");		
		
	}
	
	@GET
	@Path("/testeService1")
	@Produces("application/json")
	public Response convertFtoC() throws JSONException {

		System.out.println("chamou metodo restful");
		JSONObject jsonObject = new JSONObject();
		Double fahrenheit = 98.24;
		Double celsius;
		celsius = (fahrenheit - 32) * 5 / 9;
		jsonObject.put("F Value", fahrenheit);
		jsonObject.put("C Value", celsius);

		String result = "@Produces(\"application/json\") Output: \n\nF to C Converter Output: \n\n"
				+ jsonObject;
		return Response.status(200).entity(result).build();
	}

	@GET
	@Path("/testeService2")
	@Produces("application/json")
	public Response convertFtoCfromInput(@PathParam("f") float f)
			throws JSONException {

		JSONObject jsonObject = new JSONObject();
		float celsius;
		celsius = (f - 32) * 5 / 9;
		jsonObject.put("F Value", f);
		jsonObject.put("C Value", celsius);

		String result = "@Produces(\"application/json\") Output: \n\nF to C Converter Output: \n\n"
				+ jsonObject;
		return Response.status(200).entity(result).build();
	}
}
