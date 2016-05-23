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
<title>Home</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="/mapa-google/mapa_rota.css" rel="stylesheet">
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
		      <legend>Criar rotas</legend>		                
		      <div>
		         <label for="txtEnderecoPartida">Endereço de partida:</label>
		         <input type="text" id="txtEnderecoPartida" name="txtEnderecoPartida" />
		      </div>		                
		      <div>
		         <label for="txtEnderecoChegada">Endereço de chegada:</label>
		         <input type="text" id="txtEnderecoChegada" name="txtEnderecoChegada" />
		      </div>		                
		      <div>
		         <input type="submit" id="btnEnviar" name="btnEnviar" value="Enviar" />
		      </div>
		   </fieldset>
		</form>		    
		<div id="mapa" style="height: 500px; width: 700px"></div>
        
	</div>
	
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="/js/submenus-bootstrap.js"></script>

	<!-- Mapa google -->
	<script src="/mapa-google/jquery.min.js"></script>	  
	<!-- Maps API Javascript -->
	<script src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>	 
	<!-- Arquivo de inicialização do mapa -->
	<script src="/mapa-google/mapa_rota.js"></script>
</body>
</html>