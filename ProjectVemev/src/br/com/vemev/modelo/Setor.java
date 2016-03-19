package br.com.vemev.modelo;

import br.com.vemev.dao.annotation.ColunaBD;
import br.com.vemev.dao.annotation.TabelaBD;
import br.com.vemev.dao.annotation.TipoDado;


@TabelaBD(nome = "setor")				//nome tabela no banco de dados
public class Setor {
	
	@ColunaBD(nome = "id_setor")
	@TipoDado(tipo = "Integer")
	private Integer id_setor;

	@ColunaBD(nome = "nome_setor")
	@TipoDado(tipo = "String")
	private String nome_setor;
	
	@ColunaBD(nome = "cor_rede")
	@TipoDado(tipo = "String")
	private String cor_rede;

	public Integer getId_setor() {
		return id_setor;
	}

	public void setId_setor(Integer id_setor) {
		this.id_setor = id_setor;
	}

	public String getNome_setor() {
		return nome_setor;
	}

	public void setNome_setor(String nome_setor) {
		this.nome_setor = nome_setor;
	}

	public String getCor_rede() {
		return cor_rede;
	}

	public void setCor_rede(String cor_rede) {
		this.cor_rede = cor_rede;
	}
	
}