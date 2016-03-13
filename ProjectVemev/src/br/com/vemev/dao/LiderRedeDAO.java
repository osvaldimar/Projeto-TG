package br.com.vemev.dao;

import java.util.ArrayList;

import br.com.vemev.modelo.LiderRede;

public class LiderRedeDAO extends GenericDAO {

	
	/**
	 * Cria uma lider no banco de dados
	 * @param lider
	 */
	public void create(LiderRede lider){
		super.create(lider);
	}
	
	/**
	 * Busca lider pelo id
	 * @param idMembro
	 * @return
	 */
	public LiderRede read(int idMembro){
		String clausulaWhere = "id_lider = " + idMembro;			//busca utilizando a clausula where, PK coluna id_lider
		LiderRede lider = (LiderRede) super.read(clausulaWhere, LiderRede.class);
		return lider;
	}
	
	/**
	 * Atualiza um lider pelo id
	 * @param lider
	 */
	public void update(LiderRede lider){
		String clausulaWhere = "id_lider = '" + lider.getId_membro() + "'";	//atualiza utilizando a clausula where, PK coluna id_lider
		super.update(lider, clausulaWhere);
	}
	
	/**
	 * Deleta um lider pelo id
	 * @param idMembro
	 * @return
	 */
	public boolean delete(int idMembro){
		String clausulaWhere = "id_lider = " +idMembro;				//deleta utilizando a clausula where, PK coluna id_lider	
		return super.delete(clausulaWhere, LiderRede.class);
	}
	
	
	/**
	 * Retorna uma lista de todos os liders
	 * @return
	 */
	public ArrayList<LiderRede> getLista(){
		String clausulaWhere = "";
		ArrayList<LiderRede> lista = super.getList(clausulaWhere, LiderRede.class);
		return lista;
	}
	
}
