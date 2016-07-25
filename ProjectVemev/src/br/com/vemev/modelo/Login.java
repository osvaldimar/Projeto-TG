package br.com.vemev.modelo;

import br.com.vemev.dao.annotation.ColunaBD;
import br.com.vemev.dao.annotation.TabelaBD;
import br.com.vemev.dao.annotation.TipoDado;


@TabelaBD(nome = "login")				//nome tabela no banco de dados
public class Login {
	
	@ColunaBD(nome = "tipo")
	@TipoDado(tipo = "String")
	private String tipo;
	
	@ColunaBD(nome = "username")
	@TipoDado(tipo = "String")
	private String username;
	
	@ColunaBD(nome = "senha")
	@TipoDado(tipo = "String")
	private String senha;
	
	public Login(){
		
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
	
}