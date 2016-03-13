package br.com.vemev.dao;

import java.util.ArrayList;

import br.com.vemev.modelo.Setor;
import br.com.vemev.modelo.Setor;

public class SetorDAO extends GenericDAO {

	
	/**
	 * Cria uma setor no banco de dados
	 * @param setor
	 */
	public void create(Setor setor){
		super.create(setor);
	}
	
	/**
	 * Busca setor pelo nome
	 * @param nomeSetor
	 * @return
	 */
	public Setor read(String nomeSetor){
		String clausulaWhere = "nome_setor = '" + nomeSetor + "'";			//busca utilizando a clausula where, PK coluna nome_setor
		Setor setor = (Setor) super.read(clausulaWhere, Setor.class);
		return setor;
	}
	
	/**
	 * Atualiza uma setor pelo nome
	 * @param setor
	 */
	public void update(Setor setor, String nome){
		String clausulaWhere = "nome_setor = '" + nome + "'";			//atualiza utilizando a clausula where, PK coluna nome_setor
		super.update(setor, clausulaWhere);
	}
	
	/**
	 * Deleta uma setor pelo nome
	 * @param nomeSetor
	 * @return
	 */
	public boolean delete(String nomeSetor){
		String clausulaWhere = "nome_setor = '" +nomeSetor+ "'";				//deleta utilizando a clausula where, PK coluna nome_setor	
		return super.delete(clausulaWhere, Setor.class);
	}
	
	/**
	 * Pesquisa todas as setors
	 * @return
	 */
	public ArrayList<Setor> getLista(){
		String clausulaWhere = "";
		ArrayList<Setor> lista = super.getList(clausulaWhere, Setor.class);
		return lista;
	}
	
}
