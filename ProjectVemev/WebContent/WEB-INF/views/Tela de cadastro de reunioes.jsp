<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Cadastro de Reuniões</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<link href="/css/style.css" rel="stylesheet">
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
	<script src="/jquery-tableless/jquery.tablesorter.min.js"></script>
	<script src="/jquery-tableless/jquery.tablesorter.pager.js"></script>
	<link rel="stylesheet" href="/jquery-tableless/custom.css" media="screen"/>
</head>
<body> 
 <!-- Fixed navbar -->
  <div class="navbar navbar-default" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Vem vê</a>
        </div>
        <div class="navbar-collapse collapse">
          	<!-- cabecalho default -->
			<%@include file="/cabecalho.jsp"%>
        </div>
        <!--/.nav-collapse -->
        
        <div id="main" class="container-fluid">
 <h3 class="page-header">Cadastro das Reuniões</h3>
 <form action="/vemev/reuniao/createReuniao" method="post">
  <!-- area de campos do form -->
  <div class="row">
  <div class="col-md-12">
     <div class="form-group col-md-4">
     <label for="nome_celula">Célula</label>
			<select class="form-control" required="true" id="comboCelula" name="nome_celula" style="max-width: 250px;">
				<option value=""></option>
				<c:forEach var="lista" items="${listaTodasCelulas}">
					<option value="${lista.nome_celula}">${lista.nome_celula}</option>
				</c:forEach>
			</select>
 	<label for="dia_reuniao">Dia da semana</label>
        <select class="form-control" name="dia_reuniao" required="true">
        	<option value =""></option>
        	<option value ="Segunda">Segunda</option>
            <option value ="Terça">Terça</option>
            <option value ="Quarta">Quarta</option>
           <option value ="Quinta">Quinta</option>
            <option value ="Sexta">Sexta</option>
           <option value ="Sábado">Sábado</option>
            <option value ="Domingo">Domingo</option>
          
        </select>
          <label for="num_visitantes">Número de Visitantes</label>
       <input type="text" class="form-control" id="num_visitantes" name = "num_visitantes" required="true">
    </div>
    
     <div class="form-group col-md-4">
       <label for="horario">Horário</label>
       <input type="time" class="form-control" id="horario" name ="horario" required="true">
       <label for="data_reuniao">Data</label>
       <input type="date" class="form-control" id="data_reuniao" name ="data_reuniao" required="true">
       <label for="num_membros">Número de Membros</label>
       <input type="text" class="form-control" id="num_membros" name ="num_membros" required="true">
       
     </div>
     
 </div>

 
</div>
  
  
  <hr />
  <div id="actions" class="row">
    <div class="col-md-12">
      <button type="submit" class="btn btn-primary">Salvar</button>
      <a href="/home.jsp" class="btn btn-default">Cancelar</a>
    </div>
  </div>
</form>
</div>

<h6>
      <!-- Bootstrap core JavaScript
    ================================================== -->
      <!-- Placed at the end of the document so the pages load faster -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    </h6>
    <div class="loader" id="loader"></div>
  </body>
</html>