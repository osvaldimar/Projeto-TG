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
	<title>Consulta dos Membros</title>
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
	
	<style type="text/css">
	.rede table {
    	border: 1px solid lightgrey;
    	width: 100%;
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
		width: 80%; 
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
	}
	.rede-vermelho{
		background-color: #cc0000; 
		width: 100%; 
		height: 50px; 
		color: white; 
		padding: 1%; 
		font-size: 24px;"
	}
	.rede-azul{
		background-color: #0033ff; 
		width: 100%; 
		height: 50px; 
		color: white; 
		padding: 1%; 
		font-size: 24px;"
	}
	.rede-amarelo{
		background-color: #ffcc00; 
		width: 100%; 
		height: 50px; 
		color: white; 
		padding: 1%; 
		font-size: 24px;"
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
 <h3 class="page-header">Consulta dos líderes das Redes</h3>
 <form action="index.html">
  <!-- area de campos do form -->

<div class="container-fluid">


	<div class="rede">
		<div class="rede-verde">
			Lideres - Rede Verde
		</div>
		<br>
		<table>
			<thead>
    			<tr>
        			<th width="30%">Nome Líder</th>
        			<th width="20%">Telefone</th>
        			<th width="20%">Data inicio</th>
        			<th width="20%">Data fim</th>
        			<th width="10%">Status</th>
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
	        		</tr>
	        		</c:if>
        		</c:forEach>
        	</tbody>
    	</table>
	</div>
	
	<br><br>
	
	<div class="rede">
		<div class="rede-azul">
			Lideres - Rede Azul
		</div>
		<br>
		<table>
			<thead>
    			<tr>
        			<th width="30%">Nome Líder</th>
        			<th width="20%">Telefone</th>
        			<th width="20%">Data inicio</th>
        			<th width="20%">Data fim</th>
        			<th width="10%">Status</th>
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
	        		</tr>
	        		</c:if>
        		</c:forEach>
        	</tbody>
    	</table>
	</div>
	
	<br><br>
	
	<div class="rede">
		<div class="rede-vermelho">
			Lideres - Rede Vermelho
		</div>
		<br>
		<table>
			<thead>
    			<tr>
        			<th width="30%">Nome Líder</th>
        			<th width="20%">Telefone</th>
        			<th width="20%">Data inicio</th>
        			<th width="20%">Data fim</th>
        			<th width="10%">Status</th>
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
	        		</tr>
	        		</c:if>
        		</c:forEach>
        	</tbody>
    	</table>
	</div>
	
	<br><br>
	
	<div class="rede">
		<div class="rede-amarelo">
			Lideres - Rede Amarelo
		</div>
		<br>
		<table>
			<thead>
    			<tr>
        			<th width="30%">Nome Líder</th>
        			<th width="20%">Telefone</th>
        			<th width="20%">Data inicio</th>
        			<th width="20%">Data fim</th>
        			<th width="10%">Status</th>
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

      $('#pesquisar').keydown(function(e){
        	if(e.keyCode==13){ 
            	return false; //ignorar enter da caixa pesquisar
          }
      });
      
      $('#pesquisar').keyup(function(e){
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

      if($('#pesquisar').val() != ""){
          var encontrou = false;
          var termo = $('#pesquisar').val().toLowerCase();
          $('#divTableless table > tbody > tr').each(function(){
            $(this).find('td').each(function(){
              if($(this).text().toLowerCase().indexOf(termo) > -1) encontrou = true;
            });
            if(!encontrou) $(this).closest('tr').hide();
            else $(this).closest('tr').show();
            encontrou = false;
          });
      }
      
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