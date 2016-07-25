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
	<title>Gerenciar Líderes</title>
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
	
	<!-- configuracao do layout da grid -->		
	<style type="text/css">
		@media screen and (min-width:861px) {
		.white-popup {
		 	  width: 85%;
		 }
		 #divGridOcultar {
		    display: none;
		 }
		}
		@media screen and (max-width:860px) {
		.white-popup {
		 	  width: 95%;
		 }
		 #myTable tr > *:nth-child(2), tr > *:nth-child(6){
		    display: none;
		 }
		 #divGridOcultar {
		    display: block;
		 }
		 #myTable{
		 	font-size: 11px;
		 }
		 #myTable thead tr th{
		 	font-size: 11px;
		 }
		 .container-fluid{margin-right:-1%;margin-left:-1%;padding-left:0%;padding-right:0%}
		}
	</style>
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
          <a class="navbar-brand" href="#">Vem vê</a>
        </div>
        <div class="navbar-collapse collapse">
        	<!-- cabecalho default -->
			<%@include file="/cabecalho.jsp"%>
        </div><!--/.nav-collapse -->
        
        <div id="main" class="container-fluid">
 <h3 class="page-header">Gerenciar Líderes</h3>
 <form action="/vemev/lider/createLiderRede" method="post" id="form-lider">
  <!-- area de campos do form -->

<div class="container-fluid">

    <a href="/vemev/lider/consultaLideres?tipoLider=Celula" style="text-decoration: underline;">Líder de Célula</a>&nbsp;&nbsp;
    <a href="/vemev/lider/consultaLideres?tipoLider=Treinamento" style="text-decoration: underline;">Líder em Treinamento</a>&nbsp;&nbsp;
    <a href="/vemev/lider/consultaLideres?tipoLider=Setor" style="text-decoration: underline;">Líder de Setor</a>&nbsp;&nbsp;
    <a href="/vemev/lider/consultaLideres?tipoLider=Rede" style="text-decoration: underline;">Líder de Rede</a>&nbsp;&nbsp;
    <a href="/vemev/lider/consultaLideres?tipoLider=Todos" style="text-decoration: underline;">Todos líderes</a>&nbsp;&nbsp;
	
	<br><br>
	<h4>${param.tituloTipoLider}</h4>
	<br><br>
	
<% 
	String pesquisaAuto = "";	//parametro url 'pesquisar' para fazer pesquisa automatica
	if(request.getParameter("pesquisar") != null && !request.getParameter("pesquisar").isEmpty()){
		pesquisaAuto = new String(request.getParameter("pesquisar").getBytes("iso-8859-1"),"utf-8");
	}
%>	
<div style="text-align:left; float:center;">
      <label  id="for=&quot;pesquisar&quot;">Pesquisar</label>
         <input type="text" class="form-control" id="pesquisar" 
         		value="" style ="max-width: 250px"><br>
</div>

