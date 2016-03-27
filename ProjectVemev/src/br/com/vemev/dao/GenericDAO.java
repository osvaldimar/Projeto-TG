package br.com.vemev.dao;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData; 
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.aop.ThrowsAdvice;

import br.com.vemev.dao.annotation.ColunaBD;
import br.com.vemev.dao.annotation.TabelaBD;
import br.com.vemev.dao.annotation.TipoDado;

public abstract class GenericDAO {
	
	public GenericDAO(){
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}catch (ClassNotFoundException e){
			e.printStackTrace();
		}
	}
	
	protected Connection getConnection() throws SQLException{
		
		//usuario, senha, url bd
		String usuario = "root";
		String senha = "root";
		String url = "jdbc:mysql://localhost/db_vemev";
		
		Connection conexao = DriverManager.getConnection(url, usuario, senha);
		
		return conexao;		//retorna conexao do banco de dados
	}
	
	/**
	 * Metodo salva o objeto no banco de dados, os atributos com valores sao convertidos para as colunas da tabela
	 * @param object - Objeto deve conter as anotocoes na classe: TabelaBD, ColunaBD e TipoDado
	 * @return
	 */
	protected void create(Object object){
		
		String tabela = "";
		TabelaBD tabelaBD = object.getClass().getAnnotation(TabelaBD.class);
		if(tabelaBD != null && !tabelaBD.nome().equals("")){
			tabela = tabelaBD.nome();
		}else{
			try {
				throw new Exception();
			} catch (Exception e) {
				System.out.println("ERRO NOME DA TABELA NAO DECLARADO!!!");
				e.printStackTrace();
			}
		}
		
		//HashMap para popular os dados de modo generico para qualquer tipo de objeto (<coluna>, <tipo de dado, valor>)
		HashMap<String, HashMap<String, Object>> mapStmtValores = new HashMap<String, HashMap<String, Object>>();
		
		//identifica cada atributo do objeto para setar o nome da coluna no mapa de colunas e valores
		for(Field atributo : object.getClass().getDeclaredFields()) {	
			try {
				atributo.setAccessible(true);
				Object value = atributo.get(object);
				if(value != null){
					ColunaBD coluna = atributo.getAnnotation(ColunaBD.class);	//@ColunaDB nome da coluna no banco de dados
					TipoDado tipoDado = atributo.getAnnotation(TipoDado.class);	//@TipoDdo nome do tipo de dados da coluna no banco de dados					
					if(coluna != null && !coluna.nome().equals("")){
						if(tipoDado != null && !tipoDado.tipo().equals("")){
							HashMap<String, Object> valores = new HashMap<String, Object>();
							//tipo de dados = (String, Integer, Boolean) e value = proprio valor 
							valores.put("tipo", tipoDado.tipo());
							valores.put("valor", value);
							mapStmtValores.put(coluna.nome(), valores); //(coluna no banco de dados, valores=(Tipo de dado, valor))
						}
					}
				}
				
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}				
		}
		
		//se conter dados
		if(!mapStmtValores.isEmpty()){
			
			//prepara query sql correspondente a tabela e colunas do objeto
			String sql = "insert into " + tabela;
			String colunasInsert = "";
			String valuesInsert = "";
			for(String coluna : mapStmtValores.keySet()){	
				if(colunasInsert.isEmpty()){
					colunasInsert += " (" + coluna;
					valuesInsert += " (?";
				}else{
					colunasInsert += ", " + coluna;
					valuesInsert += ",?";
				}
			}
			sql += colunasInsert + ") values" + valuesInsert + ")";
			System.out.println("PRINT SQL INSERT: " + sql);
			
			Connection conexao = null;
			PreparedStatement stmt = null;
			try {
				conexao = this.getConnection();
				stmt = conexao.prepareStatement(sql);
				
				//valores
				System.out.println("Dados insert: ");
				int cont = 1;
				for(String coluna : mapStmtValores.keySet()){					
					String tipoDado = (String) mapStmtValores.get(coluna).get("tipo");	
					
					if(tipoDado.equals("String")){
						String valor = (String) mapStmtValores.get(coluna).get("valor");
						stmt.setString(cont, valor);
						cont++;
						System.out.println("Coluna: " +coluna+ " - tipo: " +tipoDado+ " - valor: " +valor);
					}else if(tipoDado.equals("Integer")){
						Integer valor = (Integer) mapStmtValores.get(coluna).get("valor");
						stmt.setInt(cont, valor);
						cont++;
						System.out.println("Coluna: " +coluna+ " - tipo: " +tipoDado+ " - valor: " +valor);
					}else if(tipoDado.equals("Long")){
						Long valor = (Long) mapStmtValores.get(coluna).get("valor");
						stmt.setLong(cont, valor);
						cont++;
						System.out.println("Coluna: " +coluna+ " - tipo: " +tipoDado+ " - valor: " +valor);
					}else{
						try {
							throw new Exception();
						} catch (Exception e) {
							System.out.println("ERRO TIPO DE DADOS NAO DECLARADOS!!!");
							e.printStackTrace();
						}
					}
				}
				
				//executa no banco de dados
				stmt.execute();
				System.out.println("O REGISTRO FOI CRIADO COM SUCESSO NO BANCO DE DADOS!!\n");
				
				//finaliza conexao
				stmt.close();
				conexao.close();
			} catch (SQLException e) {
				System.out.println("ERRO DE CONEXAO COM BANCO DE DADOS!!!");
				e.printStackTrace();
			} finally {
				try{
					if(stmt != null){
						stmt.close();
					}
					if(conexao != null){
						conexao.close();
					}
				}catch (Exception e){
					System.out.println("ERRO DE CONEXAO COM BANCO DE DADOS!!!");
					e.printStackTrace();
				}
			}
		}else{
			System.out.println("NENHUM REGISTRO FOI CRIADO NO BANCO DE DADOS, OBJETO NULL!!!");
		}
	}

	/**
	 * Metodo retorna um objeto populado com um registro do banco de dados
	 * @param clausulaWhere String - Exemplo parametro: "id = 123" ou "nome = 'teste'" ...
	 * @param clazz Class - Exemplo parametro: Celula.class ou Setor.class ...
	 * @return
	 */
	protected Object read(String clausulaWhere, Class clazz){
		
		//tabela
		String tabela = "";
		Object obj = null;
		try {
			obj = clazz.newInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
		TabelaBD tabelaBD = obj.getClass().getAnnotation(TabelaBD.class);
		if(tabelaBD != null && !tabelaBD.nome().equals("")){
			tabela = tabelaBD.nome();
		}else{
			try {
				throw new Exception();
			} catch (Exception e) {
				System.out.println("ERRO NOME DA TABELA NAO DECLARADO!!!");
				e.printStackTrace();
			}
		}
		
		//SQL
		String sql = "select * from " + tabela + " where " + clausulaWhere;
		System.out.println("PRINT SQL SELECT: " + sql);
		
		Connection conexao = null;
		PreparedStatement stmt = null;
		try {
			//execute query select
			conexao = this.getConnection();
			stmt = conexao.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			System.out.println("Dados select "+tabela+": ");
			if(rs.next()){
				Object object = clazz.newInstance();	
				for(Field atributo : object.getClass().getDeclaredFields()) {						
					atributo.setAccessible(true);
					ColunaBD coluna = atributo.getAnnotation(ColunaBD.class);
					TipoDado tipoDado = atributo.getAnnotation(TipoDado.class);
					if(coluna != null && !coluna.nome().equals("")){
						if(tipoDado != null && !tipoDado.tipo().equals("")){
							
							//seta os valores das colunas do registro no atributo do objeto	correspondente ao tipo de dado
							if(tipoDado.tipo().equals("String")){
								String valor = rs.getString(coluna.nome());
								atributo.set(object, valor);	
								System.out.println("Coluna: " +coluna.nome()+ " - tipo: " +tipoDado.tipo()+ " - valor: " +valor);
							
							}else if(tipoDado.tipo().equals("Integer")){
								Integer valor = rs.getInt(coluna.nome());
								atributo.set(object, valor);	
								System.out.println("Coluna: " +coluna.nome()+ " - tipo: " +tipoDado.tipo()+ " - valor: " +valor);
							
							}else if(tipoDado.tipo().equals("Long")){
								Long valor = rs.getLong(coluna.nome());
								atributo.set(object, valor);
								System.out.println("Coluna: " +coluna.nome()+ " - tipo: " +tipoDado.tipo()+ " - valor: " +valor);
							}
						}
					}
				}
				System.out.println("\n");
				return object;
			}
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try{
				if(stmt != null){
					stmt.close();
				}
				if(conexao != null){
					conexao.close();
				}
			}catch (Exception e){
				System.out.println("ERRO DE CONEXAO COM BANCO DE DADOS!!!");
				e.printStackTrace();
			}
		}
		
		return null;
	}
	
	/**
	 * Metodo atualiza o objeto no banco de dados, os atributos com valores sao convertidos para as colunas da tabela
	 * Passar uma String como parametro para comparar a coluna e valor (clausulaWhere) para achar o registro no banco de dados e alterar
	 * @param object - Objeto deve conter as anotocoes na classe: TabelaBD, ColunaBD e TipoDado
	 * @param clausulaWhere String - Exemplo parametro: "id = 123" ou "nome = 'teste'" ...
	 * @return
	 */
	protected void update(Object object, String clausulaWhere){
		
		String tabela = "";
		TabelaBD tabelaBD = object.getClass().getAnnotation(TabelaBD.class);
		if(tabelaBD != null && !tabelaBD.nome().equals("")){
			tabela = tabelaBD.nome();
		}else{
			try {
				throw new Exception();
			} catch (Exception e) {
				System.out.println("ERRO NOME DA TABELA NAO DECLARADO!!!");
				e.printStackTrace();
			}
		}		
		
		//HashMap para popular os dados de modo generico para qualquer tipo de objeto (<coluna>, <tipo de dado, valor>)
		HashMap<String, HashMap<String, Object>> mapStmtValores = new HashMap<String, HashMap<String, Object>>();
		
		//identifica cada atributo do objeto para setar o nome da coluna no mapa de colunas e valores
		for(Field atributo : object.getClass().getDeclaredFields()) {	
			try {
				atributo.setAccessible(true);
				Object value = atributo.get(object);
				if(value != null){
					ColunaBD coluna = atributo.getAnnotation(ColunaBD.class);	//@ColunaDB nome da coluna no banco de dados
					TipoDado tipoDado = atributo.getAnnotation(TipoDado.class);	//@TipoDdo nome do tipo de dados da coluna no banco de dados					
					if(coluna != null && !coluna.nome().equals("")){
						if(tipoDado != null && !tipoDado.tipo().equals("")){
							HashMap<String, Object> valores = new HashMap<String, Object>();
							//tipo de dados = (String, Integer, Boolean) e value = proprio valor 
							valores.put("tipo", tipoDado.tipo());
							valores.put("valor", value);
							mapStmtValores.put(coluna.nome(), valores); //(coluna no banco de dados, valores=(Tipo de dado, valor))
						}
					}
				}
				
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}				
		}
		
		//se conter dados
		if(!mapStmtValores.isEmpty()){
			
			//prepara query sql correspondente a tabela e colunas do objeto
			String sql = "update " + tabela + " set ";
			String colunasUpdate = "";
			for(String coluna : mapStmtValores.keySet()){	
				if(colunasUpdate.isEmpty()){
					colunasUpdate += coluna + "=?";
				}else{
					colunasUpdate += ", " + coluna + "=?";
				}
			}
			//clausula Where
			sql += colunasUpdate + " where " + clausulaWhere;
			System.out.println("PRINT SQL UPDATE: " + sql);
			
			Connection conexao = null;
			PreparedStatement stmt = null;
			try {
				conexao = this.getConnection();
				stmt = conexao.prepareStatement(sql);
				
				//valores
				System.out.println("Dados update "+tabela+": ");
				int cont = 1;
				for(String coluna : mapStmtValores.keySet()){					
					String tipoDado = (String) mapStmtValores.get(coluna).get("tipo");	
					
					if(tipoDado.equals("String")){
						String valor = (String) mapStmtValores.get(coluna).get("valor");
						stmt.setString(cont, valor);
						cont++;
						System.out.println("Coluna: " +coluna+ " - tipo: " +tipoDado+ " - valor: " +valor);
					}else if(tipoDado.equals("Integer")){
						Integer valor = (Integer) mapStmtValores.get(coluna).get("valor");
						stmt.setInt(cont, valor);
						cont++;
						System.out.println("Coluna: " +coluna+ " - tipo: " +tipoDado+ " - valor: " +valor);
					}else if(tipoDado.equals("Long")){
						Long valor = (Long) mapStmtValores.get(coluna).get("valor");
						stmt.setLong(cont, valor);
						cont++;
						System.out.println("Coluna: " +coluna+ " - tipo: " +tipoDado+ " - valor: " +valor);
					}else{
						try {
							throw new Exception();
						} catch (Exception e) {
							System.out.println("ERRO TIPO DE DADOS NAO DECLARADOS!!!");
							e.printStackTrace();
						}
					}
				}
				
				//executa no banco de dados
				stmt.executeUpdate();
				System.out.println("O REGISTRO FOI ATUALIZADO COM SUCESSO NO BANCO DE DADOS!!\n");
				
				//finaliza conexao
				stmt.close();
				conexao.close();
			} catch (SQLException e) {
				System.out.println("ERRO DE CONEXAO COM BANCO DE DADOS!!!");
				e.printStackTrace();
			} finally {
				try{
					if(stmt != null){
						stmt.close();
					}
					if(conexao != null){
						conexao.close();
					}
				}catch (Exception e){
					System.out.println("ERRO DE CONEXAO COM BANCO DE DADOS!!!");
					e.printStackTrace();
				}
			}
		}else{
			System.out.println("NENHUM REGISTRO FOI ATUALIZADO NO BANCO DE DADOS, OBJETO NULL!!!");
		}
	}

	/**
	 * Metodo deleta um registro no banco de dados.
	 * Passar uma String como parametro para comparar a coluna e valor (clausulaWhere) para achar o registro no banco de dados e deletar
	 * @param clausulaWhere String - Exemplo parametro: "id = 123" ou "nome = 'teste'" ...
	 * @param clazz Class - Exemplo parametro: Celula.class ou Setor.class ...
	 * @return
	 */
	protected boolean delete(String clausulaWhere, Class clazz){
		
		//tabela
		String tabela = "";
		Object obj = null;
		try {
			obj = clazz.newInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
		TabelaBD tabelaBD = obj.getClass().getAnnotation(TabelaBD.class);
		if(tabelaBD != null && !tabelaBD.nome().equals("")){
			tabela = tabelaBD.nome();
		}else{
			try {
				throw new Exception();
			} catch (Exception e) {
				System.out.println("ERRO NOME DA TABELA NAO DECLARADO!!!");
				e.printStackTrace();
			}
		}
		
		//SQL
		String sql = "delete from " + tabela + " where " + clausulaWhere;
		System.out.println("PRINT SQL DELETE: " + sql);
		
		Connection conexao = null;
		PreparedStatement stmt = null;
		try {
			conexao = this.getConnection();
			stmt = conexao.prepareStatement(sql);
			int count = stmt.executeUpdate();
			boolean ok = count > 0;
			if(ok){
				System.out.println("DADOS DELETADO COM SUCESSO!!!\n");
			}else{
				System.out.println("NAO ACHOU REGISTRO NO BD PARA DELETAR!!!\n");
			}
			return ok;
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			try{
				if(stmt != null){
					stmt.close();
				}
				if(conexao != null){
					conexao.close();
				}
			}catch (Exception e){
				System.out.println("ERRO DE CONEXAO COM BANCO DE DADOS!!!");
				e.printStackTrace();
			}
		}
		return false;
	}
	
	/**
	 * Metodo retorna uma lista de objetos populados com os registros do banco de dados
	 * @param clausulaWhere String - Exemplo parametro: "id = 123" ou "nome = 'teste' and id=123 or ..."
	 * @param clazz Class - Exemplo parametro: Celula.class ou Setor.class ...
	 * @return
	 */
	protected ArrayList getList(String clausulaWhere, Class clazz){
		return getList(clausulaWhere, clazz, false);
	}
	
	/**
	 * Metodo retorna uma lista de objetos populados com os registros do banco de dados
	 * @param clausulaSqlJoin String - Exemplo parametro: "select * from tabela1 join tabela2 where ..."
	 * @param clazz Class - Exemplo parametro: Celula.class ou Setor.class ...
	 * @return
	 */
	protected ArrayList getListSqlJoin(String clausulaSqlJoin, Class clazz){
		return getList(clausulaSqlJoin, clazz, true);
	}	
	

	/**
	 * Se selectJoin eh false - Metodo fornece um select simples em uma tabela(classe informada no parametro) com clausula where se necessario
	 * Se selectJoin eh true - Metodo fornece um select complexo com joins e where, porem retorna dados para uma tabela(classe informada no parametro)
	 */
	private ArrayList getList(String clausulaWhere, Class clazz, boolean selectJoin){
		
		//tabela
		String tabela = "";
		Object obj = null;
		try {
			obj = clazz.newInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
		TabelaBD tabelaBD = obj.getClass().getAnnotation(TabelaBD.class);
		if(tabelaBD != null && !tabelaBD.nome().equals("")){
			tabela = tabelaBD.nome();
		}else{
			try {
				throw new Exception();
			} catch (Exception e) {
				System.out.println("ERRO NOME DA TABELA NAO DECLARADO!!!");
				e.printStackTrace();
			}
		}
		
		//SQL
		String sql = "";
		if(selectJoin == true){
			sql = clausulaWhere;		//select complexo com joins
		}else{
			//select simples em uma tabela
			if(clausulaWhere.equals("")){
				sql = "select * from " + tabela;
			}else{
				sql = "select * from " + tabela + " where " + clausulaWhere;
			}
		}
		System.out.println("PRINT SQL LIST SELECT: " + sql);
		ArrayList lista = new ArrayList<>();
		
		Connection conexao = null;
		PreparedStatement stmt = null;
		try {
			//execute query select
			conexao = this.getConnection();
			stmt = conexao.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				System.out.println("Dados list select "+tabela+": ");
				Object object = clazz.newInstance();	
				for(Field atributo : object.getClass().getDeclaredFields()) {						
					atributo.setAccessible(true);
					ColunaBD coluna = atributo.getAnnotation(ColunaBD.class);
					TipoDado tipoDado = atributo.getAnnotation(TipoDado.class);
					if(coluna != null && !coluna.nome().equals("")){
						if(tipoDado != null && !tipoDado.tipo().equals("")){
							
							//seta os valores das colunas do registro no atributo do objeto	correspondente ao tipo de dado
							if(tipoDado.tipo().equals("String")){
								String valor = rs.getString(coluna.nome());
								atributo.set(object, valor);	
								System.out.println("Coluna: " +coluna.nome()+ " - tipo: " +tipoDado.tipo()+ " - valor: " +valor);
							
							}else if(tipoDado.tipo().equals("Integer")){
								Integer valor = rs.getInt(coluna.nome());
								atributo.set(object, valor);	
								System.out.println("Coluna: " +coluna.nome()+ " - tipo: " +tipoDado.tipo()+ " - valor: " +valor);
							
							}else if(tipoDado.tipo().equals("Long")){
								Long valor = rs.getLong(coluna.nome());
								atributo.set(object, valor);
								System.out.println("Coluna: " +coluna.nome()+ " - tipo: " +tipoDado.tipo()+ " - valor: " +valor);
							}
						}
					}
				}
				System.out.println();
				//add objeto na lista
				lista.add(object);
			}
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try{
				if(stmt != null){
					stmt.close();
				}
				if(conexao != null){
					conexao.close();
				}
			}catch (Exception e){
				System.out.println("ERRO DE CONEXAO COM BANCO DE DADOS!!!");
				e.printStackTrace();
			}
		}
		
		return lista;
	}


	/**
	 * Metodo retorna uma lista de registros do banco de dados conforme o sql avancado, pode conter varias tabelas e colunas no sql
	 * @param sql String - Exemplo parametro: select t1.id_membro, t1.nome, t2.nome_celula from membro as t1 join celula as t2 ...
	 * @return ArrayList<HashMap<String, HashMap<String, String>>> - Ex: lista.get(posicao).get(key).get(key) >> lista.get(0).get("tabela").get("coluna") ...
	 * 		lista.get(1).get("membro").get("nome");           traz o valor do nome do membro
	 * 		lista.get(1).get("celula").get("nome_celula");    traz o valor do nome da celula
	 */
	protected ArrayList<HashMap<String, HashMap<String, String>>> getListSqlAvancado(String sql){
		
		//SQL
		System.out.println("PRINT SQL SELECT AVANCADO: " + sql);
		ArrayList<HashMap<String, HashMap<String, String>>> lista = new ArrayList<HashMap<String, HashMap<String, String>>>();
		
		Connection conexao = null;
		PreparedStatement stmt = null;
		try {
			//execute query select
			conexao = this.getConnection();
			stmt = conexao.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			System.out.println("Dados list select:");
			while(rs.next()){
				HashMap<String, HashMap<String, String>> linhaRegistro = new HashMap<String, HashMap<String, String>>();				
				ResultSetMetaData rsmd = rs.getMetaData();  	//MetaDados das tabelas e colunas
			    int numColumns = rsmd.getColumnCount();			//contador de colunas do select
			    
			    for (int i=1; i<numColumns+1; i++) {  
			    	String columnName = rsmd.getColumnName(i);  //nome da coluna
			    	String tableName = rsmd.getTableName(i);  	//nome da tabela
			    	Object objeto = rs.getObject(i);			//detalhe: tipo generico pode ser String, Integer, Long, Date, Time
			    	String valor = null;
			    	if(objeto != null){
			    		valor = objeto.toString();				//Qualquer tipo sera transformado em String
			    	}
			    	System.out.printf("Tabela: %s - coluna: %s - valor: %s", tableName, columnName, valor);
			    	System.out.println();
			    	
			    	//Exemplo recuperar dados: lista(posicaoRegistro)<"nomeTabela", <"nomeColuna", valorColuna>>
			    	//lista.get(1).get("membro").get("nome");           traz o valor do nome do membro
			    	//lista.get(1).get("celula").get("nome_celula");    traz o valor do nome da celula
			    	
			    	if(linhaRegistro.containsKey(tableName)){
			    		HashMap<String, String> mapColumnAndValue = linhaRegistro.get(tableName);	//hashmap para guardar coluna e valor
			    		mapColumnAndValue.put(columnName, valor);				//add no hashmap a 'coluna=valor'
			    		linhaRegistro.put(tableName, mapColumnAndValue);		//add na linha de registro a 'tabela=hashmap'
			    	}else{
			    		HashMap<String, String> mapColumnAndValue = new HashMap<String, String>();	//hashmap para guardar coluna e valor
			    		mapColumnAndValue.put(columnName, valor);				//add no hashmap a 'coluna=valor'
			    		linhaRegistro.put(tableName, mapColumnAndValue);		//add na linha de registro a 'tabela=hashmap'
			    	}
			    }					
				System.out.println();
				
				lista.add(linhaRegistro);	//add cada linha de registro na lista
			}
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try{
				if(stmt != null){
					stmt.close();
				}
				if(conexao != null){
					conexao.close();
				}
			}catch (Exception e){
				System.out.println("ERRO DE CONEXAO COM BANCO DE DADOS!!!");
				e.printStackTrace();
			}
		}
		
		return lista;
	}
}