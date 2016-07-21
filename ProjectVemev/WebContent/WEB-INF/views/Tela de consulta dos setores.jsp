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
	.rede-Verde{
		background-color: #00cc00; 
		width: 100%; 
		height: 30px;
		color: white;
		font-weight: 600;
		padding: 1%;
		font-size: 16px;
		padding: 6px;
		-moz-border-radius:5px;
		-webkit-border-radius:5px;
 		border-radius:5px;
	}
	.rede-Vermelho{
		background-color: #cc0000; 
		width: 100%; 
		height: 30px;
		color: white;
		font-weight: 600;
		padding: 1%;
		font-size: 16px;
		padding: 6px;
		-moz-border-radius:5px;
		-webkit-border-radius:5px;
 		border-radius:5px;
	}
	.rede-Azul{
		background-color: #0033ff; 
		width: 100%; 
		height: 30px;
		color: white;
		font-weight: 600;
		padding: 1%;
		font-size: 16px;
		padding: 6px;
		-moz-border-radius:5px;
		-webkit-border-radius:5px;
 		border-radius:5px;
	}
	.rede-Amarelo{
		background-color: #ffcc00; 
		width: 100%; 
		height: 30px;
		color: white;
		font-weight: 600;
		padding: 1%;
		font-size: 16px;
		padding: 6px;
		-moz-border-radius:5px;
		-webkit-border-radius:5px;
 		border-radius:5px;
	}
	.divSetor{
		width: 300px; 
		height: auto; 
		color: black; 
		padding: 1%; 
		font-size: 14px;
		border: 1px solid lightgrey;
		vertical-align: text-top; 
		padding: 6px;
		margin-right: 10px;
		margin-top: 10px;
		float: left;
		-moz-border-radius:10px;
		-webkit-border-radius:10px;
 		border-radius:10px;
 		background-color: #fff;
	}
	.divTitulo{
		width: 100%; 
		height: 30px;
		color: white;
		font-weight: 600;
		padding: 1%;
		font-size: 16px;
		padding: 6px;
		-moz-border-radius:5px;
		-webkit-border-radius:5px;
 		border-radius:5px;
	}
	.corTitulo-Verde{
		background-color: #00cc00; 
	}
	.corTitulo-Azul{
		background-color: #0033ff; 
	}
	.corTitulo-Vermelho{
		background-color: #cc0000; 
	}
	.corTitulo-Amarelo{
		background-color: #ffcc00;
	}
	</style>
	<!-- configuracao do layout da grid -->
	<style type="text/css">
		@media screen and (min-width:861px) {
		 #divGridOcultar {
		    display: none;
		 }
		}
		@media screen and (max-width:860px) {
		 #table-lider-setor tr > *:nth-child(2){
		    display: none;
		 }
		 #divGridOcultar {
		    display: block;
		 }
		 #table-lider-setor, #table-celulas-setor{
		 	font-size: 11px;
		 }
		 #table-lider-setor thead tr th, #table-celulas-setor thead tr th{	
		 	font-size: 11px;
		 }
		 .container-fluid{margin-right:-1%;margin-left:-1%;padding-left:0%;padding-right:0%}
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
          <a class="navbar-brand" href="#">Vem vê</a>
        </div>
        <div class="navbar-collapse collapse">
        	<!-- cabecalho default -->
			<%@include file="/cabecalho.jsp"%>
        </div><!--/.nav-collapse -->
        
        <div id="main" class="container-fluid">
 <h3 class="page-header">Consulta dos Setores</h3>