<!-- Start tableless -->
     <div id="divTableless">
		<table id="myTable" cellspacing="0" style="min-width: 450px;">
			<thead>
    			<tr>
        			<th width="300px">Nome Líder</th>
        			<th width="150px">Celular</th>
        			<th width="100px;">Data inicio</th>
        			<th width="100px">Data fim</th>
        			<th width="200px">Líder</th>
        			<th width="100px">Status</th>
        			<th width="100px">Ação</th>
    			</tr>
			</thead>
			<tbody>
				<c:forEach items="${listaLideresCel}" var="lista">
	    			<tr>
	        			<td width="300px">
	        				<a href="#" title="Exibir relatório" onclick="mostrarRelatorioMembroPopup('${lista.membro.id_membro}');">${lista.membro.nome}</a>
	        			</td>
	        			<td width="150px">${lista.get("membro").get("celular")}</td>
	        			<td width="100px">${lista.get("lider_celula").get("data_ini")}</td>
	        			<td width="100px">${lista.get("lider_celula").get("data_fim")}</td>
	        			<td width="200px">
	        				<b>Tipo: </b>Líder de Célula<br>
	        				<b>Nome: </b>${lista.celula.nome_celula}<br>
	        				<div id="divGridOcultar"><b>Status:</b> ${lista.get("lider_celula").get("status_lider")}</div></td>
	        			<td width="100px">${lista.get("lider_celula").get("status_lider")}</td>
	        			<td width="100px">
			    			<c:if test="${lista.get('lider_celula').get('status_lider') eq 'Ativo'}">
		        				<a class="popup-with-form" href="#alterar-form" 
		        					onclick="alterarLider('${lista.get('lider_celula').get('id_lider')}', 'Celula', '${lista.get('membro').get('nome')}');">
				    				Alterar
				    			</a>
			    			</c:if>
	        			</td>
	        		</tr>
        		</c:forEach>
        		<c:forEach items="${listaLideresTrein}" var="lista">
	    			<tr>
	        			<td width="300px">
	        				<a href="#" title="Exibir relatório" onclick="mostrarRelatorioMembroPopup('${lista.membro.id_membro}');">${lista.membro.nome}</a>
	        			</td>
	        			<td width="150px">${lista.get("membro").get("celular")}</td>
	        			<td width="100px">${lista.get("lider_treinamento").get("data_ini")}</td>
	        			<td width="100px">${lista.get("lider_treinamento").get("data_fim")}</td>
	        			<td width="200px">
	        				<b>Tipo: </b>Líder em Treinamento<br>
	        				<b>Nome: </b>${lista.celula.nome_celula}<br>
	        				<div id="divGridOcultar"><b>Status:</b> ${lista.get("lider_treinamento").get("status_lider")}</div>
	        			</td>
	        			<td width="100px">${lista.get("lider_treinamento").get("status_lider")}</td>
	        			<td width="100px">
			    			<c:if test="${lista.get('lider_treinamento').get('status_lider') eq 'Ativo'}">
		        				<a class="popup-with-form" href="#alterar-form" 
		        					onclick="alterarLider('${lista.get('lider_treinamento').get('id_lider')}', 'Treinamento', '${lista.get('membro').get('nome')}');">
				    				Alterar
				    			</a>
			    			</c:if>
	        			</td>
	        		</tr>
        		</c:forEach>
        		<c:forEach items="${listaLideresSetor}" var="lista">
	    			<tr>
	        			<td width="300px">
	        				<a href="#" title="Exibir relatório" onclick="mostrarRelatorioMembroPopup('${lista.membro.id_membro}');">${lista.membro.nome}</a>
	        			</td>
	        			<td width="150px">${lista.get("membro").get("celular")}</td>
	        			<td width="100px">${lista.get("lider_setor").get("data_ini")}</td>
	        			<td width="100px">${lista.get("lider_setor").get("data_fim")}</td>
	        			<td width="200px">
	        				<b>Tipo: </b>Líder de Setor<br>
	        				<b>Setor: </b>${lista.setor.nome_setor}<br>
	        				<div id="divGridOcultar"><b>Status:</b> ${lista.get("lider_setor").get("status_lider")}</div>
	        			</td>
	        			<td width="100px">${lista.get("lider_setor").get("status_lider")}</td>
	        			<td width="100px">
			    			<c:if test="${lista.get('lider_setor').get('status_lider') eq 'Ativo'}">
		        				<a class="popup-with-form" href="#alterar-form" 
		        					onclick="alterarLider('${lista.get('lider_setor').get('id_lider')}', 'Setor', '${lista.get('membro').get('nome')}');">
				    				Alterar
				    			</a>
			    			</c:if>
	        			</td>
	        		</tr>
        		</c:forEach>
        		<c:forEach items="${listaLideresRede}" var="lista">
	    			<tr>
	        			<td width="300px">
	        				<a href="#" title="Exibir relatório" onclick="mostrarRelatorioMembroPopup('${lista.membro.id_membro}');">${lista.membro.nome}</a>
	        			</td>
	        			<td width="150px">${lista.get("membro").get("celular")}</td>
	        			<td width="100px">${lista.get("lider_rede").get("data_ini")}</td>
	        			<td width="100px">${lista.get("lider_rede").get("data_fim")}</td>
	        			<td width="200px">
	        				<b>Tipo: </b>Líder de Rede<br>
	        				<b>Rede: </b>${lista.lider_rede.cor_rede}<br>
	        				<div id="divGridOcultar"><b>Status:</b> ${lista.get("lider_rede").get("status_lider")}</div>
	        			</td>
	        			<td width="100px">${lista.get("lider_rede").get("status_lider")}</td>
	        			<td width="100px">
			    			<c:if test="${lista.get('lider_rede').get('status_lider') eq 'Ativo'}">
		        				<a class="popup-with-form" href="#alterar-form" 
		        					onclick="alterarLider('${lista.get('lider_rede').get('id_lider')}', 'Rede', '${lista.get('membro').get('nome')}');">
				    				Alterar
				    			</a>
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
					<option selected="selected" value="20">20</option>
					<option value="30">30</option>
					<option value="50">50</option>
					<option value="100">100</option>
			</select> Registros&nbsp;&nbsp;&nbsp;
			</span>
			<br>
    </div>
    <!-- End tableless -->
    
 </div>

 <br>
 <hr>
