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
	 * Busca uma participacao do membro na celula pelo id_participa
	 * @param idMembro
	 * @return
	 */
	public ParticipaCelula read(int idParticipa){
		String clausulaWhere = "id_participa = " + idParticipa;						//ler utilizando a clausula where, PK coluna id_participa
		ParticipaCelula participa = (ParticipaCelula) super.read(clausulaWhere, ParticipaCelula.class);
		return participa;
	}
	
	/**
	 * Busca uma participacao atual do membro no banco de dados pelo id do membro e o nome da celula
	 * @param idMembro
	 * @return
	 */
	public ParticipaCelula readPeloMembroCelula(int idMembro, String nomeCelula){
		String clausulaWhere = "id_membro = " +idMembro+ " and nome_celula = '" +nomeCelula+ "' and frequenta='Sim'";
		ParticipaCelula participa = (ParticipaCelula) super.read(clausulaWhere, ParticipaCelula.class);
		return participa;
	}
	
	/**
	 * Atualiza uma participacao do membro em uma Célula, atualizacao e realizada pela coluna id_participa
	 * @param ParticipaCelula
	 */
	public void update(ParticipaCelula participa){
		String clausulaWhere = "id_participa = " + participa.getId_participa();		//atualiza utilizando a clausula where, PK coluna id_participa
		super.update(participa, clausulaWhere);
	}
	
	/**
	 * Deleta uma participa do membro na celula pelo id do membro e o nome da celula
	 * @param idMembro
	 * @return
	 */
	public boolean delete(int idParticipa){
		String clausulaWhere = "id_participa = " + idParticipa;
		return super.delete(clausulaWhere, ParticipaCelula.class);
	}
}
