package br.com.vemev.modelo;

import br.com.vemev.dao.annotation.ColunaBD;
import br.com.vemev.dao.annotation.TabelaBD;
import br.com.vemev.dao.annotation.TipoDado;

@TabelaBD(nome = "lider_rede")
public class LiderRede {

	@ColunaBD(nome = "id_membro")		//nome coluna no banco de dados
	@TipoDado(tipo = "Integer")			//Tipo de dados no banco			(String, Integer, Long)
	private Integer id_membro;	
	
	@ColunaBD(nome = "cor_rede")
	@TipoDado(tipo = "String")	
	private String cor_rede;	
	
	@ColunaBD(nome = "data_ini")
	@TipoDado(tipo = "String")	
	private String data_ini;	
	
	@ColunaBD(nome = "data_fim")
	@TipoDado(tipo = "String")	
	private String data_fim;

	public Integer getId_membro() {
		return id_membro;
	}

	public void setId_membro(Integer id_membro) {
		this.id_membro = id_membro;
	}

	public String getCor_rede() {
		return cor_rede;
	}

	public void setCor_rede(String cor_rede) {
		this.cor_rede = cor_rede;
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
	
	
}
