package br.com.vemev.dao;

import java.util.ArrayList;
import java.util.HashMap;

import br.com.vemev.modelo.LiderTreinamento;

public class LiderTreinamentoDAO extends GenericDAO {

	
	/**
	 * Cria uma lider em treinamento no banco de dados
	 * @param lider
	 */
	public void create(LiderTreinamento lider){
		super.create(lider);
	}
	
	/**
	 * Busca um lider em Treinamento pelo id_lider
	 * @param idLider
	 * @return
	 */
	public LiderTreinamento read(int idLider){
		String clausulaWhere = "id_lider = " + idLider;			//busca utilizando a clausula where, PK coluna id_lider
		LiderTreinamento lider = (LiderTreinamento) super.read(clausulaWhere, LiderTreinamento.class);
		return lider;
	}
	
	/**
	 * Atualiza um lider pelo id
	 * @param lider
	 */
	public void update(LiderTreinamento lider){
		String clausulaWhere = "id_lider = " + lider.getId_lider();	//atualiza utilizando a clausula where, PK coluna id_lider
		super.update(lider, clausulaWhere);
	}
	
	/**
	 * Deleta um lider em Treinamento
	 * @param idLider
	 * @return
	 */
	public boolean delete(int idLider){
		String clausulaWhere = "id_lider = " +idLider;				//deleta utilizando a clausula where, PK coluna id_lider	
		return super.delete(clausulaWhere, LiderTreinamento.class);
	}
	
	
	/**
	 * Retorna uma lista simples dos lideres em Treinamento da tabela lider_treinamento
	 * @return
	 */
	public ArrayList<LiderTreinamento> getLista(){
		String clausulaWhere = "";
		ArrayList<LiderTreinamento> lista = super.getList(clausulaWhere, LiderTreinamento.class);
		return lista;
	}
	
	/**
	 * Retorna uma lista simples dos lideres ativo em Treinamento especifica informada no parametro
	 * @return
	 */
	public ArrayList<LiderTreinamento> getListaLideresAtivo(String nome_celula){
		String clausulaWhere = "nome_celula = '" +nome_celula+ "' and status_lider = 'Ativo'";
		ArrayList<LiderTreinamento> lista = super.getList(clausulaWhere, LiderTreinamento.class);
		return lista;
	}
	
	/**
	 * Retorna uma lista dos lideres em Treinamento e os dados do lider como nome, telefone... (tabelas lider_rede e membro)
	 * - Exemplo na view JSP: ${lista.get("membro").get("nome")} >> ${lista.get("nometabela").get("nomecoluna")}
	 * @return
	 */
	public ArrayList<HashMap<String,HashMap<String,String>>> getListaDadosLideresTreinamento(){
		String sqlAvancado = "select * from lider_treinamento as t1 join membro as t2 on t1.id_membro = t2.id_membro order by t1.status_lider, t2.nome;";
		ArrayList<HashMap<String,HashMap<String,String>>> lista = super.getListSqlAvancado(sqlAvancado);
		return lista;
	}
	
}
