package br.com.vemev.modelo;

import br.com.vemev.dao.annotation.ColunaBD;
import br.com.vemev.dao.annotation.TabelaBD;
import br.com.vemev.dao.annotation.TipoDado;

@TabelaBD(nome = "lider_setor")
public class LiderSetor {

	@ColunaBD(nome = "id_lider")		//nome coluna no banco de dados
	@TipoDado(tipo = "Integer")			//Tipo de dados no banco			(String, Integer, Long)
	private Integer id_lider;	
	
	@ColunaBD(nome = "id_membro")
	@TipoDado(tipo = "Integer")
	private Integer id_membro;	
	
	@ColunaBD(nome = "id_setor")
	@TipoDado(tipo = "Integer")	
	private Integer id_setor;	
	
	@ColunaBD(nome = "data_ini")
	@TipoDado(tipo = "String")	
	private String data_ini;	
	
	@ColunaBD(nome = "data_fim")
	@TipoDado(tipo = "String")	
	private String data_fim;
	
	@ColunaBD(nome = "status_lider") 		//Ativo = lider em atividade, Inativo = encerrou atividade de lider
	@TipoDado(tipo = "String")	
	private String status_lider;

	public LiderSetor(){
		
	}
	
	public Integer getId_lider() {
		return id_lider;
	}

	public void setId_lider(Integer id_lider) {
		this.id_lider = id_lider;
	}

	public Integer getId_membro() {
		return id_membro;
	}

	public void setId_membro(Integer id_membro) {
		this.id_membro = id_membro;
	}

	public int getId_setor() {
		return id_setor;
	}

	public void setId_setor(int id_setor) {
		this.id_setor = id_setor;
	}

	public String getData_ini() {
		return data_ini;
	}

	public void setData_ini(String data_ini) {
		this.data_ini = data_ini;
	}

	public String getData_fim() {
		return data_fim;
	}

	public void setData_fim(String data_fim) {
		this.data_fim = data_fim;
	}

	public String getStatus_lider() {
		return status_lider;
	}

	public void setStatus_lider(String status_lider) {
		this.status_lider = status_lider;
	}	
	
	
}
