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
	<title>Cadastro dos Lideres de Rede</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/style.css" rel="stylesheet">
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
	<script src="/jquery-tableless/jquery.tablesorter.min.js"></script>
	<script src="/jquery-tableless/jquery.tablesorter.pager.js"></script>
	<link rel="stylesheet" href="/jquery-tableless/custom.css" media="screen"/>
</head>
<body> 
 <!-- Fixed navbar -->
 <div class="navbar navbar-default " role="navigation">
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
            <li class="active"><a href="/home.html">Home</a></li>       
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Células <b class="caret"></b></a>
              <ul class="dropdown-menu">
             	<li class="dropdown-header">Admin das Células</li>
                 <li><a href="/Tela de cadastro de Membros.html">Cadastro de Membro</a></li>
                <li><a href="/Tela de cadastro de Celula.html">Cadastro de Célula</a></li>
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
                <li><a href="/ Tela de cadastro de Lider da Rede.html">Cadastro de Líder de Redes</a></li>
                 <li><a href="/Tela de cadastro do Lider de Setor.html">Cadastro de Líder de Setor</a></li>
                
                
              </ul>
            </li>   
            
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Consultas <b class="caret"></b></a>
              <ul class="dropdown-menu">
             	<li class="dropdown-header">Consultas</li>
                 <li><a href="#">Consulta dos Membros</a></li>
                  <li><a href="#">Consulta das Células</a></li>
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
 <h3 class="page-header">Cadastro dos Lideres de Redes</h3>
 <form action="/vemev/lider/createLiderRede" method="post">
  <!-- area de campos do form -->

<div class="container-fluid">

    <label for="campo1"> Cor da Rede</label> <br>
    
        	<input type ="radio" value = "azul" name = "cor_rede"> Azul <br> 
            <input type ="radio" value = "amarelo" name = "cor_rede"> Amarelo <br>
           <input type ="radio" value = "verde" name ="cor_rede"> Verde <br>
           <input type ="radio" value = "vermelho" name = "cor_rede"> Vermelho <br><br>
           
       <label for="data">Data</label>
       <input type="date" class="form-control" id="date" name="data_ini" style ="width: 200px"> <br>

<div style="text-align:left; float:center;">
      <label  id="for=&quot;pesquisar&quot;">Pesquisar</label>
         <input type="text" class="form-control" id="pesquisar" style ="width: 200px"><br>
</div>

<!-- Start tableless -->
     <div id="divTableless">
		<table id="myTable" cellspacing="0" width="100%">
		<thead>
	      	<tr>
	      		<th width="5%"><input value="1" id="marcar-todos" name="marcar-todos" type="checkbox"></th>
	      		<th>Nome do membro</th>
		    	<th>Telefone</th>  
		    	<th>Endereço</th>
		    	<th>Bairro</th>
	    	</tr>
		</thead>
      <tbody>
      	<c:forEach var="lista" items="${listaMembros}">
	    	<tr>
	    		<td><input value="${lista.id_membro}" name="id_membro" type="checkbox"></td>
	    		<td>${lista.nome}</td>
	    		<td>${lista.telefone}</td>
	    		<td>${lista.endereco}</td>
	    		<td>${lista.bairro}</td>
	    	</tr>
	    </c:forEach>
      </tbody>
    </table>
    </div>
    
    <div id="pager-tableless" class="pager-tableless">
			<br>&nbsp;&nbsp;&nbsp;		
			<img src="/jquery-tableless/first.png" class="first">
    		<img src="/jquery-tableless/prev.png" class="prev">
    		<input class="pagedisplay" type="text">
    		<img src="/jquery-tableless/next.png" class="next">
    		<img src="/jquery-tableless/last.png" class="last">
            <span>
			<select class="pagesize">
					<option value="5">5</option>
					<option selected="selected" value="10">10</option>
					<option value="20">20</option>
					<option value="30">30</option>
					<option value="50">50</option>
					<option value="100">100</option>
			</select> Registros&nbsp;&nbsp;&nbsp;
			</span>
			<br>
    </div>
    <!-- End tableless -->
    
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
     <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> -->
      
    </h6>
    
    <br><br>
    
 
   
<br><br>
</div>
</div>

<script>			
    $(function(){
      
      $('#divTableless table > tbody > tr:odd').addClass('odd');
      
      $('#divTableless table > tbody > tr').hover(function(){
        $(this).toggleClass('hover');
      });
      
      $('#marcar-todos').click(function(){
        $('#divTableless table > tbody > tr > td > :checkbox')
          .attr('checked', $(this).is(':checked'))
          .trigger('change');
      });
      
      $('#divTableless table > tbody > tr > td > :checkbox').bind('click change', function(){
        var tr = $(this).parent().parent();
        if($(this).is(':checked')) $(tr).addClass('selected');
        else $(tr).removeClass('selected');
      });
      
      $('#frm-filtro').submit(function(e){ e.preventDefault(); });
      
      $('#pesquisar').keydown(function(){
        var encontrou = false;
        var termo = $(this).val().toLowerCase();
        $('#divTableless table > tbody > tr').each(function(){
          $(this).find('td').each(function(){
            if($(this).text().toLowerCase().indexOf(termo) > -1) encontrou = true;
          });
          if(!encontrou) $(this).closest('tr').hide();
          else $(this).closest('tr').show();
          encontrou = false;
        });
      });
      
      $("#divTableless table") 
        .tablesorter({
          dateFormat: 'uk',
          headers: {
            0: {
              sorter: false
            },
            5: {
              sorter: false
            }
          }
        }) 
        .tablesorterPager({container: $("#pager-tableless")})
        .bind('sortEnd', function(){
          $('#divTableless table > tbody > tr').removeClass('odd');
          $('#divTableless table > tbody > tr:odd').addClass('odd');
        });
      
    });
</script>
  </body>
</html>