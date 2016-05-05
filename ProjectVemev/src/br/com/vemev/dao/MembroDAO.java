package br.com.vemev.dao;

import java.util.ArrayList;
import java.util.HashMap; 

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
	
	/**
	 * Retorna uma lista de todos os membros pelo nome da celula informada no parametro
	 * @return
	 */
	public ArrayList<Membro> getListaMembrosDaCelula(String nomeCelula){
		String clausulaSql = "select t1.id_membro, t1.nome, t1.telefone, t1.celular, t1.endereco, t1.bairro, t1.cep, t1.cidade, t1.estado, t1.complemento, t1.RG"
				+ " from membro as t1"
				+ " join participa_celula as t2 on t1.id_membro = t2.id_membro"
				+ " where t2.nome_celula = '" + nomeCelula + "' and t2.frequenta = 'Sim';";
		ArrayList<Membro> lista = super.getListSqlJoin(clausulaSql, Membro.class);
		return lista;
	}
	
	/**
	 * Retorna uma lista dos membros e detalhes das celulas que participa (tabelas usadas membro, participa_celula e celula)
	 * - Exemplo na view JSP: ${lista.get("membro").get("nome")} >> ${lista.get("nometabela").get("nomecoluna")}
	 * @return
	 */
	public ArrayList<HashMap<String,HashMap<String,String>>> getListaMembrosDetalhes(){
		//sql traz todos membros do banco + a participacao da celula + a celula
		//sql ignora participacoes de celula que o membro nao frequenta mais
		//sql traz dados da celula do membro que ele frequenta atualmente
		String sqlAvancado = 				
				/*"select * from membro as t1 left join participa_celula as t2 on t1.id_membro = t2.id_membro "
				+ "left join celula as t3 on t2.nome_celula = t3.nome_celula  "
				+ "where t2.frequenta NOT IN ( "
					 	+ "SELECT p.frequenta FROM participa_celula as p "
						+ "WHERE t2.id_participa=p.id_participa and p.frequenta = 'Não' "
						+ "and (SELECT count(id_participa) FROM participa_celula as p2 WHERE t1.id_membro=p2.id_membro) >= 2 "
						+ "and (SELECT count(id_participa) FROM participa_celula as p2 WHERE t1.id_membro=p2.id_membro and p2.frequenta = 'Sim') >= 1 "
						+ "or "
				        + "t2.id_participa=p.id_participa and p.frequenta = 'Não' "
				        + "and (SELECT max(id_participa) FROM participa_celula as p2 WHERE t1.id_membro=p2.id_membro) != t2.id_participa "
					+") "
				+ "order by t1.nome;";*/
				
				"select * from membro as t1 left outer join participa_celula as t2 on t1.id_membro = t2.id_membro "
					+"left outer join celula as t3 on t2.nome_celula = t3.nome_celula "
					+"where t1.id_membro NOT IN ( "
						+"SELECT p.id_membro FROM participa_celula as p "
				        +"where p.id_participa = t2.id_participa "
				        +"and (SELECT count(id_participa) FROM participa_celula as p2 WHERE t1.id_membro=p2.id_membro) >= 2 "
						+"and (SELECT max(id_participa) FROM participa_celula as p2 WHERE t1.id_membro=p2.id_membro) != t2.id_participa "
					+") "
				+"order by t1.nome;";
				
		ArrayList<HashMap<String,HashMap<String,String>>> lista = super.getListSqlAvancado(sqlAvancado);
		return lista;
	}
	
	
	public HashMap<String,HashMap<String,String>> getRelatorioDeUmMembro(int id_membro){
		//sql traz todos membros do banco + a participacao da celula + a celula
		//sql ignora participacoes de celula que o membro nao frequenta mais
		//sql traz dados da celula do membro que ele frequenta atualmente
		String sqlAvancado = 				
				"select * from membro as t1 "
				+ "left join participa_celula as t2 on t1.id_membro = t2.id_membro "
				+ "left join lider_celula as t3 on t1.id_membro = t3.id_membro "
				+ "left join lider_treinamento as t4 on t1.id_membro = t4.id_membro "
				+ "left join lider_setor as t5 on t1.id_membro = t5.id_membro "
				+ "left join lider_rede as t6 on t1.id_membro = t6.id_membro "
				+ "where t1.id_membro = " + id_membro;
				
		ArrayList<HashMap<String,HashMap<String,String>>> lista = super.getListSqlAvancado(sqlAvancado);
		if(!lista.isEmpty()){
			return lista.get(0);
		}else{
			return null;
		}
	}
}
