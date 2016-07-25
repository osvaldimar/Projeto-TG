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
	
	<!-- funcoes geral vemev -->
	<script src="/js/funcoes-vemev.js"></script>
	
	<!-- configuracao do layout da grid -->
	<style type="text/css">
		@media screen and (min-width:861px) {
		 #divGridOcultar {
		    display: none;
		 }
		}
		@media screen and (max-width:860px) {
		 #myTable tr > *:nth-child(2), tr > *:nth-child(4){
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
 <h3 class="page-header">Consulta de reuniões das células</h3>
 <form action="index.html">
  <!-- area de campos do form -->

<div class="container-fluid">

<!-- Start tableless -->
<div style="text-align:left; float:center;">
      <label  id="for=&quot;pesquisar&quot;">Pesquisar</label>
         <input type="text" class="form-control" id="pesquisar" value="${param.pesquisa}" name="pesquisar" style ="max-width: 250px"><br>
</div>
     <div id="divTableless">
		<table id="myTable" cellspacing="0" width="100%"> 
		<thead>
	      	<tr>
	      		<th width="250px">Célula</th>
	      		<th width="150px">Dia</th>
		    	<th width="100px">Data</th>  
		    	<th width="100px">Horário</th>
		    	<th width="100px">Membros</th>
		    	<th width="100px">Visitantes</th>
		    	<th width="100px">Ações</th>		    	
	    	</tr>
		</thead>
      <tbody>
      	<c:forEach var="lista" items="${listaReunioes}">
	    	<tr>
	    		<td width="250px">${lista.nome_celula}</td>
	    		<td width="150px">${lista.dia_reuniao}<br><div id="divGridOcultar">${lista.horario}</div></td>
	    		<td width="100px">
	    			${lista.data_reuniao}
	    			<div id="divGridOcultar">${lista.dia_reuniao}</div>
	    			<div id="divGridOcultar">${lista.horario}</div>
	    		</td>
	    		<td width="100px">${lista.horario}</td>
	    		<td width="100px">${lista.num_membros}</td>
	    		<td width="100px">${lista.num_visitantes}</td>
	    		<td width="100px">
	    			&nbsp;&nbsp;
		    		<a href="#" onclick="alterarDadosReuniao('${lista.id_reuniao}');">
		    			<span class="glyphicon glyphicon-edit"></span> Alterar
		    		</a>
		    		<br>&nbsp;&nbsp;
		    		<a class="popup-with-form" href="#excluir-form" onclick="excluirReuniao('${lista.id_reuniao}');">
		    			<span class="glyphicon glyphicon-trash"></span> Excluir
		    		</a>
	    		</td>   		
	    	</tr>
	    </c:forEach>
      </tbody>
    </table>
    </div>
    <b>Total de reuniões: ${listaReunioes.size()}</b>

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
 
  <hr />
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

<!-- form para excluir reuniao -->
<form id="excluir-form" class="mfp-hide white-popup" action="/vemev/reuniao/excluirReuniao" method="get" style="max-width: 400px;">
	<div style="text-align: center; width:100%; color: blue;">
		<h4><span class="glyphicon glyphicon-trash"></span> Excluir reunião</h4>
	</div>
	<br>
	Você tem certeza que deseja excluir o histórico dessa reunião da célula?
	<br><br><br>
	<div id="actions" class="row">
	    <div class="col-md-12">
	      <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-trash"></span> Excluir</button>
	      <a onclick="closePopup()" class="btn btn-default">Cancelar</a>
	    </div>
  	</div>
	<input type="hidden" id="id_reuniao_exc" name="id_reuniao" value="">
</form>

<!-- monta form via ajax para alterar dados da reuniao -->
<form id="alterarDados-form" class="mfp-hide white-popup" style="max-width: 1000px;">
</form>
	
<script>		

	//funcao para excluir membro da celula
	function excluirReuniao(id){
		$('#id_reuniao_exc').val(id);		//passa o id clicado para o campo hidden do form excluir
	}

	//funcao para buscar formulario via ajax para alterar dados da reuniao
	function alterarDadosReuniao(id){
		$.get("/vemev/reuniao/ajaxAlterarDadosReuniao",
		    {
		        id_reuniao: id		//parametro
		    },
		    function(data, status){
		        //forca o pop up dos campos
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