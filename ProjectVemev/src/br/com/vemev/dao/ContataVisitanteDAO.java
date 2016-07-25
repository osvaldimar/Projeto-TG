package br.com.vemev.dao;

import java.util.ArrayList;
import java.util.HashMap;

import br.com.vemev.modelo.ContataVisitante;

public class ContataVisitanteDAO extends GenericDAO {

	
	/**
	 * Metodo inclui (create/insert) um contato de agenda
	 * @param ContataVisitante 
	 */
	public void create(ContataVisitante contato){
		super.create(contato);
	}
	
	/**
	 * Busca um contato agenda no banco
	 * @param idContato
	 * @return ContataVisitante
	 */
	public ContataVisitante read(int idContato){
		String clausulaWhere = "id_contato = " + idContato;						//ler utilizando a clausula where, PK coluna id_participa
		ContataVisitante contato = (ContataVisitante) super.read(clausulaWhere, ContataVisitante.class);
		return contato;
	}
	
	/**
	 * Atualiza um contato agenda
	 * @param contato
	 */
	public void update(ContataVisitante contato){
		String clausulaWhere = "id_contato = " + contato.getId_contato();		//atualiza utilizando a clausula where, PK coluna id_participa
		super.update(contato, clausulaWhere);
	}
	
	/**
	 * Deleta um contato visitante da agenda
	 * @param idContato
	 * @return
	 */
	public boolean delete(int idContato){
		String clausulaWhere = "id_contato = " + idContato;
		return super.delete(clausulaWhere, ContataVisitante.class);
	}

	/**
	 * Metodo retorna uma lista de contato dos visitantes de uma Celula informada no parametro
	 * @param nomeCelula
	 * @return
	 */
	public ArrayList<ContataVisitante> getListaContataVisitantesDaCelula(String nomeCelula) {
		String clausulaWhere = "nome_celula = " +nomeCelula;
		ArrayList<ContataVisitante> lista = super.getList(clausulaWhere, ContataVisitante.class);
		return lista;
	}
	
	/**
	 * Metodo retorna uma lista de contato dos visitantes de uma Celula e pelo Status.
	 * @param nomeCelula
	 * @param status
	 * @return
	 */
	public ArrayList<HashMap<String,HashMap<String,String>>> getListaContataVisitantesTodasCelulaPorStatus(String status) {
		String sqlAvancado = "select * from contata_visitante as t1 join visitante as t2 on t1.id_visit = t2.id_visit "
				+ "join celula as t3 on t3.nome_celula = t1.nome_celula "
				+ "left join membro as t4 on t4.id_membro = t1.id_membro where t1.status_contato = '" +status+ "' order by t1.data_criado desc;";
		ArrayList<HashMap<String,HashMap<String,String>>> lista = super.getListSqlAvancado(sqlAvancado);
		return lista;		
	}
	
	/**
	 * Metodo retorna uma lista de contato dos visitantes de uma Celula e pelo Status.
	 * @param nomeCelula
	 * @param status
	 * @return
	 */
	public ArrayList<HashMap<String,HashMap<String,String>>> getListaContataVisitantesDaCelulaPorStatus(String nomeCelula, String status) {
		String sqlAvancado = "select * from contata_visitante as t1 join visitante as t2 on t1.id_visit = t2.id_visit "
				+ "join celula as t3 on t3.nome_celula = t1.nome_celula "
				+ "left join membro as t4 on t4.id_membro = t1.id_membro where t1.status_contato = '" +status+ "' and t1.nome_celula = '" +nomeCelula+ "' order by t1.data_criado desc;";
		ArrayList<HashMap<String,HashMap<String,String>>> lista = super.getListSqlAvancado(sqlAvancado);
		return lista;	
	}
	
}
