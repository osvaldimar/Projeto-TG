package br.com.vemev.dao;

import java.util.ArrayList;

import br.com.vemev.modelo.Visitante;

public class VisitanteDAO extends GenericDAO {

	
	/**
	 * Cria um visitante no banco de dados
	 * @param visitante
	 */
	public void create(Visitante visitante){
		super.create(visitante);
	}
	
	/**
	 * Busca um visitante pelo id
	 * @param nomeVisitante
	 * @return
	 */
	public Visitante read(int id){
		String clausulaWhere = "id_visit = " + id;					//busca utilizando a clausula where, PK coluna id_visit
		Visitante visitante = (Visitante) super.read(clausulaWhere, Visitante.class);
		return visitante;
	}
	
	/**
	 * Atualiza um visitante pelo id
	 * @param visitante
	 */
	public void update(Visitante visitante){
		String clausulaWhere = "id_visit = " + visitante.getId_visit();		//atualiza utilizando a clausula where, PK coluna id_visit
		super.update(visitante, clausulaWhere);
	}
	
	/**
	 * Deleta um visitante pelo id
	 * @param int id
	 * @return
	 */
	public boolean delete(int id){
		String clausulaWhere = "id_visit = " +id;					//deleta utilizando a clausula where, PK coluna id_visit	
		return super.delete(clausulaWhere, Visitante.class);
	}
	
	/**
	 * Pesquisa todos os visitantes
	 * @return
	 */
	public ArrayList<Visitante> getLista(){
		String clausulaWhere = "";
		ArrayList<Visitante> lista = super.getList(clausulaWhere, Visitante.class);
		return lista;
	}
	
}
