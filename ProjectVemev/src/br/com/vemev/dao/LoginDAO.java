package br.com.vemev.dao;

import br.com.vemev.modelo.Login;

public class LoginDAO extends GenericDAO {
	
	/**
	 * Busca login pelo tipo de usuario
	 * @param nomeCelula
	 * @return
	 */
	public Login read(String tipo){
		String clausulaWhere = "tipo = '" + tipo + "'";			//busca utilizando a clausula where
		Login l = (Login) super.read(clausulaWhere, Login.class);
		return l;
	}
	
	/**
	 * Atualiza login para o tipo de usuario
	 * @param celula
	 */
	public void update(Login login){
		String clausulaWhere = "tipo = '" + login.getTipo() + "'";			//atualiza utilizando a clausula where
		super.update(login, clausulaWhere);
	}
	
}
