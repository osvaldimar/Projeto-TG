<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">
	hr {
    display: block;
    height: 1px;
    border: 0;
    border-top: 1px solid #ccc;
    margin: 1em 0;
    padding: 0; 
}
	#myTable {
    	border: 1px solid lightgrey;
    	overflow-y: scroll;
    	width: 100%;
    	background-color: #fff; 
	}
	#myTable td, table th {
	    padding: 0.3em;
	    border: 1px solid lightgrey;
	}
	#myTable th {
	    border: 1px solid grey;
	}
	.divRelatorio{
		border: 2px solid lightgrey;
		vertical-align: text-top; 
		padding: 10px;
		-moz-border-radius:5px;
		-webkit-border-radius:5px;
 		border-radius:5px;
 		background-color: #cce9ff;
	}
		
</style>
	
<!-- form relatorido  dos dados da visita -->
<form id="alterarDados-form" class="white-popup" method="post" style="max-width: 1000px; background-color: #fff;">
	<div style="float: right;">
		<button type="button" onclick="closePopup()" class="btn btn-primary">Fechar</button>
	</div>
	<br>
	
	<div style="text-align: center; width:100%; color: blue;">
		<h3>Detalhes da visita</h3>
	</div>	
	<br>
	<h4>Dados pessoais</h4>
	<div class="divRelatorio">
		<table width="100%">
		<tbody>
		<tr>
		<td width="100%">
			<div style="width:50%; float:left;">
				<b>Nome:</b> ${visitante.nome}<br>
				<b>Apelido:</b> ${visitante.apelido}<br>
				<b>Celular:</b> ${visitante.celular}<br>
				<b>Telefone:</b> ${visitante.telefone}<br>
				<b>Endereço:</b> ${visitante.endereco}<br>
				<b>Data da Visita:</b> <br>${visitante.data_reuniao}<br>
			</div>
		</td>
		</tr>
		</tbody>	
		</table>
	</div>
	<br>
	<hr>	
	<h4>Agendamento</h4>
	<div class="divRelatorio">
		<b>Célula responsável pela visita:</b> <br>${contato.nome_celula}<br>
		<b>Agendado pelo membro:</b> <br>${membro.nome}<br>
		<b>Status:</b> <br>${contato.status_contato}<br>
		<b>Data de agendamento:</b> <br>${contato.data_agendado}<br>
		<b>Observação:</b> <br>${contato.observacao}<br>	
	</div>		
	<br>
	<div style="float: right;">
		<button type="button" onclick="closePopup()" class="btn btn-primary">Fechar</button>
	</div>
	<br>
	<br>
</form>