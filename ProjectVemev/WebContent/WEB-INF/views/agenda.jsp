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
	<title>Agenda de visitas</title>
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
	
	<!-- Magnific Popup core JS CSS file -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<link rel="stylesheet" href="/jquery-magnific-popup/magnific-popup.css"> 
	<script src="/jquery-magnific-popup/jquery.magnific-popup.js"></script>	
 
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
		 .white-popup {
		 	  width: 95%;
		 }
		 #table-membros tr > *:nth-child(3){
		    display: none;
		 }
		 #myTable tr > *:nth-child(3){
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
          <a class="navbar-brand" href="#">Vem vê</a>
        </div>
        <div class="navbar-collapse collapse">
        	<!-- cabecalho default -->
			<%@include file="/cabecalho.jsp"%>
        </div><!--/.nav-collapse -->
        
        <div id="main" class="container-fluid">
 <h3 class="page-header"><span class="glyphicon glyphicon-calendar"></span>  Agenda das visitas</h3>

  <!-- area de campos do form -->


<div class="container-fluid">
<form action="/vemev/agenda/visitantes" method="get" role="form" class="well">
		<div class="form-group">
			<label for="comboCelula">Escolha a Célula</label>
			<select class="form-control" required="true" id="comboCelula" name="nomeCelula" style="width: 250px;">
				<option value="${celulaSelecionada}">${celulaSelecionada}</option>
				<option value="Todas">Todas</option>
				<c:forEach var="lista" items="${listaTodasCelulas}">
					<option value="${lista.nome_celula}">${lista.nome_celula}</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-group">
			<label for="status-contato">Status</label>
			<select class="form-control" required="true" id="status-contato" name="status" style="width: 200px;">
				<option value="${statusSelecionado}">${statusSelecionado}</option>
				<option value="Não contatado">Não contatado</option>
				<option value="Agendado">Agendado</option>
				<option value="Concluído">Concluído</option>
			</select>
		</div>
		<div class="form-group">
		    <button type="submit" class="btn btn-primary form-control" style="max-width: 100px;">Pesquisar</button>
	    </div>
</form>  
  <hr>	
 		<b>Total de membros: ${listaContatosVisitantes.size()}</b><br><br>
		<div id="divTableless1" class="table-responsive" style="overflow-y: scroll; height:250px; border:2px solid;">
		<table id="myTable1" class="table small table-bordered table-striped table-hover" border="1px" cellspacing="0"> 
		<thead>
			<tr class="info">
			<th>Dados do Visitante</th>
			<th>Célula<br>responsável</th>
			<th>Status<br>Agendamento</th>
			<th>Ação</th>
			</tr>
		</thead>
      	<tbody>
      	<c:forEach var="lista" items="${listaContatosVisitantes}">
	    	<tr>
	    		<td class="filterable-cell">
	    			<a href="#" title="Exibir relatório" onclick="mostrarRelatorioVisitantePopup('${lista.get('visitante').get('id_visit')}');">
	    				${lista.get('visitante').get('nome')}
	    			</a>
	    			<br>
	    			Endereço: ${lista.get('visitante').get('endereco')}<br>
	    			Telefone: ${lista.get('visitante').get('telefone')}
	    		</td>
	    		<td class="filterable-cell">
	    		  	${lista.get('celula').get('nome_celula')}
	    		</td>
	    		<td class="filterable-cell">
	    		  	${lista.get('contata_visitante').get('status_contato')}
	    		  	<br>
	    		  	${lista.get('contata_visitante').get('data_agendado')}
	    		</td>
	    		<td class="filterable-cell">
					<a href="/maps/gerarRotasMapa?idVisit=${lista.get('visitante').get('id_visit')}&nomeCelula=${lista.get('celula').get('nome_celula')}">
						<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> Rota
					</a>
					<br>
					<a href="#" onclick="agendamentoDeVisita('${lista.get('contata_visitante').get('id_contato')}');">
						<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> Agendar/Concluir
					</a>
					<br>
					<a href="#" onclick="detalhesDeVisita('${lista.get('contata_visitante').get('id_contato')}');">
						<span class="glyphicon glyphicon-user" aria-hidden="true"></span> Detalhes da visita
					</a>
					<br>
					<%if(membroSession != null && membroSession.getAcesso().equals(MembroUserWeb.TipoAcessoLogin.LIDER_ACESSO)){ //lider acesso alterar%>
						<a class="popup-with-form" href="#direcionar-form" 
								onclick="direcionarContatoOutraCelula('${lista.get('contata_visitante').get('id_contato')}', 
								'${lista.get('contata_visitante').get('id_visit')}',
								'${lista.get('visitante').get('nome')}',
								'${lista.get('contata_visitante').get('nome_celula')}');">
			    			<span class="glyphicon glyphicon-share-alt"></span> Direcionar contato
			    		</a>
		    		<%} %>
	    		</td>
	    	</tr>
	    </c:forEach>
      </tbody>
    </table>    
    </div>	
    <!-- End tableless -->
	 <br>
     <div style="float: left;">
		<button type="button" onclick="window.history.go(-1);" class="btn btn-primary">Voltar</button>
	</div>
	<br><br><br>
		
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
    
  <!-- form para direcionar contato para outra celula -->
