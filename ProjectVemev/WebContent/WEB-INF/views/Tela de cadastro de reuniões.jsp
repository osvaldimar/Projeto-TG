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
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/style.css" rel="stylesheet">
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
	<script src="/jquery-tableless/jquery.tablesorter.min.js"></script>
	<script src="/jquery-tableless/jquery.tablesorter.pager.js"></script>
	<link rel="stylesheet" href="/jquery-tableless/custom.css" media="screen"/>
</head>
<body> 
 <!-- Fixed navbar -->
  <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Vem e Vê</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="/home.html">Home</a></li>       
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Células <b class="caret"></b></a>
              <ul class="dropdown-menu">
             	<li class="dropdown-header">Admin das Células</li>
                <li><a href="/Tela de cadastro de Membros.html">Cadastro de Membro</a></li>
                <li><a href="/vemev/celula/cadastrarCelula">Cadastro de Célula</a></li>
                <li><a href="/Tela de cadastro do setor.html">Cadastro de Setor</a></li>
                <li><a href="/Tela de cadastro dos Visitantes.html">Cadastro de Visitante</a></li>
         		<li><a href="/vemev/reuniao/cadastrarReuniao">Cadastro de Reuniões</a></li>
                
              </ul>
            </li> 
            
             <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Líderes <b class="caret"></b></a>
              <ul class="dropdown-menu">
             	<li class="dropdown-header">Admin Líderes</li>
                <li><a href="/vemev/cadastro/liderCelula">Cadastro de Líder de Célula</a></li>
                 <li><a href="/vemev/cadastro/liderTreinamento">Cadastro de Líder em Treinamento</a></li>
                <li><a href="/vemev/cadastro/liderRede">Cadastro de Líder de Redes</a></li>
                 <li><a href="/vemev/lider/CadastrarLiderSetor">Cadastro de Líder de Setor</a></li>
                
              </ul>
            </li>   
            
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Consultas <b class="caret"></b></a>
              <ul class="dropdown-menu">
             	<li class="dropdown-header">Consultas</li>
                 <li><a href="/vemev/membro/consultaMembros">Consulta dos Membros</a></li>
                  <li><a href="/vemev/celula/consultaCelula">Consulta das Células</a></li>
                <li><a href="#">Consulta dos  Setores</a></li>
                 <li><a href="#">Consulta dos Visitantes</a></li>
                      <li class="divider">teste teste</li>
                <li><a href="#">Consulta dos  Líderes Célula</a></li>
                 <li><a href="#">Consulta dos Líderes em Treinamentos</a></li>
                <li><a href="/vemev/lider/consultaLiderRede">Consulta dos Líderes de Redes</a></li>
                 <li><a href="#">Consulta dos Líderes de Setor</a></li>
              </ul>
            </li> 
             <li><a href="#">Conheça a Visão MDA</a></li>
          </ul>

        </div><!--/.nav-collapse -->
        <div id="main" class="container-fluid">
 <h3 class="page-header">Cadastro das Reuniões</h3>
 <form action="/vemev/reuniao/createReuniao" method="post">
  <!-- area de campos do form -->
  <div class="row">
  <div class="col-md-12">
     <div class="form-group col-md-4">
     <label for="nome_celula">Célula</label>
			<select class="form-control" required="true" id="comboCelula" name="nome_celula" style="width: 250px;">
				<option value=""></option>
				<c:forEach var="lista" items="${listaTodasCelulas}">
					<option value="${lista.nome_celula}">${lista.nome_celula}</option>
				</c:forEach>
			</select>
 	<label for="dia_reuniao">Dia Da Célula</label>
        <select class="form-control" name="dia_reuniao" required="true">
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
       <label for="num_membros">Número de Membros</label>
       <input type="text" class="form-control" id="num_membros" name ="num_membros" required="true">
       
     </div>
     
 </div>

 
</div>
  
  
  <hr />
  <div id="actions" class="row">
    <div class="col-md-12">
      <button type="submit" class="btn btn-primary">Salvar</button>
      <a href="/home.html" class="btn btn-default">Cancelar</a>
    </div>
  </div>
</form>
</div>

<h6>
      <!-- Bootstrap core JavaScript
    ================================================== -->
      <!-- Placed at the end of the document so the pages load faster -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
     
      <script src="bootstrap.min.js"></script>
    </h6>
  </body>
</html>