<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Lista das células</title>    
</head>
<body>

	<h2>Lista de todas as células</h2>
    
    <table border="1">
    <thead>
    	<tr>
	    	<th>Nome da célula</th>    
	    	<th>Total membros</th>  
	    	<th>Endereço</th>
	    	<th>Bairro</th>
    		<th>Cep</th>
    		<th>Cidade</th>
    		<th>Esado</th>
    		<th>Complemento</th>
    	</tr>
    </thead>
    <tbody>
	    <c:forEach var="lista" items="${listaCelulas}">
	    	<tr>
	    		<td>${lista.nome_celula}</td>
	    		<td>${lista.total}</td>
	    		<td>${lista.endereco}</td>
	    		<td>${lista.bairro}</td>
	    		<td>${lista.cep}</td>
	    		<td>${lista.cidade}</td>
	    		<td>${lista.estado}</td>
	    		<td>${lista.complemento}</td>
	    	</tr>
	    </c:forEach>
    </tbody>
    </table>
    
    <script>
           $(document).ready(function() {
               $("#grid").kendoGrid({
                   height: 550,
                   sortable: true
               });
               
   		        $("#myTable").tablesorter(); 
   		    
           });
     </script>
</body>
</html>