<form id="direcionar-form" class="mfp-hide white-popup" action="/vemev/agenda/updateContatoOutraCelula" method="post" style="width: 400px;">
	<h3>Derecionar contato para outra célula</h3>
	<br>
	<div class="well">
	  		<b>Nome do visitante:</b> <span id="nome_visit-dir"></span>
	</div>
	<br>
	<label for="comboCelula">Escolha a Célula</label>
	<select class="form-control" required="true" name="nome_celula" style="width: 250px;">
		<option value=""></option>
		<c:forEach var="lista" items="${listaTodasCelulas}">
			<option value="${lista.nome_celula}">${lista.nome_celula}</option>
		</c:forEach>
	</select>
	<br>
	<div class="form-group">
	 	<label for="observacao">Observação</label> 
	 	<textarea class="form-control" rows="4" id="observacao" name="observacao" style="width: 300px;">${contato.observacao}</textarea>
	</div>
	<br><br><br>
	<div id="actions" class="row">
	    <div class="col-md-12">
	      <button type="submit" class="btn btn-primary">Direcionar</button>
	      <a onclick="closePopup()" class="btn btn-default">Cancelar</a>
	    </div>
  	</div>
	<input type="hidden" id="id_contato-dir" name="id_contato" value="">
	<input type="hidden" id="id_visit-dir" name="id_visit" value="">
	<input type="hidden" id="nome_celula_ant-dir" name="nome_celula_ant" value="">
</form>

<br><br>
</div>
</div>

<script>

	//funcao para desvincular membro da celula
	function direcionarContatoOutraCelula(id, idVisit, nome, celAnt){
		$('#id_contato-dir').val(id);		//passa o id contato para o campo hidden do form direcionar
		$('#id_visit-dir').val(idVisit);
		$('#nome_celula_ant-dir').val(celAnt);
		$('#nome_visit-dir').html(nome);
	}
	
	//funcao javascript recupera formulario em ajax no server detalhes da visita
	function detalhesDeVisita(id){
		$.get("/vemev/agenda/ajaxRelatorioDadosVisitante",
		    {
				id_contato: id		//parametro
		    },
		    function(data, status){
		        //$('#divFormAlterarMembro').html(data);
		        //tenta forcar o pop up
		        $.magnificPopup.open({
		            items: {
		                src: data,
		                type:'inline'
		            },
		            modal: true
		        });
		    }
		);
	}
	
	//funcao javascript recupera formulario em ajax no server
	function agendamentoDeVisita(id){
		$.get("/vemev/agenda/ajaxAgendamentoDeVisita",
		    {
				id_contato: id		//parametro
		    },
		    function(data, status){
		        //$('#divFormAlterarMembro').html(data);
		        //tenta forcar o pop up
		        $.magnificPopup.open({
		            items: {
		                src: data,
		                type:'inline'
		            },
		            modal: true
		        });
		    }
		);
	}

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