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
	<title>Consulta dos Líderes</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/style.css" rel="stylesheet">
	
	<!-- Magnific Popup core JS CSS file -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<link rel="stylesheet" href="/jquery-magnific-popup/magnific-popup.css"> 
	<script src="/jquery-magnific-popup/jquery.magnific-popup.js"></script>
	
	<style type="text/css">
	.rede table {
    	border: 1px solid lightgrey;
    	overflow-y: scroll;
    	width: 100%;
    	background-color: #fff; 
	}
	.rede table td, table th {
	    padding: 0.3em;
	    border: 1px solid lightgrey;
	}
	.rede table th {
	    border: 1px solid grey;
	}
	.rede{
		border: 1px solid lightgrey;
		width: 100%; 
		vertical-align: text-top; 
		padding: 6px;
		-moz-border-radius:10px;
		-webkit-border-radius:10px;
 		border-radius:10px;
	}
	.rede-verde{
		background-color: #00cc00; 
		width: 100%; 
		height: 50px; 
		color: white; 
		padding: 1%; 
		font-size: 24px;"
		-moz-border-radius:10px;
		-webkit-border-radius:10px;
 		border-radius:10px;
	}
	.rede-vermelho{
		background-color: #cc0000; 
		width: 100%; 
		height: 50px; 
		color: white; 
		padding: 1%; 
		font-size: 24px;"
		-moz-border-radius:10px;
		-webkit-border-radius:10px;
 		border-radius:10px;
	}
	.rede-azul{
		background-color: #0033ff; 
		width: 100%; 
		height: 50px; 
		color: white; 
		padding: 1%; 
		font-size: 24px;"
		-moz-border-radius:10px;
		-webkit-border-radius:10px;
 		border-radius:10px;
	}
	.rede-amarelo{
		background-color: #ffcc00; 
		width: 100%; 
		height: 50px; 
		color: white; 
		padding: 1%; 
		font-size: 24px;"
		-moz-border-radius:10px;
		-webkit-border-radius:10px;
 		border-radius:10px;
	}
		
	</style>
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
          <a class="navbar-brand" href="#">Vem e Vê</a>
        </div>
        <div class="navbar-collapse collapse">
        	<!-- cabecalho default -->
			<%@include file="/cabecalho.jsp"%>
        </div><!--/.nav-collapse -->
        
        <div id="main" class="container-fluid">
 <h3 class="page-header">Gerenciar Rede</h3>
 <h4 class="page-header">Consulta e alteração dos líderes</h4>
 <form action="index.html">
  <!-- area de campos do form -->

