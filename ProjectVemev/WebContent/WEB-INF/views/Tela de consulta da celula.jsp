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
	<title>Consulta da Célula</title>
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
    	background-color: #fff; 
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
 		background-color: #fff;
	}
	.divTitulo{
		width: 100%; 
		height: 30px;
		color: white;
		font-weight: 600;
		padding: 1%;
		font-size: 16px;
		padding: 6px;
		-moz-border-radius:5px;
		-webkit-border-radius:5px;
 		border-radius:5px;
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
	<!-- configuracao do layout da grid -->
	<style type="text/css">
		@media screen and (min-width:861px) {
		 #divGridOcultar {
		    display: none;
		 }
		 .white-popup {
		 	  width: 85%;
		 }
		}
		@media screen and (max-width:860px) {
		.divRede-Lider{
			width: 95%; 
		}
		 .white-popup {
		 	  width: 98%;
		 }
		 #table-membros tr > *:nth-child(3){
		    display: none;
		 }
		 #table-membros tr > *:nth-child(5){
		    display: none;
		 }
		 #myTable tr > *:nth-child(3){
		    display: none;
		 }
		 #myTable tr > *:nth-child(5){
		    display: none;
		 }
		 #divGridOcultar {
		    display: block;
		 }
		 #table-membros, #myTable{
		 	font-size: 11px;
		 }
		 #table-membros thead tr th, #myTable thead tr th{
		 	font-size: 11px;
		 }
		 .container-fluid{margin-right:-1%;margin-left:-1%;padding-left:0%;padding-right:0%}
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
          <a class="navbar-brand" href="#">Vem vêê</a>
        </div>
        <div class="navbar-collapse collapse">
        	<!-- cabecalho default -->
			<%@include file="/cabecalho.jsp"%>
        </div><!--/.nav-collapse -->
        
        <div id="main" class="container-fluid">
 <h3 class="page-header">Consulta de Células</h3>

  <!-- area de campos do form -->


<div class="container-fluid">
<form action="/vemev/celula/consultaCelula" method="post">
	
		<br>		
		<label for="comboCelula">Escolha a Célula:</label><br>
		<div class="form-inline">
			<select class="form-control" required="true" id="comboCelula" name="nome_celula" style="width: 250px;">
				<option value=""></option>
				<c:forEach var="lista" items="${listaTodasCelulas}">
					<option value="${lista.nome_celula}">${lista.nome_celula}</option>
				</c:forEach>
			</select>
		    <button type="submit" class="btn btn-primary form-control" style="max-width: 100px;">Buscar</button>
	    </div>
</form>  
  <hr />
	<br>	
		
	<c:if test="${celula != null}">
		<h3>Detalhes da Célula:</h3>
		
		<div class="divRede-Lider">
			<div class="divTitulo corTitulo-${setor.cor_rede}">${celula.nome_celula}</div>
			<br>
			<b>Total de membros:</b> ${celula.total}<br>
			<b>Endereço:</b> ${celula.endereco}<br>
			<b>Complemento:</b> ${celula.complemento}<br>
			<b>Cep:</b> ${celula.cep}<br>
			<b>Bairro:</b> ${celula.bairro}<br>
			<b>Cidade:</b> ${celula.cidade}<br>
			<b>Estado:</b> ${celula.estado}
			<hr>
			<div style="width: 300px; height: auto; color: grey; ">Reunião da Célula</div>			
			<b>Dia da semana:</b> ${celula.dia_reuniao}<br>
			<b>Horário:</b> ${celula.horario}
		
			<%if(membroSession != null && membroSession.getAcesso().equals(MembroUserWeb.TipoAcessoLogin.LIDER_ACESSO)){ //lider acesso alterar%>
				<hr>
				<a class="popup-with-form" href="#alterarDados-form">
					<span class="glyphicon glyphicon-edit"></span>  Alterar dados
				</a>
			<%} %>
		
			<br>
		</div>
		<div class="divRede-Lider">
			<div class="divTitulo corTitulo-${setor.cor_rede}">Líderes</div><br>
			<c:forEach var="lista" items="${listaLideresCelula}" varStatus="contagem">			
				<b>${contagem.count}º Líder de Célula:</b> ${lista.nome}<br>			
			</c:forEach>
			<hr>
			<c:forEach var="lista" items="${listaLideresTrein}" varStatus="contagem">			
				<b>${contagem.count}º Líder em Treinamento:</b> ${lista.nome}<br>			
			</c:forEach>
			<br>
			
			<%if(membroSession != null && membroSession.getAcesso().equals(MembroUserWeb.TipoAcessoLogin.LIDER_ACESSO)){ //lider acesso%>
				<hr>
				<a href="/vemev/lider/consultaLideres?tipoLider=Celula">
					<span class="glyphicon glyphicon-user"></span> Detalhes dos líderes
				</a>
			<%} %>			
			
		</div>
		<div class="divRede-Lider">
			<div class="divTitulo corTitulo-${setor.cor_rede}">Rede / Setor</div><br>
			<b>Rede:</b> ${setor.cor_rede}<br>
			<b>Setor:</b> ${setor.nome_setor}<br>
		</div>
		<div style="clear: both; width: 100%;"> </div>
		<br>
		<hr>
		
		<%if(membroSession != null && membroSession.getAcesso().equals(MembroUserWeb.TipoAcessoLogin.LIDER_ACESSO)){ //lider acesso incluir%>
			<div id="actions" class="row">
	    		<div class="col-md-12">
					<a class="popup-with-form" href="#membro-form">
				    	<button class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Incluir Membro</button>
					</a>
	    		</div>
	 		</div>
		<%} %>  		
 		
		<br>
		<div class="membro-table">
			<table id="table-membros">
			<thead class="corTitulo-${setor.cor_rede}">
		      	<tr>
		      		<th width="5%"> </th>
		      		<th width="25%">Nome do membro</th>
		      		<th width="15%">Celular</th>
			    	<th width="15%">Telefone</th>  
			    	<th width="20%">Endereço</th>
			    	<%if(membroSession != null && membroSession.getAcesso().equals(MembroUserWeb.TipoAcessoLogin.LIDER_ACESSO)){ //lider acesso alterar%>
						<th width="20%">Ações</th>
					<%} %>			    	
		    	</tr>
			</thead>
	      <tbody>
	      	<c:forEach var="lista" items="${listaMembrosDaCelula}" varStatus="contagem">
		    	<tr>
		    		<td width="5%" align="center">${contagem.count}</td>
		    		<td width="25%">${lista.nome}</td>
		    		<td width="15%">${lista.celular}</td>
		    		<td width="15%">
		    			${lista.telefone}<br>
		    			<div id="divGridOcultar">${lista.celular}</div>			    		
		    		</td>
		    		<td width="20%">${lista.endereco}</td>
		    		<%if(membroSession != null && membroSession.getAcesso().equals(MembroUserWeb.TipoAcessoLogin.LIDER_ACESSO)){ //lider acesso alterar%>
						<td width="20%">
				    		<a class="popup-with-form" href="#desvincular-form" onclick="desvincularMembroDaCelula('${lista.id_membro}');">
				    			<span class="glyphicon glyphicon-minus"></span> Desvincular
				    		</a>
				    		<br>
				    		<a class="popup-with-form" href="#excluir-form" onclick="excluirMembroDaCelula('${lista.id_membro}');">
				    			<span class="glyphicon glyphicon-trash"></span> Excluir
				    		</a>
			    		</td>
					<%} %>		    		
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
	<table id="myTable" cellspacing="0" width="100%">
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
		    		<td width="150px">
		    			${lista.get("membro").get("telefone")}<br>
		    			<div id="divGridOcultar">${lista.get("membro").get("celular")}</div>
		    		</td>
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
    <b>Total de membros: ${listaTodosMembros.size()}</b>
    
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
<form id="excluir-form" class="mfp-hide white-popup" action="/vemev/participaCelula/excluirMembro" method="post" style="width: 400px;">
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
<form id="desvincular-form" class="mfp-hide white-popup" action="/vemev/participaCelula/desvincularMembro" method="post" style="width: 400px;">
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


