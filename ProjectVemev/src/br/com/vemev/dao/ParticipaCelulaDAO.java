package br.com.vemev.dao;

import br.com.vemev.modelo.ParticipaCelula;

public class ParticipaCelulaDAO extends GenericDAO {

	
	/**
	 * Metodo inclui (create/insert) um membro na celula
	 * @param lider
	 */
	public void create(ParticipaCelula participa){
		super.create(participa);
	}
	
	/**
	 * Busca uma participacao pelo id do membro e o nome da celula
	 * @param idMembro
	 * @return
	 */
	public ParticipaCelula read(int idMembro, String nomeCelula){
		String clausulaWhere = "id_membro = " + idMembro + " and nome_celula = '" + nomeCelula +"'";
		ParticipaCelula participa = (ParticipaCelula) super.read(clausulaWhere, ParticipaCelula.class);
		return participa;
	}
	
	/**
	 * Deleta uma participa do membro na celula pelo id do membro e o nome da celula
	 * @param idMembro
	 * @return
	 */
	public boolean delete(int idMembro, String nomeCelula){
		String clausulaWhere = "id_membro = " + idMembro + " and nome_celula = '" + nomeCelula +"'";
		return super.delete(clausulaWhere, ParticipaCelula.class);
	}
}
