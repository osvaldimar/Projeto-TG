package br.com.vemev.dao;

import java.util.ArrayList;
import java.util.HashMap; 

import br.com.vemev.modelo.LiderSetor;
import br.com.vemev.modelo.LiderTreinamento;

public class LiderSetorDAO extends GenericDAO {

	
	/**
	 * Cria uma lider de Setor no banco de dados
	 * @param lider
	 */
	public void create(LiderSetor lider){
		super.create(lider);
	}
	
	/**
	 * Busca um lider de Setor pelo id_lider
	 * @param idLider
	 * @return
	 */
	public LiderSetor read(int idLider){
		String clausulaWhere = "id_lider = " + idLider;			//busca utilizando a clausula where, PK coluna id_lider
		LiderSetor lider = (LiderSetor) super.read(clausulaWhere, LiderSetor.class);
		return lider;
	}
	
	/**
	 * Atualiza um lider pelo id
	 * @param lider
	 */
	public void update(LiderSetor lider){
		String clausulaWhere = "id_lider = " + lider.getId_lider();	//atualiza utilizando a clausula where, PK coluna id_lider
		super.update(lider, clausulaWhere);
	}
	
	/**
	 * Deleta um lider de Setor
	 * @param idLider
	 * @return
	 */
	public boolean delete(int idLider){
		String clausulaWhere = "id_lider = " +idLider;				//deleta utilizando a clausula where, PK coluna id_lider	
		return super.delete(clausulaWhere, LiderSetor.class);
	}
	
	
	/**
	 * Retorna uma lista simples de todos os lideres dos Setores da tabela lider_setor
	 * @return
	 */
	public ArrayList<LiderSetor> getLista(){
		String clausulaWhere = "";
		ArrayList<LiderSetor> lista = super.getList(clausulaWhere, LiderSetor.class);
		return lista;
	}
	
	/**
	 * Retorna uma lista simples dos lideres ativo em um Setor especifico pelo id informado no parametro
	 * @return
	 */
	public ArrayList<LiderSetor> getListaLideresAtivo(int id_setor){
		String clausulaWhere = "id_setor = " +id_setor+ " and status_lider = 'Ativo'";
		ArrayList<LiderSetor> lista = super.getList(clausulaWhere, LiderSetor.class);
		return lista;
	}
	
	/**
	 * Retorna uma lista dos lideres das Setores e os dados do lider como nome, telefone... (tabelas lider_rede e membro)
	 * - Exemplo na view JSP: ${lista.get("membro").get("nome")} >> ${lista.get("nometabela").get("nomecoluna")}
	 * @return
	 */
	public ArrayList<HashMap<String,HashMap<String,String>>> getListaDadosLideresSetores(){
		String sqlAvancado = "select * from lider_setor as t1 join membro as t2 on t1.id_membro = t2.id_membro order by t1.status_lider, t2.nome;";
		ArrayList<HashMap<String,HashMap<String,String>>> lista = super.getListSqlAvancado(sqlAvancado);
		return lista;
	}

	public ArrayList<LiderSetor> getListaLiderancaSetorDeUmMembro(int id) {
		String clausulaWhere = "id_membro = " +id;
		ArrayList<LiderSetor> lista = super.getList(clausulaWhere, LiderSetor.class);
		return lista;
	}
	
}
