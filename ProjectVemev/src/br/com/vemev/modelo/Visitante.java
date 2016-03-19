package br.com.vemev.modelo;

import br.com.vemev.dao.annotation.ColunaBD;
import br.com.vemev.dao.annotation.TabelaBD;
import br.com.vemev.dao.annotation.TipoDado;


@TabelaBD(nome = "visitante")				//nome tabela no banco de dados
public class Visitante {

	@ColunaBD(nome = "id_visit")
	@TipoDado(tipo = "Integer")
	private int id_visit;
	
	@ColunaBD(nome = "nome")
	@TipoDado(tipo = "String")
	private String nome;
    
    @ColunaBD(nome = "apelido")
	@TipoDado(tipo = "String")
	private String apelido;
    
    @ColunaBD(nome = "telefone")
	@TipoDado(tipo = "String")
	private String telefone;
    
    @ColunaBD(nome = "celular")
	@TipoDado(tipo = "String")
	private String celular;
    
    @ColunaBD(nome = "data_nascimento")
	@TipoDado(tipo = "String")
	private String data_nascimento;
    
    @ColunaBD(nome = "RG")
	@TipoDado(tipo = "String")
	private String RG;
    
    @ColunaBD(nome = "email")
	@TipoDado(tipo = "String")
	private String email;
    
    @ColunaBD(nome = "sexo")
	@TipoDado(tipo = "String")
	private String sexo;
    
    @ColunaBD(nome = "estado_civil")
	@TipoDado(tipo = "String")
	private String estado_civil;
    
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
    
    @ColunaBD(nome = "descricao_reuniao")
	@TipoDado(tipo = "String")
	private String descricao_reuniao;
    
    @ColunaBD(nome = "pertence_igreja")
	@TipoDado(tipo = "String")
	private String pertence_igreja;
    
    @ColunaBD(nome = "qual_igreja")
	@TipoDado(tipo = "String")
	private String qual_igreja;
    
    @ColunaBD(nome = "pertence_celula")
	@TipoDado(tipo = "String")
	private String pertence_celula;
    
    @ColunaBD(nome = "conhecer_celula")
	@TipoDado(tipo = "String")
	private String conhecer_celula;
    
    @ColunaBD(nome = "conhecer_jesus")
	@TipoDado(tipo = "String")
	private String conhecer_jesus;
    
    @ColunaBD(nome = "deseja_oracao")
	@TipoDado(tipo = "String")
	private String deseja_oracao;
    
    @ColunaBD(nome = "motivo_oracao")
	@TipoDado(tipo = "String")
	private String motivo_oracao;
    
    @ColunaBD(nome = "precisa_ajuda")
	@TipoDado(tipo = "String")
	private String precisa_ajuda;
    
    @ColunaBD(nome = "data_reuniao")
	@TipoDado(tipo = "String")
	private String data_reuniao;
    
    @ColunaBD(nome = "celula_culto")
	@TipoDado(tipo = "String")
    private String celula_culto;
	
	public Visitante(){
		
	}

	public int getId_visit() {
		return id_visit;
	}

	public void setId_visit(int id_visit) {
		this.id_visit = id_visit;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getApelido() {
		return apelido;
	}

	public void setApelido(String apelido) {
		this.apelido = apelido;
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

	public String getData_nascimento() {
		return data_nascimento;
	}

	public void setData_nascimento(String data_nascimento) {
		this.data_nascimento = data_nascimento;
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

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getEstado_civil() {
		return estado_civil;
	}

	public void setEstado_civil(String estado_civil) {
		this.estado_civil = estado_civil;
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

	public String getDescricao_reuniao() {
		return descricao_reuniao;
	}

	public void setDescricao_reuniao(String descricao_reuniao) {
		this.descricao_reuniao = descricao_reuniao;
	}

	public String getPertence_igreja() {
		return pertence_igreja;
	}

	public void setPertence_igreja(String pertence_igreja) {
		this.pertence_igreja = pertence_igreja;
	}

	public String getQual_igreja() {
		return qual_igreja;
	}

	public void setQual_igreja(String qual_igreja) {
		this.qual_igreja = qual_igreja;
	}

	public String getPertence_celula() {
		return pertence_celula;
	}

	public void setPertence_celula(String pertence_celula) {
		this.pertence_celula = pertence_celula;
	}

	public String getConhecer_celula() {
		return conhecer_celula;
	}

	public void setConhecer_celula(String conhecer_celula) {
		this.conhecer_celula = conhecer_celula;
	}

	public String getConhecer_jesus() {
		return conhecer_jesus;
	}

	public void setConhecer_jesus(String conhecer_jesus) {
		this.conhecer_jesus = conhecer_jesus;
	}

	public String getDeseja_oracao() {
		return deseja_oracao;
	}

	public void setDeseja_oracao(String deseja_oracao) {
		this.deseja_oracao = deseja_oracao;
	}

	public String getMotivo_oracao() {
		return motivo_oracao;
	}

	public void setMotivo_oracao(String motivo_oracao) {
		this.motivo_oracao = motivo_oracao;
	}

	public String getPrecisa_ajuda() {
		return precisa_ajuda;
	}

	public void setPrecisa_ajuda(String precisa_ajuda) {
		this.precisa_ajuda = precisa_ajuda;
	}

	public String getData_reuniao() {
		return data_reuniao;
	}

	public void setData_reuniao(String data_reuniao) {
		this.data_reuniao = data_reuniao;
	}

	public String getCelula_culto() {
		return celula_culto;
	}

	public void setCelula_culto(String celula_culto) {
		this.celula_culto = celula_culto;
	}
	
	
}
