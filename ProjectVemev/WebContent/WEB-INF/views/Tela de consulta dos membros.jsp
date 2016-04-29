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
        	<!-- cabecalho default -->
			<%@include file="/cabecalho.jsp"%>
        </div><!--/.nav-collapse -->
        
        <div id="main" class="container-fluid">
 <h3 class="page-header">Consulta de todos os Membros</h3>
 <form action="index.html">
  <!-- area de campos do form -->

<div class="container-fluid">

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
	      		<th width="250px">Nome do membro</th>
	      		<th width="120px">Celular</th>
		    	<th width="120px">Telefone</th>  
		    	<th width="250px">Endereço</th>
		    	<th width="150px">Bairro</th>		    	
		    	<th width="150px">Cidade</th>
		    	<th width="80px">Ação</th>
	    	</tr>
		</thead>
      <tbody>
      	<c:forEach var="lista" items="${listaMembros}">
	    	<tr>
	    		<td width="250px">
	    			<a href="#" title="Exibir relatório" onclick="mostrarRelatorioMembroPopup('${lista.id_membro}');">${lista.nome}</a>
	    		</td>
	    		<td width="120px">${lista.celular}</td>
	    		<td width="120px">${lista.telefone}</td>
	    		<td width="250px">${lista.endereco}</td>
	    		<td width="150px">${lista.bairro}</td>	    		
	    		<td width="150px">${lista.cidade}</td>
	    		<td width="80px">
					<a href="#" onclick="alterarDadosMembro('${lista.id_membro}');">Alterar</a>
	    		</td>
	    	</tr>
	    </c:forEach>
      </tbody>
    </table>    
    </div>
	<b>Total de membros: ${listaMembros.size()}</b>
	
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

	//funcao para desvincular membro da celula
	function alterarDadosMembro(id){
		$.get("/vemev/membro/ajaxAlterarDadosMembro",
		    {
		        id_membro: id		//parametro
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