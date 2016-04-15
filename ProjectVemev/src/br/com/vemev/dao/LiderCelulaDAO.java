package br.com.vemev.dao;

import java.util.ArrayList;
import java.util.HashMap;

import br.com.vemev.modelo.LiderCelula;
import br.com.vemev.modelo.LiderRede;
import br.com.vemev.modelo.ParticipaCelula;

public class LiderCelulaDAO extends GenericDAO {

	
	/**
	 * Cria uma lider de Rede no banco de dados
	 * @param lider
	 */
	public void create(LiderCelula lider){
		super.create(lider);
	}
	
	/**
	 * Busca um lider de Rede pelo id_lider
	 * @param idLider
	 * @return
	 */
	public LiderCelula read(int idLider){
		String clausulaWhere = "id_lider = " + idLider;			//busca utilizando a clausula where, PK coluna id_lider
		LiderCelula lider = (LiderCelula) super.read(clausulaWhere, LiderCelula.class);
		return lider;
	}
	
	/**
	 * Atualiza um lider pelo id
	 * @param lider
	 */
	public void update(LiderCelula lider){
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
		return super.delete(clausulaWhere, LiderCelula.class);
	}
	
	
	/**
	 * Retorna uma lista simples dos lideres das Redes da tabela lider_rede
	 * @return
	 */
	public ArrayList<LiderCelula> getLista(){
		String clausulaWhere = "";
		ArrayList<LiderCelula> lista = super.getList(clausulaWhere, LiderCelula.class);
		return lista;
	}
	
	/**
	 * Retorna uma lista simples dos lideres ativo em uma rede especifica informada no parametro
	 * @return
	 */
	public ArrayList<LiderCelula> getListaLideresAtivo(String nome_celula){
		String clausulaWhere = "nome_celula = '" +nome_celula+ "' and status_lider = 'Ativo'";
		ArrayList<LiderCelula> lista = super.getList(clausulaWhere, LiderCelula.class);
		return lista;
	}
	
	/**
	 * Retorna uma lista dos lideres das Redes e os dados do lider como nome, telefone... (tabelas lider_rede e membro)
	 * - Exemplo na view JSP: ${lista.get("membro").get("nome")} >> ${lista.get("nometabela").get("nomecoluna")}
	 * @return
	 */
	public ArrayList<HashMap<String,HashMap<String,String>>> getListaDadosLideresCelulas(){
		String sqlAvancado = "select * from lider_celula as t1 join membro as t2 on t1.id_membro = t2.id_membro order by t1.status_lider, t2.nome;";
		ArrayList<HashMap<String,HashMap<String,String>>> lista = super.getListSqlAvancado(sqlAvancado);
		return lista;
	}

	public ArrayList<LiderCelula> getListaLiderancaCelulaDeUmMembro(int id) {
		String clausulaWhere = "id_membro = " +id;
		ArrayList<LiderCelula> lista = super.getList(clausulaWhere, LiderCelula.class);
		return lista;
	}
	
}
