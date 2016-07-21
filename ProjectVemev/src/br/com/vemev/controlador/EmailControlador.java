package br.com.vemev.controlador;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Controller;

import br.com.vemev.dao.LiderCelulaDAO;
import br.com.vemev.dao.MembroDAO;
import br.com.vemev.modelo.Celula;
import br.com.vemev.modelo.LiderCelula;
import br.com.vemev.modelo.Membro;
import br.com.vemev.modelo.Visitante;

@Controller
public class EmailControlador {
	
	static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(EmailControlador.class);	
	
	public void enviaEmailsParaLideresNormal(Celula celula, Visitante visitante, String km){
		if(celula != null && celula.getNome_celula() != null && !celula.getNome_celula().isEmpty()){
			String assunto = "App Vem vê - Notificação de Visitante";	//subject
			String htmlConteudo = "";		//layout html mensagem corpo email
			String msgTexto = ""; 			//mensagem alternativa caso caixa de entrada nao suporte HTML
			String msgConteudo = null;		//outro
			int idade = 0;
			
			try {
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				Date dataNasc = format.parse(visitante.getData_nascimento());
				idade = new Date().getYear() - dataNasc.getYear();
			} catch (ParseException e) {
				e.printStackTrace();
			}
			htmlConteudo = 
					  "<html><h2>Notificação de visitante próximo da célula - '" +celula.getNome_celula()+ "'</h2>"
					+ "<br><br>Olá Querido Líder<br>"
					+ "<br>Essa semana recebemos alguns visitantes e identificamos que um deles mora perto da célula '"
					+ celula.getNome_celula()+"', por favor, entre em contato com o visitante abaixo:"					
					+ "<br><br>Nome: "+visitante.getNome()
					+ "<br>Conhecido como: "+visitante.getApelido()
					+ "<br>Idade: "+idade
					+ "<br>Sexo: "+visitante.getSexo()
					+ "<br>Endereço: "+visitante.getEndereco()
					+ "<br>Telefone: "+visitante.getTelefone()
					+ "<br>Celular: "+visitante.getCelular()
					+ "<br>Distância entre a célula e o visitante: "+km
					+ "<br><br>Deus Abençoe."
					+ "</html>";
			
			msgTexto = "mensagem...";
			enviaEmailsParaLideres(celula, assunto, htmlConteudo, msgTexto, msgConteudo);	//envia email
		}
	}
	
	public void enviaEmailsParaLideresDelegarOutraCelula(Celula celula, Visitante visitante, String km, Celula celulaEncaminhou){
		if(celula != null && !celula.getNome_celula().isEmpty()){
			String assunto = "App Vem vê - Notificação de Visitante";	//subject
			String htmlConteudo = "";		//layout html mensagem corpo email
			String msgTexto = ""; 			//mensagem alternativa caso caixa de entrada nao suporte HTML
			String msgConteudo = null;		//outro
			int idade = 0;
			
			try {
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				Date dataNasc = format.parse(visitante.getData_nascimento());
				idade = new Date().getYear() - dataNasc.getYear();
			} catch (ParseException e) {
				e.printStackTrace();
			}
			htmlConteudo = 
					"<html><h2>Notificação de visitante direcionado para célula - '" +celula.getNome_celula()+ "'</h2>"
					+ "<br><br>Olá Querido Líder<br>"
					+ "<br>A célula '"+(celulaEncaminhou != null ? celulaEncaminhou.getNome_celula() : "N/A")+"' direcionou este visitante para sua célula "
					+ "por algum motivo especial, por favor, entre em contato com o visitante abaixo:"					
					+ "<br><br>Nome: "+visitante.getNome()
					+ "<br>Conhecido como: "+visitante.getApelido()
					+ "<br>Idade: "+idade
					+ "<br>Sexo: "+visitante.getSexo()
					+ "<br>Endereço: "+visitante.getEndereco()
					+ "<br>Telefone: "+visitante.getTelefone()
					+ "<br>Celular: "+visitante.getCelular()
					+ "<br>Distância entre a célula e o visitante: "+km
					+ "<br><br>Deus Abençoe."
					+ "</html>";
			
			msgTexto = "mensagem...";
			enviaEmailsParaLideres(celula, assunto, htmlConteudo, msgTexto, msgConteudo);	//envia email
		}
	}
	
	
	private void enviaEmailsParaLideres(Celula celula, String assunto, String htmlConteudo, String msgTexto, String msgConteudo){
			
		MembroDAO dao = new MembroDAO();			
		ArrayList<Membro> listaMembros = new ArrayList<Membro>();
		LiderCelulaDAO daoLider = new LiderCelulaDAO();
		ArrayList<LiderCelula> listaLideresCelula = daoLider.getListaLideresAtivo(celula.getNome_celula());

		for(LiderCelula l : listaLideresCelula){
			listaMembros.add(dao.read(l.getId_membro()));
		}
		
		if(!listaMembros.isEmpty()){
			//envia emails
			log.info("ENVIA EMAILS PARA OS MEMBROS DA CELULA: " +celula.getNome_celula()+ " ...");
			sendEmailDefault(listaMembros, assunto, htmlConteudo, msgTexto, msgConteudo);
		}else{
			log.warn("NAO ENVIOU EMAILS, LISTA MEMBROS VAZIA DA CELULA...");
		}
	}
	
	
	private static void sendEmailDefault(ArrayList<Membro> listaEmails, String assunto, String htmlConteudo, String msgTexto, String msgConteudo){
		
		String usuario = "mdacontatavisitantes@gmail.com";
		String senha = "P@ssw0rd6";
		String remetente = "mdacontatavisitantes@gmail.com";
		try {
			
			for(Membro membro : listaEmails){
				if(membro.getEmail() != null && !membro.getEmail().isEmpty()){
					log.info("Email [assunto: " +assunto+ " ] tentando... enviar para: " + membro.getEmail());
					
					/** Parametros de conexao com servidor Gmail */
					HtmlEmail email = new HtmlEmail(); 
					email.setHostName("smtp.gmail.com"); 		//servidor SMTP para envio do e-mail
					email.setFrom(remetente, "App Vem Vê"); 	// remetente
					//email.setSmtpPort(587);
					email.setSmtpPort(465);  
			        email.setAuthenticator(new DefaultAuthenticator(usuario, senha));  
			        email.setSSLOnConnect(true);	        
					email.setSSL(true);	   
					email.setTLS(true);			
					
					//destinatario
					email.addTo(membro.getEmail(), membro.getNome());
					email.setSubject(assunto);
					String htmlResponse = htmlConteudo;	//define usuario ex: Hello alguem
					email.setHtmlMsg(htmlResponse); 	//mensagem para o formato HTML				
					email.setTextMsg(msgTexto);			//mensagem alternativa caso nao suporte HTML				
					//email.setMsg(msgConteudo); 		//conteudo do e-mail	
					email.send();
					log.info("Email [assunto: " +assunto+ " ] enviado ok para: " + membro.getEmail());
				}else{
					log.warn("Email [assunto: " +assunto+ " ] nao enviado: email do membro("+membro.getNome()+") is null!");
				}
			}			
		} catch (EmailException e) {
			log.error("ERRO NO PROCESSO DE ENVIAR EMAIL!");
			log.error(e);
			e.printStackTrace();
		}		
	}
	
}
