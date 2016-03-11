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
 <title>Cadastro dos Lideres das Células</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
 <link href="css/bootstrap.min.css" rel="stylesheet">
 <link href="css/style.css" rel="stylesheet">
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
            <li class="active"><a href="#">Home</a></li>       
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Células <b class="caret"></b></a>
              <ul class="dropdown-menu">
             	<li class="dropdown-header">Admin das Células</li>
                <li><a href="#">Cadastro das Células</a></li>
                <li><a href="#">Consulta das Células</a></li>
                <li class="divider"></li>
                <li><a href="#">Líder de célula</a></li>
                <li><a href="#">Líder de Setor</a></li>
              </ul>
            </li> 
            
             <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Themes <b class="caret"></b></a>
              <ul class="dropdown-menu">
             	<li class="dropdown-header">Admin & Dashboard</li>
                <li><a href="#">Admin 1</a></li>
                <li><a href="#">Admin 2</a></li>
                <li class="divider"></li>
                <li class="dropdown-header">Portfolio</li>
                <li><a href="#">Portfolio 1</a></li>
                <li><a href="#">Portfolio 2</a></li>
              </ul>
            </li>   
            
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Themes <b class="caret"></b></a>
              <ul class="dropdown-menu">
             	<li class="dropdown-header">Admin & Dashboard</li>
                <li><a href="#">Admin 1</a></li>
                <li><a href="#">Admin 2</a></li>
                <li class="divider"></li>
                <li class="dropdown-header">Portfolio</li>
                <li><a href="#">Portfolio 1</a></li>
                <li><a href="#">Portfolio 2</a></li>
              </ul>
            </li> 
             <li><a href="#">ConheÃ§a a VisÃ£o MDA</a></li>
          </ul>
        </div><!--/.nav-collapse -->
        <div id="main" class="container-fluid">
 <h3 class="page-header">Cadastro dos Lideres das Células</h3>
 <form action="index.html">
  <!-- area de campos do form -->

<div class="container-fluid">


<c:forEach var="lista" items="${listaMembros}">
  <div class="row">
    <div class="col-sm-3" style="background-color:lavender;">${lista.nome}   </div>
    <div class="col-sm-3" style="background-color:lightcyan;">${lista.telefone}</div>
    <div class="col-sm-3" style="background-color:lightgray;">${lista.endereco}</div>
    <div class="col-sm-3" style="background-color:lavenderblush;">${lista.bairro}</div>
  </div>
</c:forEach>

   
  
  
  <hr />
  <div id="actions" class="row">
    <div class="col-md-12">
      <button type="submit" class="btn btn-primary">Salvar</button>
      <a href="index.html" class="btn btn-default">Cancelar</a>
    </div>
  </div>
</form>
</div>

<h6>
      <!-- Bootstrap core JavaScript
    ================================================== -->
      <!-- Placed at the end of the document so the pages load faster -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
     
      <script src="js/bootstrap.min.js"></script>
    </h6>
  </body>
</html>