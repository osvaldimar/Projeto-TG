<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">
<head>
 <meta charset="utf-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <title>Cadastro das Células</title>

 <link href="/css/bootstrap.min.css" rel="stylesheet">
 <link href="/css/style.css" rel="stylesheet">
 <script src="/js/jquery.min.js"></script>
 <script src="/js/bootstrap.min.js"></script>
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
                 <li><a href="/Tela de cadastro de Membros.html">Cadastro de Membro</a></li>
                <li><a href="/vemev/celula/cadastrarCelula">Cadastro de Célula</a></li>
                <li><a href="/Tela de cadastro do setor.html">Cadastro de Setor</a></li>
                 <li><a href="/Tela de cadastro dos Visitantes.html">Cadastro de Visitante</a></li>
         
               
               
                
              </ul>
            </li> 
            
             <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Líderes <b class="caret"></b></a>
              <ul class="dropdown-menu">
             	<li class="dropdown-header">Admin Líderes</li>
                <li><a href="/vemev/cadastro/liderCelula">Cadastro de Líder de Célula</a></li>
                 <li><a href="/Tela de cadastro do Lider em Treinamento.html">Cadastro de Líder em Treinamento</a></li>
                <li><a href="/vemev/cadastro/liderRede">Cadastro de Líder de Redes</a></li>
                 <li><a href="/Tela de cadastro do Lider de Setor.html">Cadastro de Líder de Setor</a></li>
                
                
              </ul>
            </li>   
            
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Consultas <b class="caret"></b></a>
              <ul class="dropdown-menu">
             	<li class="dropdown-header">Consultas</li>
                 <li><a href="/vemev/membro/consultaMembros">Consulta dos Membros</a></li>
                  <li><a href="/vemev/celula/consultaCelula">Consulta das Células</a></li>
                <li><a href="#">Consulta dos  Setores</a></li>
                 <li><a href="#">Consulta dos Visitantes</a></li>
                      <li class="divider">teste teste</li>
                <li><a href="#">Consulta dos  Líderes Célula</a></li>
                 <li><a href="#">Consulta dos Líderes em Treinamentos</a></li>
                <li><a href="#">Consulta dos Líderes de Redes</a></li>
                 <li><a href="#">Consulta dos Líderes de Setor</a></li>
              </ul>
            </li> 
             <li><a href="#">Conheça a Visão MDA</a></li>
          </ul>
        </div><!--/.nav-collapse -->
        
        <div id="main" class="container-fluid">
 <h3 class="page-header">Cadastro das Células</h3>
 
 <form action="/vemev/celula/createCelula" method="post">
  <!-- area de campos do form -->
    <div class="row">
          <div class="col-md-12">
           <div class="row">
          <div class="col-md-12">
          
             <div class="form-group col-md-6">
               <label for="nome">Nome</label>
               <input type="text" class="form-control" id="nome_celula" name="nome_celula">
              </div>
              </div>
              </div>
        
             <div class="form-group col-md-4">
 
                 <label for="endereco">Endereço</label>
               <input type="text" class="form-control" id="endereco" name="endereco">
               <label for="cep">CEP</label>
               <input type="text" class="form-control" id="cep" name="cep">
               <label for="cidade">Cidade</label>
               <input type="text" class="form-control" id="cidade" name="cidade">
               
               <input type="hidden" id="total" name="total" value="0">
             </div>
              <div class="form-group col-md-4">

                <label for="complemento">Complemento</label>
               <input type="text" class="form-control" id="complemento" name="complemento">
                         <label for="bairro">Bairro</label>
               <input type="text" class="form-control" id="bairro" name="bairro">
                <label for="estado">Estado</label>
            <select class="form-control" required="true" name="estado">
            <option></option>
      <option value="AC">AC</option> 
      <option value="AL">AL</option>	 
      <option value="AP">AP</option>	 
      <option value="AM">AM</option>	 
      <option value="BA">BA</option>	 
      <option value="CE">CE</option>	 
      <option value="DF">DF</option>	 
      <option value="ES">ES</option>	 
      <option value="GO">GO</option>	 
      <option value="MA">MA</option>	 
      <option value="MT">MT</option>	 
      <option value="MS">MS</option>	 
      <option value="MG">MG</option>	 
      <option value="PA">PA</option>	 
      <option value="PB">PB</option>	 
      <option value="PR">PR</option>	 
      <option value="PE">PE</option>	 
      <option value="PI">PI</option>	 
      <option value="RJ">RJ</option>	 
      <option value="RN">RN</option>	 
      <option value="RS">RS</option>	 
      <option value="RO">RO</option>	 
      <option value="RR">RR</option>	 
      <option value="SC">SC</option>	 
      <option value="SP">SP</option>	 
      <option value="SE">SE</option>	 
      <option value="TO">TO</option>
      </select>
            
        <label for="setor_celula">Rede / Setor</label>
        <select class="form-control" required="true" name="id_setor">
        	<option value=""></option>
        	<c:forEach items="${listaSetores}" var="lista">
      			<option value="${lista.id_setor}">${lista.cor_rede} - ${lista.nome_setor}</option> 
        	</c:forEach>
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
    </h6>
  </body>
</html>