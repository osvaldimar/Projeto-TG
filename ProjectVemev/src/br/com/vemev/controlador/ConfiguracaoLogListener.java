package br.com.vemev.controlador;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.PropertyConfigurator;

/**
 * Application Lifecycle Listener implementation class ConfiguracaoLogListener
 *
 */

public class ConfiguracaoLogListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public ConfiguracaoLogListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent event)  { 
    	ServletContext context = event.getServletContext();
		String path = System.getenv("OPENSHIFT_DATA_DIR");
		if(path == null){
			path = context.getRealPath("/");
		}
		String nameFile = "log4j.properties";
		if(path == null){
			path = context.getRealPath("/");
		}else{
			try {
				byte dados[] = ("Log da aplicacao no servidor openshift " +new Date().toString()+ "\n").getBytes();
				FileOutputStream f = new FileOutputStream(path + "LogSpringMVC.log", false);
				f.write(dados);
				f.close();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			
			String props = "log4j.rootLogger=INFO, file, stdout \n"
			+"log4j.appender.file=org.apache.log4j.RollingFileAppender \n"  
			+"log4j.appender.file.File=" +path+ "LogSpringMVC.log  \n"
			+"log4j.appender.file.MaxFileSize=2MB \n"
			+"log4j.appender.file.MaxBackupIndex=1  \n"
			+"log4j.appender.file.layout=org.apache.log4j.PatternLayout  \n"
			+"log4j.appender.file.layout.ConversionPattern=%d{yyyy-MM-dd HH:mm:ss} %-5p %c{1}:%L - %m%n  \n"  
			+"log4j.appender.stdout=org.apache.log4j.ConsoleAppender  \n"
			+"log4j.appender.stdout.Target=System.out  \n"
			+"log4j.appender.stdout.layout=org.apache.log4j.PatternLayout \n"  
			+"log4j.appender.stdout.layout.ConversionPattern=%d{yyyy-MM-dd HH:mm:ss} %-5p %c{1}:%L - %m%n  \n";
			System.out.println("props: \n" + props + "\n");			
			try {
				byte data[] = props.getBytes();
				FileOutputStream fout = new FileOutputStream(path + nameFile, false);
				fout.write(data);
				fout.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		//String log4jConfigLocation = context.getInitParameter("log4jConfigLocation");		
		PropertyConfigurator.configure(path + nameFile);
		System.out.println("CONFIG PATH LOG4J: " + path);
    }
	
}
