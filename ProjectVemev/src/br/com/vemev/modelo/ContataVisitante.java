package br.com.vemev.modelo;

import br.com.vemev.dao.annotation.ColunaBD;
import br.com.vemev.dao.annotation.TabelaBD;
import br.com.vemev.dao.annotation.TipoDado;

@TabelaBD(nome = "contata_visitante")
public class ContataVisitante {
	
	@ColunaBD(nome = "id_contato")	//nome coluna no banco de dados
	@TipoDado(tipo = "Integer")			//Tipo de dados no banco			(String, Integer, Long)
	private Integer id_contato;
	
	@ColunaBD(nome = "id_membro")
	@TipoDado(tipo = "Integer")
	private Integer id_membro;	
	
	@ColunaBD(nome = "id_visit")
	@TipoDado(tipo = "Integer")
	private Integer id_visit;	
	
	@ColunaBD(nome = "nome_celula")
	@TipoDado(tipo = "String")	
	private String nome_celula;	
	
	@ColunaBD(nome = "data_criado")
	@TipoDado(tipo = "String")	
	private String data_criado;	
	
	@ColunaBD(nome = "data_agendado")
	@TipoDado(tipo = "String")	
	private String data_agendado;
	
	@ColunaBD(nome = "status_contato") 
	@TipoDado(tipo = "String")	
	private String status_contato;
	
	@ColunaBD(nome = "observacao") 
	@TipoDado(tipo = "String")	
	private String observacao;
	
	public ContataVisitante(){
		
	}

	public Integer getId_contato() {
		return id_contato;
	}

	public void setId_contato(Integer id_contato) {
		this.id_contato = id_contato;
	}

	public Integer getId_membro() {
		return id_membro;
	}

	public void setId_membro(Integer id_membro) {
		this.id_membro = id_membro;
	}

	public Integer getId_visit() {
		return id_visit;
	}

	public void setId_visit(Integer id_visit) {
		this.id_visit = id_visit;
	}

	public String getNome_celula() {
		return nome_celula;
	}

	public void setNome_celula(String nome_celula) {
		this.nome_celula = nome_celula;
	}

	public String getData_criado() {
		return data_criado;
	}

	public void setData_criado(String data_criado) {
		this.data_criado = data_criado;
	}

	

	public String getData_agendado() {
		return data_agendado;
	}

	public void setData_agendado(String data_agendado) {
		this.data_agendado = data_agendado;
	}

	public String getStatus_contato() {
		return status_contato;
	}

	public void setStatus_contato(String status_contato) {
		this.status_contato = status_contato;
	}

	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}
	
	
}
