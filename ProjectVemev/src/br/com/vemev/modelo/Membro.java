package br.com.vemev.modelo;

import br.com.vemev.dao.annotation.ColunaBD;
import br.com.vemev.dao.annotation.TabelaBD;
import br.com.vemev.dao.annotation.TipoDado;


@TabelaBD(nome = "membro")				//nome tabela no banco de dados
public class Membro {

	@ColunaBD(nome = "id_membro")		//nome coluna no banco de dados
	@TipoDado(tipo = "Integer")			//Tipo de dados no banco			(String, Integer, Long)
	private Integer id_membro;			//nome atributo da classe 			(qualquer)
	
	@ColunaBD(nome = "nome")
	@TipoDado(tipo = "String")
	private String nome;
	
	@ColunaBD(nome = "telefone")
	@TipoDado(tipo = "String")
	private String telefone;
    
    @ColunaBD(nome = "celular")
	@TipoDado(tipo = "String")
	private String celular;
    
    @ColunaBD(nome = "endereco")
	@TipoDado(tipo = "String")
	private String endereco; 
    
    @ColunaBD(nome = "bairro")
	@TipoDado(tipo = "String")
	private String bairro;
    
    @ColunaBD(nome = "cep")
	@TipoDado(tipo = "String")
	private String cep;
    
    @ColunaBD(nome = "estado")
	@TipoDado(tipo = "String")
	private String estado;
    
    @ColunaBD(nome = "cidade")
	@TipoDado(tipo = "String")
	private String cidade;
    
    @ColunaBD(nome = "complemento")
	@TipoDado(tipo = "String")
    private String complemento;	
	
    @ColunaBD(nome = "RG")
	@TipoDado(tipo = "String")
    private String RG;
    
    @ColunaBD(nome = "email")
	@TipoDado(tipo = "String")
    private String email;
    
	public Membro(){
		
	}

	public Integer getId_membro() {
		return id_membro;
	}

	public void setId_membro(Integer id_membro) {
		this.id_membro = id_membro;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getCelular() {
		return celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
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

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getRG() {
		return RG;
	}

	public void setRG(String RG) {
		this.RG = RG;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
