<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
 <meta charset="utf-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <title>Cadastro dos Setores</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
 <link href="css/bootstrap.min.css" rel="stylesheet">
 <link href="css/style.css" rel="stylesheet">
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
        </div><!--/.nav-collapse -->
        
        <div id="main" class="container-fluid">
 <h3 class="page-header">Cadastro dos Setores</h3>
 <form action="/vemev/setor/createSetor" method="post">
  <!-- area de campos do form -->
  <div class="row">
  <div class="col-md-12">
     <div class="form-group col-md-4">
       <label for="nome_setor">Nome do Setor</label>
       <input type="text" class="form-control" id="nome_setor" name="nome_setor" required="true">
    </div>
    
     <div class="form-group col-md-4">
      <label for="cor_rede">Redes</label>
        <select class="form-control" name="cor_rede" required="true">
        	<option></option>
        	<option>Amarelo</option>
            <option>Azul</option>
            <option>Vermelho</option>
            <option>Verde</option>
        </select>
       
     </div>
     
 </div>
    
</div>
  
  
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
      <script src="/js/submenus-bootstrap.js"></script>
    </h6>
    <div class="loader" id="loader"></div>
  </body>
</html>