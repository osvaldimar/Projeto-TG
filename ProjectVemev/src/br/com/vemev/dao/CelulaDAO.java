package br.com.vemev.dao;

import java.util.ArrayList;

import br.com.vemev.modelo.Celula;

public class CelulaDAO extends GenericDAO {

	
	/**
	 * Cria uma celula no banco de dados
	 * @param celula
	 */
	public void create(Celula celula){
		super.create(celula);
	}
	
	/**
	 * Busca celula pelo nome
	 * @param nomeCelula
	 * @return
	 */
	public Celula read(String nomeCelula){
		String clausulaWhere = "nome_celula = '" + nomeCelula + "'";			//busca utilizando a clausula where, PK coluna nome_celula
		Celula celula = (Celula) super.read(clausulaWhere, Celula.class);
		return celula;
	}
	
	/**
	 * Atualiza uma celula pelo nome
	 * @param celula
	 */
	public void update(Celula celula, String nome){
		String clausulaWhere = "nome_celula = '" + nome + "'";			//atualiza utilizando a clausula where, PK coluna nome_celula
		super.update(celula, clausulaWhere);
	}
	
	/**
	 * Deleta uma celula pelo nome
	 * @param nomeCelula
	 * @return
	 */
	public boolean delete(String nomeCelula){
		String clausulaWhere = "nome_celula = '" +nomeCelula+ "'";				//deleta utilizando a clausula where, PK coluna nome_celula	
		return super.delete(clausulaWhere, Celula.class);
	}
	
	/**
	 * Pesquisa todas as celulas
	 * @return
	 */
	public ArrayList<Celula> getLista(){
		String clausulaWhere = "";
		ArrayList<Celula> lista = super.getList(clausulaWhere, Celula.class);
		return lista;
	}
	
	/**
	 * Metodo retorna uma lista de Celulas de um Setor, informar o id_setor no parametro
	 * @return
	 */
	public ArrayList<Celula> getListaCelulasPeloSetor(int idSetor){
		String clausulaWhere = "id_setor = " + idSetor;
		ArrayList<Celula> lista = super.getList(clausulaWhere, Celula.class);
		return lista;
	}
}