</form>
</div>


<!-- form para alterar um lider -->
<form id="alterar-form" class="mfp-hide white-popup" action="/vemev/lider/alterarStatusQualquerLider" method="post" style="max-width: 600px;">
	<div style="text-align: center; width:100%; color: blue;">
		<h3><span class="glyphicon glyphicon-edit"></span> Alterar Status do Lider para 'Inativo'</h3>
	</div>	
	<br>
	<div class="well">
		<b>Escolha a data final do Lider</b><br><br>
		<b>Nome: </b><span id="spanNomeLider"> </span><br>
		<b>Tipo Líder: </b><span id="spanTipoLider"> </span>
		<br><br>
		<label for="data">Data final</label>
	    <input type="date" class="form-control" id="date" name="data_fim" style ="max-width: 250px" required="true">
    </div>
	<br>
	<hr>
	<br>
	<div id="actions" class="row">
	    <div class="col-md-12">
	      <button type="submit" class="btn btn-primary">Salvar</button>
	      <a onclick="closePopup()" class="btn btn-default">Cancelar</a>
	    </div>
  	</div>
	<input type="hidden" id="id_lider" name="id_lider" value="">
	<input type="hidden" id="tipo_lider" name="tipo_lider" value="">
	<input type="hidden" id="status_lider" name="status_lider" value="Inativo">
</form>



<h6>
      <!-- Bootstrap core JavaScript
    ================================================== -->
      <!-- Placed at the end of the document so the pages load faster -->
     
      <script src="/js/submenus-bootstrap.js"></script>
    </h6>
    
    <br><br>
    
 
   
<br><br>
</div>
</div>

<script>
	//funcao altera o status dos lideres (celula, treinamento, setor e rede)
	//funcao para alterar status inativo do lider
	function alterarLider(id, tipo, nome){
		$('#id_lider').val(id);				//passa o id do lider para alterar o status
		$('#tipo_lider').val(tipo);			//passa o tipo de lider
		$('#spanNomeLider').html(nome);		//nome do membro(lider)
		$('#spanTipoLider').html(tipo);
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
      
      $('#frm-filtro').submit(function(e){ e.preventDefault(); });
          
      $('#pesquisar').keydown(function(e){
      	if(e.keyCode==13){ 
          	return false; //ignorar enter da caixa pesquisar
        }
      });

      //momento que a tela carrega verifica pesquisa na url e faz a busca automatico
      window.onload = function() {
    	var elemento = $('#pesquisar');    
      	var encontrou = false;
        var termo = elemento.val().toLowerCase();
        $('#divTableless table > tbody > tr').each(function(){
            $(this).find('td').each(function(){
              if($(this).text().toLowerCase().indexOf(termo) > -1) encontrou = true;
            });
            if(!encontrou){
                //antes de ocultar, verificar se checkbox is checked para continuar visualizacao dos selecionados
          	  if($(this).find('td > :checkbox').is(':checked')){ 
              	  //ignore - nao oculta selecionados
          	  }else{ 
              	  $(this).closest('tr').hide();
          	  }              
            }else{ 
                $(this).closest('tr').show();
        	}
            encontrou = false;
        });
        //hide loading
        $(".loader").fadeOut("slow");
      }
      
      $('#pesquisar').keyup(function(e){
        var encontrou = false;
        var termo = $(this).val().toLowerCase();
        $('#divTableless table > tbody > tr').each(function(){
          $(this).find('td').each(function(){
            if($(this).text().toLowerCase().indexOf(termo) > -1) encontrou = true;
          });
          if(!encontrou){
              //antes de ocultar, verificar se checkbox is checked para continuar visualizacao dos selecionados
        	  if($(this).find('td > :checkbox').is(':checked')){ 
            	  //ignore - nao oculta selecionados
        	  }else{ 
            	  $(this).closest('tr').hide();
        	  }              
          }
          else $(this).closest('tr').show();
          encontrou = false;
        });
      });
      
      $("#divTableless table").tablesorter({
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