package br.com.vemev.ws.rest;

import java.util.ArrayList;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import br.com.vemev.dao.MembroDAO;
import br.com.vemev.modelo.Membro;


@Path("/membroWS")
@Produces(MediaType.APPLICATION_JSON+";charset=utf-8")
@Consumes(MediaType.APPLICATION_JSON+";charset=utf-8")
public class MembroService {
	

	@GET
	@Path("/listaMembrosService")
	public Response listaMembrosService(){

		//exemplo de chamada deste recurso webservice > /ws/membroWS/listaMembrosService
		System.out.println("Chamou servico RESTful - listaMembros()");
		
		MembroDAO dao = new MembroDAO();
		ArrayList<Membro> listaMembros = dao.getLista();
		
		//classe AuxiliarService transforma qualquer objeto ou lista em formato json e retorna resposta http status 200
		return AuxiliarService.responseOK_toJson(listaMembros);		
	}
	
	@GET
	@Path("/readMembroService/{id_membro}")
	public Response readMembroService(@PathParam("id_membro") int id){
		
		//exemplo de chamada deste recurso webservice > /ws/membroWS/readMembroService/123
		System.out.println("Chamou servico RESTful - readMembroService()");		
		
		MembroDAO dao = new MembroDAO();
		Membro membro = dao.read(id);
		
		//classe AuxiliarService transforma qualquer objeto ou lista em formato json e retorna resposta http status 200
		return AuxiliarService.responseOK_toJson(membro);		
	}
	

	
}
