package br.com.vemev.modelo;

import br.com.vemev.dao.annotation.ColunaBD;
import br.com.vemev.dao.annotation.TabelaBD;
import br.com.vemev.dao.annotation.TipoDado;

@TabelaBD(nome = "reuniao")
public class Reuniao {

	@ColunaBD(nome = "id_reuniao")		//nome coluna no banco de dados
	@TipoDado(tipo = "Integer")			//Tipo de dados no banco			(String, Integer, Long)
	private Integer id_reuniao;	
	
	@ColunaBD(nome = "horario")
	@TipoDado(tipo = "String")
	private String horario;	
	
	@ColunaBD(nome = "dia_reuniao")
	@TipoDado(tipo = "String")	
	private String dia_reuniao;	
	
	@ColunaBD(nome = "data_reuniao")
	@TipoDado(tipo = "String")	
	private String data_reuniao;	
	
	@ColunaBD(nome = "num_visitantes")
	@TipoDado(tipo = "Integer")	
	private Integer num_visitantes;
	
	@ColunaBD(nome = "num_membros")
	@TipoDado(tipo = "Integer")	
	private Integer num_membros;
	
	@ColunaBD(nome = "nome_celula")
	@TipoDado(tipo = "String")	
	private String nome_celula;

	public Integer getId_reuniao() {
		return id_reuniao;
	}

	public void setId_reuniao(Integer id_reuniao) {
		this.id_reuniao = id_reuniao;
	}

	public String getHorario() {
		return horario;
	}

	public void setHorario(String horario) {
		this.horario = horario;
	}

	public String getDia_reuniao() {
		return dia_reuniao;
	}

	public void setDia_reuniao(String dia_reuniao) {
		this.dia_reuniao = dia_reuniao;
	}

	public Integer getNum_visitantes() {
		return num_visitantes;
	}

	public void setNum_visitantes(Integer num_visitantes) {
		this.num_visitantes = num_visitantes;
	}

	public Integer getNum_membros() {
		return num_membros;
	}

	public void setNum_membros(Integer num_membros) {
		this.num_membros = num_membros;
	}

	public String getNome_celula() {
		return nome_celula;
	}

	public void setNome_celula(String nome_celula) {
		this.nome_celula = nome_celula;
	}

	public String getData_reuniao() {
		return data_reuniao;
	}

	public void setData_reuniao(String data_reuniao) {
		this.data_reuniao = data_reuniao;
	}
	
}

