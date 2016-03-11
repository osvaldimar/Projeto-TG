package br.com.vemev.modelo;

import br.com.vemev.dao.annotation.ColunaBD;
import br.com.vemev.dao.annotation.TabelaBD;
import br.com.vemev.dao.annotation.TipoDado;


@TabelaBD(nome = "celula")				//nome tabela no banco de dados
public class Celula {

	@ColunaBD(nome = "nome_celula")		//nome coluna no banco de dados
	@TipoDado(tipo = "String")			//Tipo de dados no banco			(String, Integer, Long)
	private String nome_celula;			//nome atributo da classe 			(qualquer)
	
	@ColunaBD(nome = "total")
	@TipoDado(tipo = "Integer")
	private Integer total;
	
	@ColunaBD(nome = "id_setor")
	@TipoDado(tipo = "Integer")
	private Integer id_setor;
	
	@ColunaBD(nome = "endereco")
	@TipoDado(tipo = "String")
	private String endereco;
	
	@ColunaBD(nome = "bairro")
	@TipoDado(tipo = "String")
	private String bairro;
	
	@ColunaBD(nome = "cep")
	@TipoDado(tipo = "String")
	private String cep;
	
	@ColunaBD(nome = "cidade")
	@TipoDado(tipo = "String")
	private String cidade;
	
	@ColunaBD(nome = "estado")
	@TipoDado(tipo = "String")
	private String estado;
	
	@ColunaBD(nome = "complemento")
	@TipoDado(tipo = "String")
	private String complemento;
	
	public Celula(){
		
	}

	public String getNome_celula() {
		return nome_celula;
	}

	public void setNome_celula(String nome_celula) {
		this.nome_celula = nome_celula;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public Integer getId_setor() {
		return id_setor;
	}

	public void setId_setor(Integer id_setor) {
		this.id_setor = id_setor;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}
	
}
