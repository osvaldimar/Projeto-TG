package br.com.vemev.dao;

import java.util.ArrayList;

import br.com.vemev.modelo.Membro;

public class MembroDAO extends GenericDAO {

	
	/**
	 * Cria uma membro no banco de dados
	 * @param membro
	 */
	public void create(Membro membro){
		super.create(membro);
	}
	
	/**
	 * Busca membro pelo id
	 * @param idMembro
	 * @return
	 */
	public Membro read(int idMembro){
		String clausulaWhere = "id_membro = " + idMembro;			//busca utilizando a clausula where, PK coluna id_membro
		Membro membro = (Membro) super.read(clausulaWhere, Membro.class);
		return membro;
	}
	
	/**
	 * Atualiza um membro pelo id
	 * @param membro
	 */
	public void update(Membro membro){
		String clausulaWhere = "id_membro = '" + membro.getId_membro() + "'";	//atualiza utilizando a clausula where, PK coluna id_membro
		super.update(membro, clausulaWhere);
	}
	
	/**
	 * Deleta um membro pelo id
	 * @param idMembro
	 * @return
	 */
	public boolean delete(int idMembro){
		String clausulaWhere = "id_membro = " +idMembro;				//deleta utilizando a clausula where, PK coluna id_membro	
		return super.delete(clausulaWhere, Membro.class);
	}
	
	/**
	 * Pesquisa uma lista de membros pelo nome informado
	 * @return
	 */
	public ArrayList<Membro> getListaPeloNome(String nome){
		String clausulaWhere = "nome = '%" + nome + "%'";
		ArrayList<Membro> lista = super.getList(clausulaWhere, Membro.class);
		return lista;
	}
	
	/**
	 * Retorna uma lista de todos os membros
	 * @return
	 */
	public ArrayList<Membro> getLista(){
		String clausulaWhere = "";
		ArrayList<Membro> lista = super.getList(clausulaWhere, Membro.class);
		return lista;
	}
	
}
