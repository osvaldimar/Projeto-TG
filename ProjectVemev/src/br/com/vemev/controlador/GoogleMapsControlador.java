package br.com.vemev.controlador;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.Document;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.xml.sax.SAXException;

import br.com.vemev.dao.CelulaDAO;
import br.com.vemev.dao.LiderCelulaDAO;
import br.com.vemev.dao.MembroDAO;
import br.com.vemev.dao.VisitanteDAO;
import br.com.vemev.modelo.Celula;
import br.com.vemev.modelo.LiderCelula;
import br.com.vemev.modelo.Membro;
import br.com.vemev.modelo.Visitante;

@Controller
public class GoogleMapsControlador {

	
	@RequestMapping(value={"/geocalizacaoVisitante"})
	public void geocalizacaoVisitante(@RequestParam String origem, @RequestParam String destinos, HttpServletResponse response) throws IOException{		
		
		String km = calcularDistanciaKm(origem, destinos);
		
		//escreve o json na response para o browser
		response.getWriter().write(km);
		response.setStatus(200);
	}
	
	/** metodo calcula distancia entre orgem e os destinos e devolve a resposta em json para o browser*/
	@RequestMapping(value={"/calcularDistanciaJson"})
	public void calcularDistanciaJson(@RequestParam String origem, @RequestParam String destinos, HttpServletResponse response) throws IOException{
		
		//escreve o json na response para o browser
		response.getWriter().write(this.calcularDistanciaGoogleApis(origem, destinos));
		response.setStatus(200);
	}

