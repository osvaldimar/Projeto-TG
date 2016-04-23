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
	<title>Consulta dos Visitantes</title>
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
	
	<!-- funcoes geral vemev -->
	<script src="/js/funcoes-vemev.js"></script>
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
					<li class="active">
						<a href="/home.html">Home</a>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Membro<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li class="dropdown-header"></li>
							<li><a href="/Tela de cadastro de Membros.html">Cadastrar</a></li>
							<li><a href="/vemev/membro/consultaMembros">Consultar</a></li>
							<li><a href="/vemev/membro/consultaMembros">Alterar</a></li>
						</ul>
					</li>

					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Visitante<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li class="dropdown-header"></li>
							<li><a href="/Tela de cadastro dos Visitantes.html">Cadastrar</a></li>
							<li><a href="/vemev/visitante/consultaVisitantes">Consultar</a></li>
							<li><a href="/vemev/visitante/consultaVisitantes">Alterar</a></li>
						</ul>
					</li>

					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Célula<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li class="dropdown-header"></li>
							<li><a href="/vemev/celula/cadastrarCelula">Cadastrar</a></li>
							<li><a href="/vemev/celula/consultaCelula">Consultar</a></li>
							<li><a href="/vemev/celula/consultaCelula">Alterar</a></li>
						</ul>
					</li>

					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Setor<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li class="dropdown-header"></li>
							<li><a href="/Tela de cadastro do setor.html">Cadastrar</a></li>
							<li><a href="/vemev/setor/consultaSetor">Consultar</a></li>
							<li><a href="/vemev/setor/consultaSetor">Alterar</a></li>
						</ul>
					</li>

					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Lider <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li class="dropdown-header"></li>
							<li class="dropdown-submenu" id="btn-liderCelula">
								<a tabindex="-1" href="#"> < Lider de Célula </a>
								<ul class="dropdown-menu" id="menu-liderCelula"
									style="right: 192px; top: 2px;">
									<li><a tabindex="-1" href="/vemev/cadastro/liderCelula">Cadastrar</a></li>
									<li><a tabindex="-1" href="/vemev/lider/consultaLideres?tipoLider=Celula">Consultar</a></li>
									<li><a tabindex="-1" href="/vemev/lider/consultaLideres?tipoLider=Celula">Alterar</a></li>
								</ul>
							</li>
							<li class="dropdown-submenu" id="btn-liderTreinamento">
								<a tabindex="-1" href="#"> < Lider em Treinamento </a>
								<ul class="dropdown-menu" id="menu-liderTreinamento"
									style="right: 192px; top: 31px;">
									<li><a tabindex="-1" href="/vemev/cadastro/liderTreinamento">Cadastrar</a></li>
									<li><a tabindex="-1" href="/vemev/lider/consultaLideres?tipoLider=Treinamento">Consultar</a></li>
									<li><a tabindex="-1" href="/vemev/lider/consultaLideres?tipoLider=Treinamento">Alterar</a></li>
								</ul>
							</li>
							
							<li class="divider"></li>
							<li class="dropdown-submenu" id="btn-liderSetor">
								<a tabindex="-1" href="#"> < Lider de Setor </a>
								<ul class="dropdown-menu" id="menu-liderSetor"
									style="right: 192px; top: 99px;">
									<li><a tabindex="-1" href="/vemev/lider/CadastrarLiderSetor">Cadastrar</a></li>
									<li><a tabindex="-1" href="/vemev/lider/consultaLideres?tipoLider=Setor">Consultar</a></li>
									<li><a tabindex="-1" href="/vemev/lider/consultaLideres?tipoLider=Setor">Alterar</a></li>
								</ul>
							</li>							
							<li class="dropdown-submenu" id="btn-liderRede">
								<a tabindex="-1" href="#"> < Lider de Rede </a>
								<ul class="dropdown-menu" id="menu-liderRede"
									style="right: 192px; top: 72px;">
									<li><a tabindex="-1" href="/vemev/cadastro/liderRede">Cadastrar</a></li>
									<li><a tabindex="-1" href="/vemev/lider/consultaLideres?tipoLider=Rede">Consultar</a></li>
									<li><a tabindex="-1" href="/vemev/lider/consultaLideres?tipoLider=Rede">Alterar</a></li>
								</ul>
							</li>
						</ul>
					</li>
					
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Rede<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li class="dropdown-header"></li>
							<li><a tabindex="-1" href="/vemev/lider/consultaLiderRede">Consultar</a></li>
						</ul>
					</li>
				</ul>
 
        </div><!--/.nav-collapse -->
        <div id="main" class="container-fluid">
 <h3 class="page-header">Consulta de todos os Visitantes</h3>
 <form action="index.html">
  <!-- area de campos do form -->

<div class="container-fluid">

<a href="/Tela de cadastro dos Visitantes.html" style="text-decoration: underline;">Cadastrar novo visitante</a>
    
    
<!-- Start tableless -->
<div style="text-align:center; float:center;">
<p style="padding:12px;">
        <label style="color:#333; font-weight:900;" id="for=&quot;pesquisar&quot;">Pesquisar</label>
        <input style="padding:6px; border:1px solid #ccc; width:300px;" id="pesquisar" value="${param.pesquisa}" name="pesquisar" size="30" type="text">
</p>
</div>
     <div id="divTableless">
		<table id="myTable" cellspacing="0"> 
		<thead>
	      	<tr>
	      		<th width="250px">Nome do visitante</th>
	      		<th width="120px">Celular</th>
		    	<th width="120px">Telefone</th>  
		    	<th width="250px">Endereço</th>
		    	<th width="150px">Bairro</th>		    	
		    	<th width="150px">Cidade</th>
		    	<th width="80px">Ação</th>
	    	</tr>
		</thead>
      <tbody>
      	<c:forEach var="lista" items="${listaVisitantes}">
	    	<tr>
	    		<td width="250px">
	    			<a href="#" title="Exibir relatório" onclick="mostrarRelatorioVisitantePopup('${lista.id_visit}');">${lista.nome}</a>
	    		</td>
	    		<td width="120px">${lista.celular}</td>
	    		<td width="120px">${lista.telefone}</td>
	    		<td width="250px">${lista.endereco}</td>
	    		<td width="150px">${lista.bairro}</td>	    		
	    		<td width="150px">${lista.cidade}</td>
	    		<td width="80px">
					<a href="/vemev/visitante/alterarDadosVisitante?id_visit=${lista.id_visit}">Alterar</a>
	    		</td>
	    	</tr>
	    </c:forEach>
      </tbody>
    </table>
    <b>Total de visitantes: ${listaVisitantes.size()}</b>
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
</form>
</div>


<div id="divFormAlterarMembro">
	<form id="alterarDados-form" class="mfp-hide white-popup" style="max-width: 1000px;">
	</form>
</div>

<h6>
      <!-- Bootstrap core JavaScript
    ================================================== -->
      <!-- Placed at the end of the document so the pages load faster -->
     <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> -->
      <script src="/js/submenus-bootstrap.js"></script>
    </h6>
    
<br><br>
<br><br>
</div>
</div>

<script>		
	
	//maginific-poup
	$(document).ready(function() {
		$('.popup-with-form').magnificPopup({
			type: 'inline',
			preloader: false,	
		});
		$('.ajax-popup-link').magnificPopup({
			  type: 'ajax'
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