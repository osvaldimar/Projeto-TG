<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.io.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LOG SERVER...</title>
</head>
<body>
<h3>LOG SERVER - PROJETO VEM VE...</h3><br>log property: ${logfile.name}<br>

	<%
		String path = System.getenv("OPENSHIFT_DATA_DIR");
		if(path == null){
			path = request.getServletContext().getRealPath("/");
		}
		if(path == null){
			path = request.getServletContext().getRealPath("/");
		}else{
			byte data[] = "Log da aplicacao no servidor openshift\n".getBytes();
			FileOutputStream fout = new FileOutputStream(path + "LogSpringMVC.log", true);
			fout.write(data);
			fout.close();
		}
		String str = "";		
		File file = new File(path, "LogSpringMVC.log");
	    InputStream is = new FileInputStream(file);
	    try {
	        BufferedReader reader = new BufferedReader(new InputStreamReader(is));
	        if (is != null) {                            
	            while ((str = reader.readLine()) != null) { 
	            	out.print(str + "<BR>");        
	            }                
	        }
	    } catch(Exception e){
			e.printStackTrace();
		}
	    
	    File file1 = new File(path, "log4j.properties");
	    InputStream is1 = new FileInputStream(file1);
	    try {
	        BufferedReader reader = new BufferedReader(new InputStreamReader(is1));
	        if (is != null) {                            
	            while ((str = reader.readLine()) != null) { 
	            	out.print(str + "<BR>");        
	            }                
	        }
	    } catch(Exception e){
			e.printStackTrace();
		}
	%>
</body>
</html>