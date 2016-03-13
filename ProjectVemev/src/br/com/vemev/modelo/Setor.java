package br.com.vemev.modelo;

import br.com.vemev.dao.annotation.ColunaBD;
import br.com.vemev.dao.annotation.TabelaBD;
import br.com.vemev.dao.annotation.TipoDado;


@TabelaBD(nome = "setor")				//nome tabela no banco de dados
public class Setor {
	
	@ColunaBD(nome = "id_setor")		//nome coluna no banco de dados
	@TipoDado(tipo = "Integer")			//Tipo de dados no banco			(String, Integer, Long)
	private Integer id_setor;			//nome atributo da classe 			(qualquer)

	@ColunaBD(nome = "nome_setor")		//nome coluna no banco de dados
	@TipoDado(tipo = "String")			//Tipo de dados no banco			(String, Integer, Long)
	private String nome_setor;			//nome atributo da classe 			(qualquer)
	
	@ColunaBD(nome = "cor_rede")		//nome coluna no banco de dados
	@TipoDado(tipo = "String")			//Tipo de dados no banco			(String, Integer, Long)
	private String cor_rede;			//nome atributo da classe 			(qualquer)

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