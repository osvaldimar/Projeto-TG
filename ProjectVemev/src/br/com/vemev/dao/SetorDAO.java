package br.com.vemev.dao;

import java.util.ArrayList;

import br.com.vemev.modelo.Setor;
import br.com.vemev.modelo.Setor;

public class SetorDAO extends GenericDAO {

	
	/**
	 * Cria uma Setor no banco de dados 
	 * @param setor
	 */
	public void create(Setor setor){
		int id = super.create(setor);
		setor.setId_setor(id);
	}
	
	/**
	 * Busca Setor pelo idSetor
	 * @param idSetor
	 * @return
	 */
	public Setor read(int idSetor){
		String clausulaWhere = "id_setor = " + idSetor;			//busca utilizando a clausula where, PK coluna id_setor
		Setor setor = (Setor) super.read(clausulaWhere, Setor.class);
		return setor;
	}
	
	/**
	 * Metodo atualiza um Setor
	 * @param setor
	 */
	public void update(Setor setor){
		String clausulaWhere = "id_setor = " + setor.getId_setor();			//atualiza utilizando a clausula where, PK coluna id_setor
		super.update(setor, clausulaWhere);
	}
	
	/**
	 * Metodo deleta um Setor pelo id do Setor
	 * @param idSetor
	 * @return
	 */
	public boolean delete(String idSetor){
		String clausulaWhere = "id_setor = " +idSetor;				//deleta utilizando a clausula where, PK coluna id_setor	
		return super.delete(clausulaWhere, Setor.class);
	}
	
	/**
	 * Pesquisa todas as setors
	 * @return
	 */
	public ArrayList<Setor> getLista(){
		String clausulaWhere = " nome_setor != '' order by cor_rede, nome_setor";
		ArrayList<Setor> lista = super.getList(clausulaWhere, Setor.class);
		return lista;
	}
	
}
