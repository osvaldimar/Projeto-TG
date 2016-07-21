<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
      <html lang="pt-br">
        <head>
         <meta charset="utf-8">
         <meta http-equiv="X-UA-Compatible" content="IE=edge">
         <meta name="viewport" content="width=device-width, initial-scale=1">
         <title>Cadastro dos Membros</title>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
         <link href="css/bootstrap.min.css" rel="stylesheet">
         <link href="css/style.css" rel="stylesheet">
         
         <script src="/js/mascaras-validacoes.js"></script>
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
         <h3 class="page-header">Cadastro dos Membros</h3>
         <form action="/vemev/membro/createMembro" method="post">
          <!-- area de campos do form -->
          <div class="row">
          <div class="col-md-12">
          
             <div class="form-group col-md-4">
                <label for="nome">Nome</label>
               <input type="text" class="form-control" id="nome" name="nome" required="true">
                <label for="telefone">Telefone</label>
               <input type="text" class="form-control" id="telefone" name="telefone" onkeypress="formataTelefone(this, event)">  
               <label for="celular">Celular</label>
               <input type="text" class="form-control" id="celular" name="celular" onkeypress="formataCelular(this, event)" name="celular">
                 <label for="nome">RG</label>
               <input type="text" class="form-control" id="RG" name="RG" required="true">
               <label for="email">Email</label>
               <input type="text" class="form-control" id="email" name="email" required="true">
               <label for="endereco">Endereço</label>
               <input type="text" class="form-control" id="endereco" name="endereco" required="true">
             </div>
              <div class="form-group col-md-4">
               <label for="cep">CEP</label>
               <input type="text" class="form-control" id="cep" name="cep" required="true" onkeypress="formataCEP(this, event)">
               <label for="cidade">Cidade</label>
               <input type="text" class="form-control" id="cidade" name="cidade" required="true">
                <label for="complemento">Complemento</label>
               <input type="text" class="form-control" id="complemento" name="complemento">
                         <label for="bairro">Bairro</label>
               <input type="text" class="form-control" id="bairro" name="bairro" required="true">
                <label for="estado">Estado</label>
            <select class="form-control" name="estado" required="true">
            <option></option> 
      <option>AC</option> 
      <option>AL</option>	 
      <option>AP</option>	 
      <option>AM</option>	 
      <option>BA</option>	 
      <option>CE</option>	 
      <option>DF</option>	 
      <option>ES</option>	 
      <option>GO</option>	 
      <option>MA</option>	 
      <option>MT</option>	 
      <option>MS</option>	 
      <option>MG</option>	 
      <option>PA</option>	 
      <option>PB</option>	 
      <option>PR</option>	 
      <option>PE</option>	 
      <option>PI</option>	 
      <option>RJ</option>	 
      <option>RN</option>	 
      <option>RS</option>	 
      <option>RO</option>	 
      <option>RR</option>	 
      <option>SC</option>	 
      <option selected="selected">SP</option>	 
      <option>SE</option>	 
      <option>TO</option>
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