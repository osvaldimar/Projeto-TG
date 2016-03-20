package br.com.vemev.modelo;

import br.com.vemev.dao.annotation.ColunaBD;
import br.com.vemev.dao.annotation.TabelaBD;
import br.com.vemev.dao.annotation.TipoDado;


@TabelaBD(nome = "rede")				//nome tabela no banco de dados
public class Rede {
	
	@ColunaBD(nome = "cor")
	@TipoDado(tipo = "String")
	private String cor;
	
	public Rede(){
		
	}

	public String getCor() {
		return cor;
	}

	public void setCor(String cor) {
		this.cor = cor;
	}
	
}