<div class="container-fluid">


	<div class="rede">
		<div class="rede-verde">
			Lideres - Rede Verde
		</div>
		<br>
		<table class="table-verde">
			<thead>
    			<tr>
        			<th width="30%">Nome Líder</th>
        			<th width="20%">Telefone</th>
        			<th width="15%">Data inicio</th>
        			<th width="15%">Data fim</th>
        			<th width="10%">Status</th>
        			<th width="10%">Ação</th>
    			</tr>
			</thead>
			<tbody>
				<c:forEach items="${listaLideres}" var="lista">
					<c:if test="${lista.get('lider_rede').get('cor_rede') eq 'Verde'}">
	    			<tr>
	        			<td>${lista.get("membro").get("nome")}</td>
	        			<td>${lista.get("membro").get("telefone")}</td>
	        			<td>${lista.get("lider_rede").get("data_ini")}</td>
	        			<td>${lista.get("lider_rede").get("data_fim")}</td>
	        			<td>${lista.get("lider_rede").get("status_lider")}</td>
	        			<td>
			    			<c:if test="${lista.get('lider_rede').get('status_lider') eq 'Ativo'}">
		        				<a class="popup-with-form" href="#alterar-form" 
		        					onclick="alterarLider('${lista.get('lider_rede').get('id_lider')}');">
				    				Alterar
				    			</a>
			    			</c:if>
	        			</td>
	        		</tr>
	        		</c:if>
        		</c:forEach>
        	</tbody>
    	</table>
	</div>
	
	<br><br><br>
	
	<div class="rede">
		<div class="rede-azul">
			Lideres - Rede Azul
		</div>
		<br>
		<table class="table-azul">
			<thead>
    			<tr>
        			<th width="30%">Nome Líder</th>
        			<th width="20%">Telefone</th>
        			<th width="15%">Data inicio</th>
        			<th width="15%">Data fim</th>
        			<th width="10%">Status</th>
        			<th width="10%">Ação</th>
    			</tr>
			</thead>
			<tbody>
    			<c:forEach items="${listaLideres}" var="lista">
					<c:if test="${lista.get('lider_rede').get('cor_rede') eq 'Azul'}">
	    			<tr>
	        			<td>${lista.get("membro").get("nome")}</td>
	        			<td>${lista.get("membro").get("telefone")}</td>
	        			<td>${lista.get("lider_rede").get("data_ini")}</td>
	        			<td>${lista.get("lider_rede").get("data_fim")}</td>
	        			<td>${lista.get("lider_rede").get("status_lider")}</td>
	        			<td>
	        				<c:if test="${lista.get('lider_rede').get('status_lider') eq 'Ativo'}">
		        				<a class="popup-with-form" href="#alterar-form" 
		        					onclick="alterarLider('${lista.get('lider_rede').get('id_lider')}');">
				    				Alterar
				    			</a>
			    			</c:if>
	        			</td>
	        		</tr>
	        		</c:if>
        		</c:forEach>
        	</tbody>
    	</table>
	</div>
	
	<br><br><br>
	
	<div class="rede">
		<div class="rede-vermelho">
			Lideres - Rede Vermelha
		</div>
		<br>
		<table>
			<thead>
    			<tr>
        			<th width="30%">Nome Líder</th>
        			<th width="20%">Telefone</th>
        			<th width="15%">Data inicio</th>
        			<th width="15%">Data fim</th>
        			<th width="10%">Status</th>
        			<th width="10%">Ação</th>
    			</tr>
			</thead>
			<tbody>
    			<c:forEach items="${listaLideres}" var="lista">
					<c:if test="${lista.get('lider_rede').get('cor_rede') eq 'Vermelho'}">
	    			<tr>
	        			<td>${lista.get("membro").get("nome")}</td>
	        			<td>${lista.get("membro").get("telefone")}</td>
	        			<td>${lista.get("lider_rede").get("data_ini")}</td>
	        			<td>${lista.get("lider_rede").get("data_fim")}</td>
	        			<td>${lista.get("lider_rede").get("status_lider")}</td>
	        			<td>
	        				<c:if test="${lista.get('lider_rede').get('status_lider') eq 'Ativo'}">
		        				<a class="popup-with-form" href="#alterar-form" 
		        					onclick="alterarLider('${lista.get('lider_rede').get('id_lider')}');">
				    				Alterar
				    			</a>
			    			</c:if>
	        			</td>
	        		</tr>
	        		</c:if>
        		</c:forEach>
        	</tbody>
    	</table>
	</div>
	
	<br><br><br>
	
	<div class="rede">
		<div class="rede-amarelo">
			Lideres - Rede Amarela
		</div>
		<br>
		<table>
			<thead>
    			<tr>
        			<th width="30%">Nome Líder</th>
        			<th width="20%">Telefone</th>
        			<th width="15%">Data inicio</th>
        			<th width="15%">Data fim</th>
        			<th width="10%">Status</th>
        			<th width="10%">Ação</th>
    			</tr>
			</thead>
			<tbody>
	    		<c:forEach items="${listaLideres}" var="lista">
					<c:if test="${lista.get('lider_rede').get('cor_rede') eq 'Amarelo'}">
	    			<tr>
	        			<td>${lista.get("membro").get("nome")}</td>
	        			<td>${lista.get("membro").get("telefone")}</td>
	        			<td>${lista.get("lider_rede").get("data_ini")}</td>
	        			<td>${lista.get("lider_rede").get("data_fim")}</td>
	        			<td>${lista.get("lider_rede").get("status_lider")}</td>
	        			<td>
	        				<c:if test="${lista.get('lider_rede').get('status_lider') eq 'Ativo'}">
		        				<a class="popup-with-form" href="#alterar-form" 
		        					onclick="alterarLider('${lista.get('lider_rede').get('id_lider')}');">
				    				Alterar
				    			</a>
			    			</c:if>
	        			</td>
	        		</tr>
	        		</c:if>
        		</c:forEach>
        	</tbody>
    	</table>
	</div>
		
    
</div>
 
  <hr />
  
</form>
</div>

<!-- form para alterar um lider -->
<form id="alterar-form" class="mfp-hide white-popup" action="/vemev/lider/alterarStatusLider" method="get" style="width: 400px;">
	<div style="font-weight: 600; font-size: 16px;">
		Alterar Status do Lider para 'Inativo'
	</div>
	<br>
	Escolha a data final do Lider na Rede.
	<br><br>
	<label for="data">Data final</label>
    <input type="date" class="form-control" id="date" name="data_fim" style ="width: 200px" required="true">
	<br><br><br>
	<div id="actions" class="row">
	    <div class="col-md-12">
	      <button type="submit" class="btn btn-primary">Salvar</button>
	      <a onclick="closePopup()" class="btn btn-default">Cancelar</a>
	    </div>
  	</div>
	<input type="hidden" id="id_lider" name="id_lider" value="">
</form>

<h6>
      <!-- Bootstrap core JavaScript
    ================================================== -->
      <!-- Placed at the end of the document so the pages load faster -->
     <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> -->
      <script src="/js/submenus-bootstrap.js"></script>
    </h6>
    
    <br><br>
    
 
   
<br><br>
</div>
</div>

<script>			

	//funcao para alterar status inativo do lider
	function alterarLider(id){
		$('#id_lider').val(id);		//passa o id do lider para alterar o status
	}

	//maginific-poup
	$(document).ready(function() {
		$('.popup-with-form').magnificPopup({
			type: 'inline',
			preloader: false,	
		});
	})
	
	function closePopup(){
	  var magnificPopup = $.magnificPopup.instance; 
	  magnificPopup.close(); 
	}
</script>
  </body>
</html>