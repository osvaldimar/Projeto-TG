package br.com.vemev.dao;

import java.util.ArrayList;

import br.com.vemev.modelo.Celula;
import br.com.vemev.modelo.Reuniao;

public class ReuniaoDAO extends GenericDAO {

	
	/**
	 * Cria uma reuniao no banco de dados
	 * @param reuniao
	 */
	public void create(Reuniao reuniao){
		super.create(reuniao);
	}
	
	/**
	 * Busca celula pelo nome
	 * @param nomeCelula
	 * @return
	 */
	public Reuniao read(Integer idReuniao){
		String clausulaWhere = "id_reuniao = '" + idReuniao + "'";			//busca utilizando a clausula where, PK coluna id_reuniao
		Reuniao reuniao = (Reuniao) super.read(clausulaWhere, Reuniao.class);
		return reuniao;
	}
	
	/**
	 * Atualiza uma reuniao pelo id
	 * @param reuniao
	 */
	public void update(Reuniao reuniao){
		String clausulaWhere = "id_reuniao = " + reuniao.getId_reuniao();	//atualiza utilizando a clausula where, PK coluna id_reuniao
		super.update(reuniao, clausulaWhere);
	}
	
	/**
	 * Deleta uma reuniao pelo id
	 * @param idReuniao
	 * @return
	 */
	public boolean delete(Integer idReuniao){
		String clausulaWhere = "id_reuniao = '" +idReuniao+ "'";			//deleta utilizando a clausula where, PK coluna id_reuniao	
		return super.delete(clausulaWhere, Reuniao.class);
	}
	
	/**
	 * Pesquisa todas as reunioes
	 * @return
	 */
	public ArrayList<Reuniao> getLista(){
		String clausulaWhere = "";
		ArrayList<Reuniao> lista = super.getList(clausulaWhere, Reuniao.class);
		return lista;
	}
	
}