<div class="container-fluid">
	
	<form action="/vemev/setor/consultaSetor" method="get">
	
		<br>		
		<label for="comboCelula">Escolha o Setor:</label><br>
		<div class="form-inline">
			<select class="form-control" required="true" id="comboCelula" name="id_setor" style="width: 250px;">
				<option value=""></option>
				<c:forEach var="lista" items="${listaSetores}">
					<option value="${lista.id_setor}">${lista.cor_rede} - ${lista.nome_setor}</option>
				</c:forEach>
			</select>
		    <button type="submit" class="btn btn-primary form-control" style="max-width: 100px;">Buscar</button>
	    </div>
	</form>  
  	<hr>
	<br>
	
	<c:if test="${setor != null}">
		<div class="divSetor">
			<div class="divTitulo corTitulo-${setor.cor_rede}">Detalhes do Setor</div><br>
			<b>Nome:</b> ${setor.nome_setor}<br>
			<b>Rede:</b> ${setor.cor_rede}<br><br>
			<a class="popup-with-form" href="#alterarSetor-form" onclick="alterarSetor('${setor.id_setor}');">
				Alterar dados
			</a>
		</div>
		<div style="clear: both; width: 100%;"> </div>
		<br><br>
		
		<div class="rede">
			<div class="rede-${setor.cor_rede}">
				Lideres - Setor ${setor.nome_setor}
			</div>
			<br>
			<table id="table-lider-setor">
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
					<c:forEach items="${listaLideresSetor}" var="lista">
						<c:if test="${lista.get('lider_setor').id_setor eq setor.id_setor}">
		    			<tr>
		        			<td>${lista.get("membro").get("nome")}</td>
		        			<td>${lista.get("membro").get("telefone")}</td>
		        			<td>${lista.get("lider_setor").get("data_ini")}</td>
		        			<td>${lista.get("lider_setor").get("data_fim")}</td>
		        			<td>${lista.get("lider_setor").get("status_lider")}</td>
		        			<td>
				    			<c:if test="${lista.get('lider_setor').get('status_lider') eq 'Ativo'}">
			        				<a class="popup-with-form" href="#alterar-form" 
			        					onclick="alterarLider('${lista.get('lider_setor').get('id_lider')}');">
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
		<br><br>
		
		<div class="rede">
			<div class="rede-${setor.cor_rede}">
				Células - Setor ${setor.nome_setor}
			</div>
			<br>
			<table id="table-celulas-setor">
				<thead>
	    			<tr>
	        			<th width="30%">Nome da Célula</th>
	        			<th width="20%">Total de Membros</th>
	        			<th width="15%">Dia</th>
	        			<th width="15%">Horário</th>
	    			</tr>
				</thead>
				<tbody>
					<c:forEach items="${listaCelulasSetor}" var="lista">
		    			<tr>
		        			<td>${lista.nome_celula}</td>
		        			<td>${lista.total}</td>
		        			<td>${lista.dia_reuniao}</td>
		        			<td>${lista.horario}</td>
		        		</tr>
	        		</c:forEach>	
	        	</tbody>
	    	</table>
		</div>
	</c:if>
    
</div>
  
</div>

<!-- form para alterar status do lider de Setor -->
<form id="alterar-form" class="mfp-hide white-popup" action="/vemev/setor/alterarStatusLider" method="get" style="width: 400px;">
	<div style="font-weight: 600; font-size: 16px;">
		Alterar Status do Lider para 'Inativo'
	</div>
	<br>
	Escolha a data final do Lider no Setor.
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
	<input type="hidden" id="id_setor" name="id_setor" value="${setor.id_setor}">
</form>

<!-- form para alterar o nome do Setor -->
<form id="alterarSetor-form" class="mfp-hide white-popup" action="/vemev/setor/updateSetor" method="get" style="width: 400px;">
	<div style="font-weight: 600; font-size: 16px;">
		Alterar o nome do Setor
	</div>
	<br><br>
	<label for="data">Nome do Setor</label>
    <input type="text" class="form-control" name="nome_setor" style ="width: 200px" required="true">
	<br><br><br>
	<div id="actions" class="row">
	    <div class="col-md-12">
	      <button type="submit" class="btn btn-primary">Salvar</button>
	      <a onclick="closePopup()" class="btn btn-default">Cancelar</a>
	    </div>
  	</div>
	<input type="hidden" id="id_setor" name="id_setor" value="${setor.id_setor}">
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
<div class="loader" id="loader"></div>
  </body>
</html>