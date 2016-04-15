package br.com.vemev.dao;

import java.util.ArrayList;
import java.util.HashMap; 

import br.com.vemev.modelo.LiderRede;
import br.com.vemev.modelo.LiderTreinamento;

public class LiderRedeDAO extends GenericDAO {

	
	/**
	 * Cria uma lider de Rede no banco de dados
	 * @param lider
	 */
	public void create(LiderRede lider){
		super.create(lider);
	}
	
	/**
	 * Busca um lider de Rede pelo id_lider
	 * @param idLider
	 * @return
	 */
	public LiderRede read(int idLider){
		String clausulaWhere = "id_lider = " + idLider;			//busca utilizando a clausula where, PK coluna id_lider
		LiderRede lider = (LiderRede) super.read(clausulaWhere, LiderRede.class);
		return lider;
	}
	
	/**
	 * Atualiza um lider pelo id
	 * @param lider
	 */
	public void update(LiderRede lider){
		String clausulaWhere = "id_lider = " + lider.getId_lider();	//atualiza utilizando a clausula where, PK coluna id_lider
		super.update(lider, clausulaWhere);
	}
	
	/**
	 * Deleta um lider de Rede
	 * @param idLider
	 * @return
	 */
	public boolean delete(int idLider){
		String clausulaWhere = "id_lider = " +idLider;				//deleta utilizando a clausula where, PK coluna id_lider	
		return super.delete(clausulaWhere, LiderRede.class);
	}
	
	
	/**
	 * Retorna uma lista simples dos lideres das Redes da tabela lider_rede
	 * @return
	 */
	public ArrayList<LiderRede> getLista(){
		String clausulaWhere = "";
		ArrayList<LiderRede> lista = super.getList(clausulaWhere, LiderRede.class);
		return lista;
	}
	
	/**
	 * Retorna uma lista simples dos lideres ativo em uma rede especifica informada no parametro
	 * @return
	 */
	public ArrayList<LiderRede> getListaLideresAtivo(String cor_rede){
		String clausulaWhere = "cor_rede = '" +cor_rede+ "' and status_lider = 'Ativo'";
		ArrayList<LiderRede> lista = super.getList(clausulaWhere, LiderRede.class);
		return lista;
	}
	
	/**
	 * Retorna uma lista dos lideres das Redes e os dados do lider como nome, telefone... (tabelas lider_rede e membro)
	 * - Exemplo na view JSP: ${lista.get("membro").get("nome")} >> ${lista.get("nometabela").get("nomecoluna")}
	 * @return
	 */
	public ArrayList<HashMap<String,HashMap<String,String>>> getListaDadosLideresRedes(){
		String sqlAvancado = "select * from lider_rede as t1 join membro as t2 on t1.id_membro = t2.id_membro order by t1.status_lider, t2.nome;";
		ArrayList<HashMap<String,HashMap<String,String>>> lista = super.getListSqlAvancado(sqlAvancado);
		return lista;
	}

	public ArrayList<LiderRede> getListaLiderancaRedeDeUmMembro(int id) {
		String clausulaWhere = "id_membro = " +id;
		ArrayList<LiderRede> lista = super.getList(clausulaWhere, LiderRede.class);
		return lista;
	}
	
}
