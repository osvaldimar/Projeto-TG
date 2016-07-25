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
	
	<!-- Ajax formulario --> 
	<script src="http://malsup.github.com/jquery.form.js"></script>
	<!-- configuracao do layout da grid -->
	<style type="text/css">
		@media screen and (min-width:861px) {
		 #divGridOcultar {
		    display: none;
		 }
		}
		@media screen and (max-width:860px) {
		 #myTable tr > *:nth-child(5), tr > *:nth-child(6){
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
 <h3 class="page-header">Cadastro dos Lideres de Redes</h3>
 <form action="/vemev/lider/createLiderRede" method="post" id="form-lider">
  <!-- area de campos do form -->

<div class="container-fluid">

    <label for="campo1"> Cor da Rede</label> <br>
    
        	<input type ="radio" value = "Azul" name = "cor_rede" required="true"> Azul <br> 
            <input type ="radio" value = "Amarelo" name = "cor_rede" required="true"> Amarelo <br>
           <input type ="radio" value = "Verde" name ="cor_rede" required="true"> Verde <br>
           <input type ="radio" value = "Vermelho" name = "cor_rede" required="true"> Vermelho <br><br>
		
       <label for="data">Data</label>
       <input type="date" class="form-control" id="date" name="data_ini" style ="max-width: 250px" required="true"> <br>

<div style="text-align:left; float:center;">
      <label  id="for=&quot;pesquisar&quot;">Pesquisar</label>
         <input type="text" class="form-control" id="pesquisar" style ="max-width: 250px"><br>
</div>

<!-- Start tableless -->
     <div id="divTableless">
		<table id="myTable" cellspacing="0">
		<thead>
	      	<tr>
		    	<th width="10px">&nbsp;&nbsp;&nbsp;</th>
	      		<th width="300px">Nome do membro</th>
		    	<th width="150px">Telefone</th>  
		    	<th width="300px">Endereço</th>
		    	<th width="150px">Bairro</th>
		    	<th width="150px">Cidade</th>
	    	</tr>
		</thead>
      <tbody>
      	<c:forEach var="lista" items="${listaMembros}">
	    	<tr>
	    		<td width="10px"><input value="${lista.id_membro}" name="id_membro" type="checkbox" onclick="changeCheckbox(this);"></td>
	    		<td width="300px">${lista.nome}</td>
	    		<td width="150px">${lista.telefone}<br>${lista.celular}</td>
	    		<td width="300px">
	    			${lista.endereco}<br>
	    			<div id="divGridOcultar">${lista.bairro}</div>
	    			<div id="divGridOcultar">${lista.cidade}</div>
	    		</td>
	    		<td width="150px">${lista.bairro}</td>
	    		<td width="150px">${lista.cidade}</td>
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
 
  <hr />
  <div id="actions" class="row">
    <div class="col-md-12">
      <button type="submit" class="btn btn-primary" onclick="validaLideres();">Salvar</button>
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
      <script src="/js/submenus-bootstrap.js"></script>
    </h6>
    
    <br><br>
    
 
   
<br><br>
</div>
</div>

<script>
	//valida quantidade de lideres no checkbox
	function changeCheckbox(obj){
		var checks = document.getElementsByName(obj.name);
		var cont = 0;
		for(var i = 0; i < checks.length; i++){
			if(checks[i].checked){
				cont++;
			}
			if(cont > 2){
				alert("Só pode selecionar até 2 líderes!");
				obj.checked = false;
				break;
			}
		}		
	}
	//valida antes de enviar formulario
	$('#form-lider').submit(function(e){ 
		var checks = document.getElementsByName("id_membro");
		var cont = 0;
		for(var i = 0; i < checks.length; i++){
			if(checks[i].checked){
				cont++;
			}			
		}
		if(cont < 1){
			e.preventDefault(); 
			alert("Por favor selecione 1 ou 2 líderes de Rede!");
		}
		if(cont > 2){
			e.preventDefault(); 
			alert("Só pode selecionar até 2 líderes!");
		}
	});
	//valida o cadastro ok dos lideres da Rede
	$(document).ready(function(){
		$('#form-lider').ajaxForm({
			success: function(respostaServer){
				if(respostaServer == "ok"){
					alert("Cadastro de líderes da Rede Ok!");
					//window.location.reload();		//cadastro ok e reload na pagina de cadastro
					window.location.href = "/vemev/lider/consultaLideres?tipoLider=Rede";		//redirect para consulta lideres
				}else{
					alert(respostaServer);			//mostra no alert a resposta de erro do servidor
				}				
			}
		});
	});
	
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