package br.com.vemev.ws.rest;

import java.util.ArrayList;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import br.com.vemev.dao.CelulaDAO;
import br.com.vemev.dao.LiderCelulaDAO;
import br.com.vemev.dao.LiderTreinamentoDAO;
import br.com.vemev.dao.MembroDAO;
import br.com.vemev.dao.SetorDAO;
import br.com.vemev.modelo.Celula;
import br.com.vemev.modelo.LiderCelula;
import br.com.vemev.modelo.LiderTreinamento;
import br.com.vemev.modelo.Membro;
import br.com.vemev.modelo.Setor;


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
	
	@GET
	@Path("/buscaDetalhesCelulaService/{nome_celula}")
	public Response buscaDetalhesCelulaService(@PathParam("nome_celula") String nomeCelula){
		
		//busca no banco de dados os detalhes de uma celula como "membros, setor, lideres treinamento, lideres celula"
		
		CelulaDAO dao = new CelulaDAO();
		MembroDAO daoDoMembro = new MembroDAO();
		Celula celula = dao.read(nomeCelula);
		
		if(celula != null){

			//lista dos membros participantes da celula
			ArrayList<Membro> listaMembrosDaCelula = daoDoMembro.getListaMembrosDaCelula(nomeCelula);
			
			//ler os dados de Setor/Rede da celula
			SetorDAO daoSetor = new SetorDAO();
			Setor setor = daoSetor.read(celula.getId_setor());
			
			//ler os dados dos Lideres da Celula
			LiderCelulaDAO daoLider = new LiderCelulaDAO();
			ArrayList<LiderCelula> listCel = daoLider.getListaLideresAtivo(nomeCelula); //lista lider celula 	
			ArrayList<Membro> listaLideresCelula = new ArrayList<Membro>();	//lista com dados do membro lider da celula
			for(LiderCelula l : listCel){
				Membro m = daoDoMembro.read(l.getId_membro());
				listaLideresCelula.add(m);
			}
		
			//ler os dados dos Lideres em Treinamento
			LiderTreinamentoDAO daoLiderTrein = new LiderTreinamentoDAO();
			ArrayList<LiderTreinamento> listTrein = daoLiderTrein.getListaLideresAtivo(nomeCelula);	//lista lider treinamento			
			ArrayList<Membro> listaLideresTrein = new ArrayList<Membro>();	//lista com dados do membro lider em treinamento
			for(LiderTreinamento l : listTrein){
				Membro m = daoDoMembro.read(l.getId_membro());
				listaLideresTrein.add(m);			
			}
			
			//objetos para converter para json > celula, listaMembrosDaCelula, setor, listaLideresCelula, listaLideresTrein
			Object[] objetosCinco = {celula, listaMembrosDaCelula, setor, listaLideresCelula, listaLideresTrein};
			return AuxiliarService.responseOK_toJson(objetosCinco);
			
		}
		return AuxiliarService.responseOK_toJson(null);
	}
	
}
