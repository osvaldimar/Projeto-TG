package br.com.vemev.modelo;

import br.com.vemev.dao.annotation.ColunaBD;
import br.com.vemev.dao.annotation.TabelaBD;
import br.com.vemev.dao.annotation.TipoDado;

@TabelaBD(nome = "participa_celula")
public class ParticipaCelula {

	@ColunaBD(nome = "id_participa")	//nome coluna no banco de dados
	@TipoDado(tipo = "Integer")			//Tipo de dados no banco			(String, Integer, Long)
	private Integer id_participa;
	
	@ColunaBD(nome = "id_membro")
	@TipoDado(tipo = "Integer")
	private Integer id_membro;	
	
	@ColunaBD(nome = "nome_celula")
	@TipoDado(tipo = "String")	
	private String nome_celula;	
	
	@ColunaBD(nome = "data_ini")
	@TipoDado(tipo = "String")	
	private String data_ini;	
	
	@ColunaBD(nome = "data_fim")
	@TipoDado(tipo = "String")	
	private String data_fim;
	
	@ColunaBD(nome = "frequenta") 
	@TipoDado(tipo = "String")	
	private String frequenta;
	
	public ParticipaCelula(){
		
	}
	
	public Integer getId_participa() {
		return id_participa;
	}

	public void setId_participa(Integer id_participa) {
		this.id_participa = id_participa;
	}

	public Integer getId_membro() {
		return id_membro;
	}

	public void setId_membro(Integer id_membro) {
		this.id_membro = id_membro;
	}

	public String getNome_celula() {
		return nome_celula;
	}

	public void setNome_celula(String nome_celula) {
		this.nome_celula = nome_celula;
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

	public String getFrequenta() {
		return frequenta;
	}

	public void setFrequenta(String frequenta) {
		this.frequenta = frequenta;
	}	
	
	
}