	/** metodo calcula distancia entre orgem e os destinos e devolve um String com texto do km*/
	public String calcularDistanciaKm(String origem, String destinos){		
		
		//manipula json e retorna o km menor		 
		String km = "";
		try {
			//{oject1 "desti":[], "origin":[], "rows":[array1 {object2 "elements":[array2 {dest1 "distance":{object "text":"123 km", "value":123}, "duration":{object} },{dest2},{dest3}] } ], "status": "ok"}
			String json = this.calcularDistanciaGoogleApis(origem, destinos);
			JSONObject objJson = new JSONObject(json);
			JSONArray destinationsArray = objJson.getJSONArray("destination_addresses");			
			String status = objJson.getString("status");			
			JSONArray rowsArray = objJson.getJSONArray("rows");
			JSONObject objRow = rowsArray.getJSONObject(0);
			JSONArray elementsDestinosArray = objRow.getJSONArray("elements");
			
			//manipula json da distancia dos destinos
			if(elementsDestinosArray.length() >= 1){
				int posicaoDestinos = 0;		//representa a posicao dos enderecos do destino no array exemplo: ["barueri", "osasco"]
				int value = elementsDestinosArray.getJSONObject(0).getJSONObject("distance").getInt("value");		//value eh a distancia em inteiro
				String text = elementsDestinosArray.getJSONObject(0).getJSONObject("distance").getString("text");		//text eh a distancia como texto
				System.out.println("value: " + value + " - text: " + text);
				
				for(int i = 1; i < elementsDestinosArray.length(); i++){
					if(elementsDestinosArray.getJSONObject(i).getJSONObject("distance").getInt("value") < value){	//se a proxima distancia eh menor guarda os dados
						value = elementsDestinosArray.getJSONObject(i).getJSONObject("distance").getInt("value");
						text = elementsDestinosArray.getJSONObject(i).getJSONObject("distance").getString("text");
						posicaoDestinos = i;	//posicao do endereco de destino menor
					}
					System.out.println("value: " + elementsDestinosArray.getJSONObject(i).getJSONObject("distance").getInt("value") 
							+ " - text: " + elementsDestinosArray.getJSONObject(i).getJSONObject("distance").getString("text"));
				}
				
				System.out.println("***MENOR DISTANCIA >> value: " + value 
						+ " - text: " + text 
						+ " - posicao destino: " + posicaoDestinos 
						+ " - endereco: " + destinationsArray.getString(posicaoDestinos) + " ***\n");
				km = text;		//set km return
				
			}else{
				System.out.println("elementsDestinosArray is empty!");
			}
			
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return km;
	}	
	
	/** metodo acessa o web services do google maps e retorna uma String com dados em json
	 * @throws SAXException 
	 * @throws ParserConfigurationException */
	public String calcularDistanciaGoogleApis(String enderecoOrigem, String enderecoDestinos) {
				
		//regras de negocio		
		//exemplo: https://maps.googleapis.com/maps/api/distancematrix/json?origins=Seattle&destinations=San+Francisco|New+York&key=AIzaSyCXhk3-X2KZVP5GjpUqdzns4TcDUiKFtbo
		
		StringBuffer bufferJson = new StringBuffer();	//buffer para resposta
		try {
			String key = "key=AIzaSyCXhk3-X2KZVP5GjpUqdzns4TcDUiKFtbo";
			String urlMaps = "https://maps.googleapis.com/maps/api/distancematrix/json?"
					+ "origins="+URLEncoder.encode(enderecoOrigem, "utf-8")
					+"&destinations="+URLEncoder.encode(enderecoDestinos, "utf-8")+ "&" +key;
			
			URL url = new URL(urlMaps);
			HttpURLConnection conexao = (HttpURLConnection) url.openConnection();	//abre conexao com web services google
			conexao.setRequestProperty("Content-Type", "application/json");
			conexao.setRequestMethod("GET");
			conexao.setDoInput( true );
			conexao.connect();
            
            BufferedReader in = new BufferedReader(new InputStreamReader(conexao.getInputStream())); //ler dados de entrada
			String inputLine;
            while ((inputLine = in.readLine()) != null) {
            	bufferJson.append(inputLine);
            }
			in.close();            
		} catch (IOException e) {
			e.printStackTrace();
		}		
		return bufferJson.toString();	//retorna String com dados json
	}
	
	
	
	@RequestMapping(value={"/gerarRotasMapa"})
	public String gerarRotasMapa(@RequestParam String partida, @RequestParam String chegada, HttpServletRequest req, Model model) throws UnsupportedEncodingException{
		
		//recupera dados do visitante no banco de dados
		String idVisit = req.getParameter("idVisit");
		if(idVisit != null && !idVisit.isEmpty()){
			Visitante visitante = new VisitanteDAO().read(Integer.parseInt(idVisit));
			model.addAttribute("visitante", visitante);			//recupera dados do visitante no banco de dados
		}
		
		//recupera dados da celula no banco de dados
		String nomeCelula = req.getParameter("nome_celula");		
		Celula celula = null;
		if(nomeCelula != null && !nomeCelula.isEmpty()){
			nomeCelula = new String(nomeCelula.getBytes("iso-8859-1"), "UTF-8"); //parse utf-8
			celula = new CelulaDAO().read(nomeCelula);			//ler celula no bd
			model.addAttribute("celula", celula);				//add o objeto na view jsp
			
			//recupera dados dos Lideres da Celula
			LiderCelulaDAO daoLider = new LiderCelulaDAO();
			MembroDAO daoDoMembro = new MembroDAO();
			ArrayList<LiderCelula> listCel = daoLider.getListaLideresAtivo(nomeCelula); //lista lider celula 	
			ArrayList<Membro> listaLideresCelula = new ArrayList<Membro>();	//lista com dados do membro lider da celula
			for(LiderCelula l : listCel){
				Membro m = daoDoMembro.read(l.getId_membro());
				listaLideresCelula.add(m);
			}
			model.addAttribute("listaLideresCelula", listaLideresCelula);	//add o objeto na view jsp
		}
		
		String km = calcularDistanciaKm(partida, chegada);
		req.setAttribute("km", km);
		req.setAttribute("partida", new String(partida.getBytes("iso-8859-1"), "UTF-8"));
		req.setAttribute("chegada", new String(chegada.getBytes("iso-8859-1"), "UTF-8"));
		
		//direciona para jsp que mostra a rota no mapa do google
		return "/mapa.jsp?partida="+partida+"&chegada="+chegada;
	}
	
}
