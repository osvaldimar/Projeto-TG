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
	 * Busca membro pelo nome
	 * @param nomeMembro
	 * @return
	 */
	public Membro read(int idMembro){
		String clausulaWhere = "id_membro = " + idMembro;			//busca utilizando a clausula where, PK coluna nome_membro
		Membro membro = (Membro) super.read(clausulaWhere, Membro.class);
		return membro;
	}
	
	/**
	 * Atualiza uma membro pelo nome
	 * @param membro
	 */
	public void update(Membro membro){
		String clausulaWhere = "id_membro = '" + membro.getId_membro() + "'";	//atualiza utilizando a clausula where, PK coluna nome_membro
		super.update(membro, clausulaWhere);
	}
	
	/**
	 * Deleta uma membro pelo nome
	 * @param nomeMembro
	 * @return
	 */
	public boolean delete(int idMembro){
		String clausulaWhere = "id_membro = " +idMembro;				//deleta utilizando a clausula where, PK coluna nome_membro	
		return super.delete(clausulaWhere, Membro.class);
	}
	
	/**
	 * Pesquisa todas os membros
	 * @return
	 */
	public ArrayList<Membro> getListaPeloNome(String nome){
		String clausulaWhere = "nome = '%" + nome + "%'";
		ArrayList<Membro> lista = super.getList(clausulaWhere, Membro.class);
		return lista;
	}
	
	/**
	 * Pesquisa todas os membros
	 * @return
	 */
	public ArrayList<Membro> getLista(){
		String clausulaWhere = "";
		ArrayList<Membro> lista = super.getList(clausulaWhere, Membro.class);
		return lista;
	}
	
}
