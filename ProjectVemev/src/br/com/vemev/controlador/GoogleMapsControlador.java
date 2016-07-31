package br.com.vemev.controlador;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

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
import br.com.vemev.dao.ContataVisitanteDAO;
import br.com.vemev.dao.LiderCelulaDAO;
import br.com.vemev.dao.MembroDAO;
import br.com.vemev.dao.VisitanteDAO;
import br.com.vemev.modelo.Celula;
import br.com.vemev.modelo.ContataVisitante;
import br.com.vemev.modelo.LiderCelula;
import br.com.vemev.modelo.Membro;
import br.com.vemev.modelo.Visitante;

@Controller
public class GoogleMapsControlador {

	static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(GoogleMapsControlador.class);
	
	/**
	 * Metodo realiza o processo de geocalizacao, 
	 * consome o web service google maps,
	 * calcula qual a celula mais proxima do visitante,
	 * envia email para os lideres da celula
	 * @param v
	 */
	public static void iniciarProcessoDeGeocalizacaoEEmail(final Visitante v){
		
		Thread run = new Thread(new Runnable(){
			@Override
			public void run() {
				
				if(v != null){
					log.info("\nRUN THREAD... START iniciarProcessoDeGeocalizacaoEEmail() - id_visit = "+v.getId_visit());
					
					//ACESSA WEB SERVICE DA GOOGLE
					String origem = v.getEndereco() +" "+ v.getCidade() +" "+ v.getCep() +" "+ v.getEstado();
					StringBuilder destinos = new StringBuilder();
					CelulaDAO dao = new CelulaDAO();
					ArrayList<Celula> lista = dao.getLista();
					for(int i = 0; i < lista.size(); i++){
						Celula c = lista.get(i);
						destinos.append(c.getEndereco() +" "+ c.getCidade() +" "+ c.getCep() +" "+ c.getEstado());
						if(i != lista.size()-1){
							destinos.append("|");
						}
					}
					log.info("Geocalizacao: id_visit = "+v.getId_visit() + "origem: " + origem + "\ndestinos: " + destinos);
					GoogleMapsControlador maps = new GoogleMapsControlador();
					HashMap<String, String> valores = maps.calcularDistanciaKm(origem, destinos.toString());
					String km = valores.get("text");
					//String value = valores.get("value");					
					Celula celulaRes = new Celula();
					try{	
						Integer posicaoDestinos = Integer.parseInt(valores.get("posicaoDestinos"));	
						celulaRes = lista.get(posicaoDestinos);
					}catch(Exception e){
						log.error(e);
						log.error("WARNING GEOCALIZACAO - Endereco visitante nao confere ou operacao indisponivel, celula N/A");
					}
					//grava dados iniciais de contato do visitante e celula responsavel
					log.info("PROCESSO SALVA AGENDA DE CONTATO DO VISITANTE");
					ContataVisitanteDAO contatoDAO = new ContataVisitanteDAO();
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					ContataVisitante contato = new ContataVisitante();
					contato.setData_criado(format.format(new Date()));		//data agora
					contato.setData_agendado(null);
					contato.setId_membro(null);
					contato.setId_visit(v.getId_visit());
					contato.setStatus_contato("Não contatado");
					contato.setObservacao(null);
					contato.setNome_celula(celulaRes.getNome_celula());
					contatoDAO.create(contato);
					
					//ENVIA EMAIL PARA LIDERES DA CELULA
					log.info("PROCESSO ENVIA EMAIL PARA LIDERES DA CELULA!" + celulaRes.getNome_celula());
					EmailControlador email = new EmailControlador();
					email.enviaEmailsParaLideresNormal(celulaRes, v, km);						
					
					log.info("RUN THREAD... END iniciarProcessoDeGeocalizacaoEEmail() - id_visit = "+v.getId_visit()+"\n");
				}else{
					log.error("\nRUN THREAD... iniciarProcessoDeGeocalizacaoEEmail() - Erro Visitante is null!\n");
				}
			}
		});
		run.start();		
	}
	
