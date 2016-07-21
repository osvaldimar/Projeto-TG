<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Navbar tutorial from BootstrapBay.com">
<meta name="author" content="BootstrapBay.com">
<title>Exibir rotas</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/mapa-google/mapa_rota.css" rel="stylesheet">

<style type="text/css">
	.divRede-Lider{
		width: 740px; 
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
 		background-color: #cccfff;
	}
	@media screen and (max-width: 740px){
		.divRede-Lider { width: 100%;}
	}
</style>
</head>
<body>
	<!-- Fixed navbar -->
	<div class="navbar navbar-default" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Vem vê</a>
			</div>
			<div class="navbar-collapse collapse">
				<!-- cabecalho default -->
				<%@include file="/cabecalho.jsp"%>
			</div>
			<!--/.nav-collapse -->
			
		</div>
	</div>
	<br>
	<div class="container">
		
		<form method="post" action="index.html">
		   <fieldset>
		   		<span class="label label-default"></span>		   
		      <legend style="color:blue;"><span class="glyphicon glyphicon-map-marker" style="font-size:1em;" aria-hidden="true"></span> Exibir rotas</legend> 		            
		      <div class="divRede-Lider">
				<b>Endereço do visitante (partida):</b><br> ${param.partida}<br>
		      	<b>Endereço da célula (chegada):</b><br> ${param.chegada}<br>
				<b>Distância km:</b> ${km}
				<hr>
				<b>Nome célula:</b> ${celula.nome_celula}<br>
				<b>Líder:</b> 
				<c:if test="${listaLideresCelula.size() == 1}">${listaLideresCelula.get(0).nome}</c:if>
				<c:if test="${listaLideresCelula.size() == 2}">${listaLideresCelula.get(0).nome} / ${listaLideresCelula.get(1).nome}</c:if>
				<hr>
				<b>Nome visitante:</b> ${visitante.nome}<br>
				<b>Telefone visitante:</b> ${visitante.telefone} / ${visitante.celular}<br>
		      </div>		                      
		      <div>
		        <input type="hidden" value="${param.partida}" id="txtEnderecoPartida" name="txtEnderecoPartida" />
		         <input type="hidden" value="${param.chegada}" id="txtEnderecoChegada" name="txtEnderecoChegada" />
		      </div>		                
		      <div>
		         <input type="hidden" id="btnEnviar" name="btnEnviar" value="Enviar" />
		      </div>
		   </fieldset>
		</form>				  
		<div id="mapa"></div>
        <br>
        <div style="float: left;">
			<button type="button" onclick="window.history.go(-1);" class="btn btn-primary">Voltar</button>
		</div>
		<br><br><br>
	</div>
	
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/submenus-bootstrap.js"></script>

	<!-- Mapa google -->
	<script src="/mapa-google/jquery.min.js"></script>	  
	<!-- Maps API Javascript -->
	<script src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>	 
	<!-- Arquivo de inicialização do mapa -->
	<script src="/mapa-google/mapa_rota.js"></script>
	
	<script type="text/javascript">
		window.onload = function() { 
			var enderecoPartida = $("#txtEnderecoPartida").val();
			var enderecoChegada = $("#txtEnderecoChegada").val();
			
			var request = {
				origin: enderecoPartida,
				destination: enderecoChegada,
				travelMode: google.maps.TravelMode.DRIVING
			};
			
			directionsService.route(request, function(result, status) {
				if (status == google.maps.DirectionsStatus.OK) {
					directionsDisplay.setDirections(result);
				}
			});
		};
	</script>
	<div class="loader1" id="loader"></div>
</body>
</html>