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
	
	<!-- Magnific Popup core JS CSS file -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<link rel="stylesheet" href="/jquery-magnific-popup/magnific-popup.css"> 
	<script src="/jquery-magnific-popup/jquery.magnific-popup.js"></script>
	
	<!-- Tableless JS CSS file -->
	<script src="/jquery-tableless/jquery.tablesorter.min.js"></script>
	<script src="/jquery-tableless/jquery.tablesorter.pager.js"></script>
	<link rel="stylesheet" href="/jquery-tableless/custom.css" media="screen"/>	

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
 <h3 class="page-header">Consulta de Células</h3>

  <!-- area de campos do form -->


<div class="container-fluid">
<form action="/vemev/celula/consultaCelula" method="get">
	
		<br>		
		<label for="comboCelula">Escolha a Célula:</label><br>
		<div class="form-inline">
			<select class="form-control" required="true" id="comboCelula" name="nome" style="width: 250px;">
				<option value=""></option>
				<c:forEach var="lista" items="${listaTodasCelulas}">
					<option value="${lista.nome_celula}">${lista.nome_celula}</option>
				</c:forEach>
			</select>
			&nbsp;&nbsp;&nbsp;
		    <button type="submit" class="btn btn-primary">Buscar</button>
	    </div>
</form>  
  <hr />
	<br>	
	<h3>Dados da Célula:</h3>
		
	<c:if test="${celula != null}">
		<br>
		Nome da Celula: ${celula.nome_celula}
		<br>
		Total de membros: ${celula.total}
		<br>
		Endereço: ${celula.endereco}
		<br><br>
		<a class="popup-with-form" href="#membro-form">
	  		<button>+ Incluir um membro</button>
		</a>
		<br><br>
		<div id="divTablelessCelula">
			<table id="table1" border="1" cellspacing="0" width="100%">
			<thead>
		      	<tr>
		      		<th width="5%"> </th>
		      		<th width="25%">Nome do membro</th>
		      		<th width="15%">Celular</th>
			    	<th width="15%">Telefone</th>  
			    	<th width="20%">Endereço</th>
			    	<th width="20%">Ações</th>
		    	</tr>
			</thead>
	      <tbody style="height: 350px; overflow-y: scroll; -webkit-flex-flow: row wrap;">
	      	<c:forEach var="lista" items="${listaMembrosDaCelula}" varStatus="contagem">
		    	<tr>
		    		<td width="5%">${contagem.count}</td>
		    		<td width="25%">${lista.nome}</td>
		    		<td width="15%">${lista.celular}</td>
		    		<td width="15%">${lista.telefone}</td>
		    		<td width="20%">${lista.endereco}</td>
		    		<td width="20%">
		    			&nbsp;&nbsp;
			    		<a class="" href="#">
			    			- Desvincular membro
			    		</a>
			    		<br>&nbsp;&nbsp;
			    		<a class="" href="/vemev/participaCelula/excluirMembro?id_membro=${lista.id_membro}&nome_celula=${celula.nome_celula}">
			    			x Excluir participação
			    		</a>
		    		</td>
		    	</tr>
		    </c:forEach>
	      </tbody>
	    </table>
	    </div>
    </c:if>
    
    
<!-- Start tableless e form maginif popup-->

<form id="membro-form" class="mfp-hide white-popup" action="">
<div style="text-align:center; float:center;">
<p style="padding:12px;">
        <label style="color:#333; font-weight:900;" id="for=&quot;pesquisar&quot;">Pesquisar</label>
        <input style="padding:6px; border:1px solid #ccc; width:300px;" id="pesquisar" value="${param.pesquisa}" name="pesquisar" size="30" type="text">
</p>
</div>
     <div id="divTableless">
	<table id="myTable" cellspacing="0" width="100%">
		<thead>
	      	<tr>
	      		<th width="35%">Nome</th>
		    	<th width="15%">Celular</th>
		    	<th width="15%">Telefone</th>
		    	<th width="35%">Endereço</th>
		    	<th width="10%">Ações</th>
		    	<th width="5%"> </th>
	    	</tr>
		</thead>
	      <tbody>
	      	<c:forEach var="lista" items="${listaTodosMembros}">
		    	<tr>
		    		<td width="35%">${lista.nome}</td>
		    		<td width="15%">${lista.celular}</td>
		    		<td width="15%">${lista.telefone}</td>
		    		<td width="35%">${lista.endereco}</td>
		    		<td width="10%"><a href="/vemev/participaCelula/incluirMembro?id_membro=${lista.id_membro}&nome_celula=${celula.nome_celula}">Incluir</a></td>    		
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
 </form>
    <!-- End tableless -->    

 </div>
 

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