<!-- form para alterar os dados da celula -->
<form id="alterarDados-form" class="mfp-hide white-popup" action="/vemev/celula/updateCelula" method="post" style="max-width: 1000px;">
	<div class="incluirMembro corTitulo-${setor.cor_rede}">
		<span class="glyphicon glyphicon-edit"></span> Alterar dados - ${celula.nome_celula}
	</div>
	<br><br>
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-12">
					<div class="form-group col-md-6">
						<label for="nome">Nome</label> 
						<input type="text" class="form-control" value="${celula.nome_celula}" id="nome_celula" name="nome_celula" required="true">
					</div>
				</div>
			</div>
			<div class="form-group col-md-4">
				<label for="endereco">Endereço</label> 
				<input type="text" class="form-control" value="${celula.endereco}" id="endereco" name="endereco" required="true"> 
				<label for="cep">CEP</label> 
				<input type="text" class="form-control" value="${celula.cep}" id="cep" name="cep" onkeypress="formataCEP(this, event)" required="true"> 
				<label for="cidade">Cidade</label>
				<input type="text" class="form-control" value="${celula.cidade}" id="cidade"	name="cidade" required="true"> 
				<label for="dia_reuniao">Dia Da Célula</label>
		        <select class="form-control" name="dia_reuniao" required="true">
		       		<option value ="${celula.dia_reuniao}">${celula.dia_reuniao}</option>
		        	<option value ="Segunda">Segunda</option>
		            <option value ="Terça">Terça</option>
		            <option value ="Quarta">Quarta</option>
		            <option value ="Quinta">Quinta</option>
		            <option value ="Sexta">Sexta</option>
		            <option value ="Sábado">Sábado</option>
		            <option value ="Domingo">Domingo</option>          
		        </select>
				<label for="setor_celula">Rede / Setor</label> 
				<select class="form-control" required="true" name="id_setor">
					<option value="${setor.id_setor}">${setor.cor_rede} - ${setor.nome_setor}</option>
					<c:forEach items="${listaSetores}" var="lista">
						<option value="${lista.id_setor}">${lista.cor_rede} - ${lista.nome_setor}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group col-md-4">
				<label for="complemento">Complemento</label> 
				<input type="text" class="form-control" value="${celula.complemento}" id="complemento" name="complemento">
				<label for="bairro">Bairro</label>
				<input type="text" class="form-control" value="${celula.bairro}" id="bairro" name="bairro" required="true"> 
				<label for="estado">Estado</label> 
				<select class="form-control" required="true" name="estado" required="true">
					<option value="${celula.estado}">${celula.estado}</option>
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
				<label for="horario">Horário</label>
       			<input type="time" value="${celula.horario}" class="form-control" id="horario" name ="horario" required="true">
			</div>
		</div>
	</div>
	<br><br><br>
	<div id="actions" class="row">
	    <div class="col-md-12">
	      <button type="submit" class="btn btn-primary">Salvar</button>
	      <a onclick="closePopup()" class="btn btn-default">Cancelar</a>
	    </div>
  	</div>
	<input type="hidden" name="nomeAtual" value="${celula.nome_celula}">
</form>

 </div>
 
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
<div class="loader" id="loader"></div>
  </body>
</html>