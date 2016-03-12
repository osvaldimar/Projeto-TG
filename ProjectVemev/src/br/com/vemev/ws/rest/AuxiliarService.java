package br.com.vemev.ws.rest;

import javax.ws.rs.core.Response;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class AuxiliarService {

	/**
	 * Metodo da classe AuxiliarService converte qualquer objeto ou lista em formato json 
	 *  e retorna resposta http com status 200
	 * @param src (List, Object)
	 * @return Ex: [ {"chave1": valor1, "chave2": valor2} ]
	 */
	public static Response responseOK_toJson(Object src){
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();		//Gson google para conversao
		String json = gson.toJson(src);									//converte em json
		System.out.println("Response ok toJon: " + json.toString());
		return Response.status(200).entity(json.toString()).build();	//retorna Response json + http status 200
		
	}
	
	/**
	 * Metodo da classe AuxiliarService converte json em qualquer Objeto java Ex: {"chave": valor1} >> atributochave=valor1
	 * @param json (json em String)
	 * @param clazz (Tipo objeto para retornar)
	 * @return
	 */
	public static Object converteJsonParaObjetoJava(String json, Class clazz){
		
		try {
			
			Object objetoJava = clazz.newInstance();						//instancia a classe qualquer
			Gson gson = new GsonBuilder().setPrettyPrinting().create();		//Gson google para conversao
			objetoJava = gson.fromJson(json, clazz);						//converte json para objeto java
			System.out.println("Converte json para java: " + objetoJava.toString());
			
			return objetoJava;
		} catch (InstantiationException | IllegalAccessException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
}