	/**
	 * Metodo realiza o processo de geocalizacao, 
	 * consome o web service google maps,
	 * calcula qual a celula mais proxima do visitante,
	 * envia email para os lideres da celula
	 * @param v
	 */
	public static void iniciarProcessoDeGeocalizacaoEEmailDelegar(final Visitante v, final Celula c, final Celula celulaAnterior){
		
		Thread run = new Thread(new Runnable(){
			@Override
			public void run() {
				
				if(v != null){
					log.info("\nRUN THREAD... START iniciarProcessoDeGeocalizacaoEEmailDelegar() - id_visit = "+v.getId_visit());
					
					//ACESSA WEB SERVICE DA GOOGLE
					String origem = v.getEndereco() +" "+ v.getCidade() +" "+ v.getCep() +" "+ v.getEstado();
					String destinos = c.getEndereco() +" "+ c.getCidade() +" "+ c.getCep() +" "+ c.getEstado();
						
					log.info("Geocalizacao: id_visit = "+v.getId_visit() + "origem: " + origem + "\ndestinos: " + destinos);
					GoogleMapsControlador maps = new GoogleMapsControlador();
					HashMap<String, String> valores = maps.calcularDistanciaKm(origem, destinos.toString());
					String km = valores.get("text");
					
					//ENVIA EMAIL PARA LIDERES DA CELULA
					EmailControlador email = new EmailControlador();
					email.enviaEmailsParaLideresDelegarOutraCelula(c, v, km, celulaAnterior);					
					
					log.info("RUN THREAD... END iniciarProcessoDeGeocalizacaoEEmailDelegar() - id_visit = "+v.getId_visit()+"\n");
				}else{
					log.error("\nRUN THREAD... iniciarProcessoDeGeocalizacaoEEmailDelegar() - Erro Visitante is null!\n");
				}
			}
		});
		run.start();		
	}
	
	
	@RequestMapping(value={"/geocalizacaoVisitante"})
	public void geocalizacaoVisitante(@RequestParam String origem, @RequestParam String destinos, HttpServletResponse response) throws IOException{		
		
		String km = calcularDistanciaKm(origem, destinos).get("text");
		
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
	public HashMap<String, String> calcularDistanciaKm(String origem, String destinos){		
		
		//manipula json e retorna o km menor		 
		String km = "";
		int posicaoDestinos = 0;		//representa a posicao dos enderecos do destino no array exemplo: ["barueri", "osasco"]
		int value = 0;
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
				posicaoDestinos = 0;		//representa a posicao dos enderecos do destino no array exemplo: ["barueri", "osasco"]
				value = elementsDestinosArray.getJSONObject(0).getJSONObject("distance").getInt("value");		//value eh a distancia em inteiro
				String text = elementsDestinosArray.getJSONObject(0).getJSONObject("distance").getString("text");		//text eh a distancia como texto
				log.info("value: " + value + " - text: " + text);
				
				for(int i = 1; i < elementsDestinosArray.length(); i++){
					if(elementsDestinosArray.getJSONObject(i).getJSONObject("distance").getInt("value") < value){	//se a proxima distancia eh menor guarda os dados
						value = elementsDestinosArray.getJSONObject(i).getJSONObject("distance").getInt("value");
						text = elementsDestinosArray.getJSONObject(i).getJSONObject("distance").getString("text");
						posicaoDestinos = i;	//posicao do endereco de destino menor
					}
					log.info("value: " + elementsDestinosArray.getJSONObject(i).getJSONObject("distance").getInt("value") 
							+ " - text: " + elementsDestinosArray.getJSONObject(i).getJSONObject("distance").getString("text"));
				}
				
				log.info("***MENOR DISTANCIA >> value: " + value 
						+ " - text: " + text 
						+ " - posicao destino: " + posicaoDestinos 
						+ " - endereco: " + destinationsArray.getString(posicaoDestinos) + " ***\n");
				km = text;		//set km return
				
				
			}else{
				log.info("elementsDestinosArray is empty!");
			}
			
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HashMap<String, String> valores = new HashMap<String, String>();
		valores.put("text", km);
		valores.put("value", Integer.toString(value));
		valores.put("posicaoDestinos", Integer.toString(posicaoDestinos));		
		return valores;
	}	
	
	/** 
	 * metodo acessa o web services do google maps e retorna uma String com dados em json
	 */
	public String calcularDistanciaGoogleApis(String enderecoOrigem, String enderecoDestinos) {
				
		//exemplo: https://maps.googleapis.com/maps/api/distancematrix/json?
		//origins=Seattle&destinations=San+Francisco|New+York&key=AIzaSyCXhk3-X2KZVP5GjpUqdzns4TcDUiKFtbo
		
		StringBuilder builderJson = new StringBuilder();
		try {
			String key = "key=AIzaSyCXhk3-X2KZVP5GjpUqdzns4TcDUiKFtbo";					  //chave de acesso gerada no Google Developers Console
			String urlMaps = "https://maps.googleapis.com/maps/api/distancematrix/json?"  //url api google + enderecos origem e destinos 
					+ "origins="+URLEncoder.encode(enderecoOrigem, "utf-8")
					+"&destinations="+URLEncoder.encode(enderecoDestinos, "utf-8")+ "&" +key;
			
			URL url = new URL(urlMaps);
			HttpURLConnection conexao = (HttpURLConnection) url.openConnection();		  //abre conexao com web services google
			conexao.setRequestProperty("Content-Type", "application/json");
			conexao.setRequestMethod("GET");
			conexao.setDoInput( true );
			conexao.connect();
            
            BufferedReader in = new BufferedReader(new InputStreamReader(conexao.getInputStream())); //ler dados de entrada
			String inputLine;
            while ((inputLine = in.readLine()) != null) {
            	builderJson.append(inputLine);
            }
			in.close();            
		} catch (IOException e) {
			e.printStackTrace();
		}		
		return builderJson.toString();	//retorna String com dados em json
	}
	
	
	
	@RequestMapping(value={"/gerarRotasMapa"})
	public String gerarRotasMapa(@RequestParam String idVisit, @RequestParam String nomeCelula, HttpServletRequest req, Model model) throws UnsupportedEncodingException{
		
		//recupera dados do visitante no banco de dados
		Visitante visitante = null;
		if(idVisit != null && !idVisit.isEmpty()){
			visitante = new VisitanteDAO().read(Integer.parseInt(idVisit));
			model.addAttribute("visitante", visitante);			//recupera dados do visitante no banco de dados
		}
		
		//recupera dados da celula no banco de dados
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
		
		String partida = "";
		String chegada = "";
		if(visitante != null && celula != null){
			partida = visitante.getEndereco() +" "+ visitante.getCidade() +" "+ visitante.getCep() +" "+ visitante.getEstado();
			chegada = celula.getEndereco() +" "+ celula.getCidade() +" "+ celula.getCep() +" "+ celula.getEstado();
			String km = calcularDistanciaKm(partida, chegada).get("text");
			req.setAttribute("km", km);
			req.setAttribute("partida", new String(partida.getBytes("iso-8859-1"), "UTF-8"));
			req.setAttribute("chegada", new String(chegada.getBytes("iso-8859-1"), "UTF-8"));
		}
		
		//direciona para jsp que mostra a rota no mapa do google
		return "/mapa.jsp?partida="+partida+"&chegada="+chegada;
	}
	
}
