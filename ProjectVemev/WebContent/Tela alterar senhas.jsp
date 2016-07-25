<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
 <meta charset="utf-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <title>Alterar senhas</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
 <link href="css/bootstrap.min.css" rel="stylesheet">
 <link href="css/style.css" rel="stylesheet">
 
 <!-- Ajax formulario --> 
 <script src="http://malsup.github.com/jquery.form.js"></script>
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
 <h3 class="page-header">Alterar senhas de acesso</h3>
 <form id="form-senha" action="/vemev/alterarSenha" method="post">
  <!-- area de campos do form -->
  <div class="row">
  <div class="col-md-12">
     <div class="form-group col-md-4">
  	 <span id="errorSenha" style="color:red; display:none;"></span><br>
  		<div class="info">
	      	<label for="cor_rede">Tipo de acesso</label>
	        <select class="form-control" name="tipo" required="true">
	        	<option></option>
	        	<option value="lider">Líder</option>
	            <option value="membro">Membro</option>
	        </select>
	    	<label for="nome_setor">Senha atual</label>
	    	<input type="password" class="form-control" id="senhaAtual" name="senhaAtual" required="true">
	    	<label for="nome_setor">Nova senha</label>
	    	<input type="password" class="form-control" id="novaSenha" name="novaSenha" required="true">
	    	<label for="nome_setor">Confirmar senha</label>
	    	<input type="password" class="form-control" id="confirmarSenha" required="true">
		</div>
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
    <div class="loader_ajax" id="loader_ajax"></div> 
    
    <script type="text/javascript">
  //valida antes de enviar formulario
	$('#form-senha').submit(function(e){ 
		$(".loader_ajax").show();
		var nova = $('#novaSenha').val();
		var conf = $('#confirmarSenha').val();
		if(nova != conf){
			e.preventDefault(); 
			//alert("A confirmação de senha não confere!");
			$("#errorSenha").html("A confirmação de senha não confere!");
			$("#errorSenha").show();
			$(".loader_ajax").hide();
		}
	});
	//valida alteracao de senha
	$(document).ready(function(){
		$('#form-senha').ajaxForm({
			success: function(respostaServer){
				if(respostaServer == "ok"){
					alert("Senha alterada com sucesso!");
					//window.location.reload();				//reload na pagina de cadastro
					window.location.href = "/home.jsp";		//redirect para home
				}else{
					alert(respostaServer);			//mostra no alert a resposta de erro do servidor
					//oculta loading
					$(".loader_ajax").hide();
					$("#errorSenha").html(respostaServer);
					$("#errorSenha").show();
				}				
			}
		});
	});
    </script>
  </body>
</html>