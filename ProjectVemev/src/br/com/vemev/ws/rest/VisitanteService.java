package br.com.vemev.ws.rest;

import java.util.ArrayList;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import br.com.vemev.dao.VisitanteDAO;
import br.com.vemev.modelo.Visitante;


@Path("/visitanteWS")
@Produces(MediaType.APPLICATION_JSON+";charset=utf-8")
@Consumes(MediaType.APPLICATION_JSON+";charset=utf-8")
public class VisitanteService {
	

	@GET
	@Path("/listaVisitantesService")
	public Response listaVisitantesService(){

		System.out.println("Chamou servico RESTful - listaVisitantesService()");
		VisitanteDAO dao = new VisitanteDAO();
		ArrayList<Visitante> listaDeVisitantes = dao.getLista();
		return AuxiliarService.responseOK_toJson(listaDeVisitantes);
	}
	
	@GET
	@Path("/readVisitanteService/{id_visit}")
	public Response readVisitanteService(@PathParam("id_visit") int id){

		System.out.println("Chamou servico RESTful - readVisitanteService()");
		VisitanteDAO dao = new VisitanteDAO();
		Visitante visitante = dao.read(id);
		return AuxiliarService.responseOK_toJson(visitante);		
	}
	
}
