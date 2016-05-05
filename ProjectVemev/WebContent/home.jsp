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
				<a class="navbar-brand" href="#">Vem e Vê</a>
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
		<h1 style="margin-top: 213px; text-align: center;">Qualquer</h1>
	</div>


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="/js/submenus-bootstrap.js"></script>

</body>
</html>