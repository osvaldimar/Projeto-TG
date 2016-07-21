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
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
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
		<div style="text-align: center;">
			<img src="/logo_quadrangular.jpeg" width="100px" height="100px">
		</div>
		<br>
		<div class="alert alert-info" style="-moz-border-radius:12px; -webkit-border-radius:12px; border-radius:12px;
		     border-bottom-style:ridge; border-bottom-width:3px; border-right-style:ridge;border-right-width:3px;">
			O MDA ajuda a mostrar Jesus para as pessoas através das nossas vidas e com ações. Aqueles que
			aceitaram Jesus como seu Senhor e salvador amam a Ele e amam as pessoas , fazem parte da igreja do
			Senhor por todo o mundo  <i>(Mateus 16.18)</i>. Porém, Jesus nos ensina que é importante termos pessoas
			que creiam no mesmo Deus com uma mesma fé e que é importante estar junto delas, essas pessoas que
			caminham juntas na mesma fé, nos conhecemos como a igreja local <i>(Hebreus 10:25)</i>.
			<br><br>
			Para termos mais intimidade com nossos irmãos e sermos mais sensíveis um a outro, temos um
			momento especial nas casas, as células, encontros semanais onde falamos de Jesus, conversamos sobre
			nossa semana agradecendo a Deus por tudo que Ele é para nós.
			<br><br>
			Para compartilharmos nossos medos, angustias, sonhos , aprendermos mais sobre Jesus e a colocar em
			prática todos os principios que aprendemos na bíblia, temos uns encontro semanal um a um que
			chamamos de discipulado. Jesus teve 12 discipulos mas entre eles , existiam 3 amigos especiais, Pedro,
			Tiago e João aos quais ele investia tempo e amor ensinando com palavras e ações como é viver
			obedecendo por amor a Deus <i>(Mateus 18.20 / Tiago 5.16)</i>.
			<br><br>
			Vem e vê foi um convite feito a milhares de anos atrás <i>(João 1: 45-46)</i> e que Deus nos faz hoje e que
			nos como discipulos de Jesus devemos fazer todos os dias <i>(Mateus 28:19)</i>, Vem Vê como é
			maravilhoso viver com Jesus.
		</div>
	</div>


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="/js/submenus-bootstrap.js"></script>
<div class="loader" id="loader"></div>
</body>
</html>