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
 
	<style type="text/css">
	.membro-table table{
    	border: 1px solid grey;
    	width: 100%;
	}
	.membro-table table td, table th {
	    padding: 0.3em;
	    border: 1px solid grey;
	}
	.membro-table table th {
	    border: none;
	    color: white;
	}
	.divRede-Lider{
		width: 300px; 
		height: auto; 
		color: black; 
		padding: 1%; 
		font-size: 14px;
		border: 1px solid lightgrey;
		vertical-align: text-top; 
		padding: 6px;
		margin-right: 10px;
		margin-top: 10px;
		float: left;
		-moz-border-radius:10px;
		-webkit-border-radius:10px;
 		border-radius:10px;
	}
	.divTitulo{
		width: 100%; 
		height: 30px;
		color: white;
		font-weight: 600;
		padding: 1%;
		font-size: 16px;
		padding: 6px;
	}
	.corTitulo-Verde{
		background-color: #00cc00; 
	}
	.corTitulo-Azul{
		background-color: #0033ff; 
	}
	.corTitulo-Vermelho{
		background-color: #cc0000; 
	}
	.corTitulo-Amarelo{
		background-color: #ffcc00;
	}
	.incluirMembro{
		width: 99%; color: white; font-size: 16px; padding: 4px; font-weight: 600;
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
		<div class="divRede-Lider">
			<div class="divTitulo corTitulo-${setor.cor_rede}">${celula.nome_celula}</div>
			<br>
			Total de membros: ${celula.total}<br>
			Endereço: ${celula.endereco}<br>
			Complemento: ${celula.complemento}<br>
			Cep: ${celula.cep}<br>
			Bairro: ${celula.bairro}<br>
			Cidade: ${celula.cidade}<br>
			Estado: ${celula.estado}<br>
		</div>
		<div class="divRede-Lider">
			<div class="divTitulo corTitulo-${setor.cor_rede}">Líderes</div><br>
			Líder: teste lider 1<br>
			Líder: teste lider 2<br>
			Líder em treinamento: teste lider 3
		</div>
		<div class="divRede-Lider">
			<div class="divTitulo corTitulo-${setor.cor_rede}">Rede / Setor</div><br>
			Rede: ${setor.cor_rede}<br>
			Setor: ${setor.nome_setor}
		</div>
		<div style="clear: both; width: 100%;"> </div>
		<br>
		<hr>
  		<div id="actions" class="row">
    		<div class="col-md-12">
				<a class="popup-with-form" href="#membro-form">
			    	<button class="btn btn-primary">+ Incluir Membro</button>
				</a>
    		</div>
 		</div>
		<br>
		<div class="membro-table">
			<table>
			<thead class="corTitulo-${setor.cor_rede}">
		      	<tr>
		      		<th width="5%"> </th>
		      		<th width="25%">Nome do membro</th>
		      		<th width="15%">Celular</th>
			    	<th width="15%">Telefone</th>  
			    	<th width="20%">Endereço</th>
			    	<th width="20%">Ações</th>
		    	</tr>
			</thead>
	      <tbody>
	      	<c:forEach var="lista" items="${listaMembrosDaCelula}" varStatus="contagem">
		    	<tr>
		    		<td width="5%">${contagem.count}</td>
		    		<td width="25%">${lista.nome}</td>
		    		<td width="15%">${lista.celular}</td>
		    		<td width="15%">${lista.telefone}</td>
		    		<td width="20%">${lista.endereco}</td>
		    		<td width="20%">
		    			&nbsp;&nbsp;
			    		<a class="popup-with-form" href="#desvincular-form" onclick="desvincularMembroDaCelula('${lista.id_membro}');">
			    			- Desvincular membro
			    		</a>
			    		<br>&nbsp;&nbsp;
			    		<a class="popup-with-form" href="#excluir-form" onclick="excluirMembroDaCelula('${lista.id_membro}');">
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

<form id="membro-form" class="mfp-hide white-popup" action="/vemev/participaCelula/incluirMembro" method="post">
	
	<div class="incluirMembro corTitulo-${setor.cor_rede}">
		Incluir membro - ${celula.nome_celula}
	</div>
	<br>
	<label for="data">Data de ínicio</label>
    <input type="date" class="form-control" id="date" name="data_ini" style ="width: 200px" required="true"><br>
	<div style="text-align:left; float:center;">
    	<label  id="for=&quot;pesquisar&quot;">Pesquisar</label>
        <input type="text" class="form-control" id="pesquisar" style ="width: 200px"><br>
	</div>
	<input type="hidden" name="nome_celula" value="${celula.nome_celula}">
	
    <div id="divTableless">
	<table id="myTable" cellspacing="0">
		<thead>
	      	<tr>
	      		<th width="10px">&nbsp;&nbsp;&nbsp;</th>
	      		<th width="280px">Nome</th>
		    	<th width="150px">Celular</th>
		    	<th width="150px">Telefone</th>
		    	<th width="280px">Endereço</th>
		    	<th width="140px">Célula atual</th>
	    	</tr>
		</thead>
	      <tbody>
	      	<c:forEach var="lista" items="${listaTodosMembros}">
		    	<tr>
		    		<td width="10px">
		    			<!-- verifica se o membro ja esta em uma celula frequente ativo, nao deixar incluir em outra -->
		    			<c:if test="${lista.get('participa_celula').get('frequenta') != 'Sim'}">
		    				<input type="radio" name="id_membro" value="${lista.get('membro').get('id_membro')}" required="true">
		    			</c:if>		    			
		    		</td>
		    		<td width="280px">${lista.get("membro").get("nome")}</td>
		    		<td width="150px">${lista.get("membro").get("celular")}</td>
		    		<td width="150px">${lista.get("membro").get("telefone")}</td>
		    		<td width="280px">${lista.get("membro").get("endereco")}</td>
		    		<td width="140px">
		    			<c:if test="${lista.get('participa_celula').get('frequenta') eq 'Sim'}">
		    				${lista.get("celula").get("nome_celula")}
		    			</c:if>
		    		</td>
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
    <hr>
    <div id="actions" class="row">
	    <div class="col-md-12">
	      <button type="submit" class="btn btn-primary">+ Incluir</button>
	      <a onclick="closePopup()" class="btn btn-default">Cancelar</a>
	    </div>
  	</div>
 </form>
    <!-- End tableless -->    

<!-- form para excluir um membro -->
<form id="excluir-form" class="mfp-hide white-popup" action="/vemev/participaCelula/excluirMembro" method="get" style="width: 400px;">
	<div class="incluirMembro corTitulo-${setor.cor_rede}">
		Excluir membro - ${celula.nome_celula}
	</div>
	<br>
	Você tem certeza que deseja excluir o histórico de participação do membro desta Célula?
	<br><br><br>
	<div id="actions" class="row">
	    <div class="col-md-12">
	      <button type="submit" class="btn btn-primary">- Excluir</button>
	      <a onclick="closePopup()" class="btn btn-default">Cancelar</a>
	    </div>
  	</div>
	<input type="hidden" id="id_membro_exc" name="id_membro" value="">
	<input type="hidden" name="nome_celula" value="${celula.nome_celula}">
</form>

<!-- form para desvincular um membro -->
<form id="desvincular-form" class="mfp-hide white-popup" action="/vemev/participaCelula/desvincularMembro" method="get" style="width: 400px;">
	<div class="incluirMembro corTitulo-${setor.cor_rede}">
		Desvincular membro - ${celula.nome_celula}
	</div>
	<br>
	Escolha a data final do membro na Célula.
	<br><br>
	<label for="data">Data final</label>
    <input type="date" class="form-control" id="date" name="data_fim" style ="width: 200px" required="true">
	<br><br><br>
	<div id="actions" class="row">
	    <div class="col-md-12">
	      <button type="submit" class="btn btn-primary">- Desvincular</button>
	      <a onclick="closePopup()" class="btn btn-default">Cancelar</a>
	    </div>
  	</div>
	<input type="hidden" id="id_membro_des" name="id_membro" value="">
	<input type="hidden" name="nome_celula" value="${celula.nome_celula}">
</form>

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

	//funcao para excluir membro da celula
	function excluirMembroDaCelula(id){
		$('#id_membro_exc').val(id);		//passa o id clicado para o campo hidden do form excluir
	}
	//funcao para desvincular membro da celula
	function desvincularMembroDaCelula(id){
		$('#id_membro_des').val(id);		//passa o id clicado para o campo hidden do form desvincular
	}

	//maginific-poup
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

      //funcao para selecionar radio
      $('#divTableless table > tbody > tr > td > :radio').bind('click change', function(){
          var tr = $(this).parent().parent();
          if($(this).is(':checked')) $(tr).addClass('selected');
          else $(tr).removeClass('selected');
          //verifica todos radio
          var radios = document.getElementsByName($(this)[0].name);
          for(var i = 0; i < radios.length; i++){
        	  var trRadio = radios[i].parentNode.parentNode;
        	  if(radios[i].checked) $(trRadio).addClass('selected');
              else $(trRadio).removeClass('selected');
          }
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