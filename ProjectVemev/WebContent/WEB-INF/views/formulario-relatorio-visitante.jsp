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
	
<!-- form relatorido  dos dados do visitante -->
<form id="alterarDados-form" class="white-popup" method="post" style="max-width: 1000px; background-color: #fff;">
	<div style="float: right;">
		<button type="button" onclick="closePopup()" class="btn btn-primary">Fechar</button>
	</div>
	<br>
	
	<div style="text-align: center; width:100%; color: blue;">
		<h3>Visão geral do visitante</h3>
	</div>	
	<br>
	
	
	<h4>Dados pessoais</h4>
	<div class="divRelatorio">
		<table width="100%">
		<tbody>
		<tr>
		<td width="50%">
			<b>Nome:</b> ${visitante.nome}<br>
			<b>Apelido:</b> ${visitante.apelido}<br>
			<b>Data de nascimento:</b> ${visitante.data_nascimento}<br>
			<b>Sexo:</b> ${visitante.sexo}<br>
			<b>Celular:</b> ${visitante.celular}<br>
			<b>Telefone:</b> ${visitante.telefone}<br>
			<b>Estado Civil:</b> ${visitante.estado_civil}<br>
			<b>Email:</b> ${visitante.email}<br><br>
		</td>
		<td>
			<b>Endereço:</b> ${visitante.endereco}<br>
			<b>Complemento:</b> ${visitante.complemento}<br>
			<b>Cep:</b> ${visitante.cep}<br>
			<b>Bairro:</b> ${visitante.bairro}<br>
			<b>Cidade:</b> ${visitante.cidade}<br>
			<b>Estado:</b> ${visitante.estado}<br>
			<b>RG:</b> ${visitante.RG}<br><br>	
		</td>
		</tr>
		</tbody>	
		</table>
	</div>
	<br>
	<hr>
	
	<h4>Detalhes</h4>
	<div class="divRelatorio">
		<b>Data da Visita:</b> <br>${visitante.data_reuniao}<br>
		<b>Pertence a alguma igreja?</b> <br>${visitante.pertence_igreja}<br>
		<b>Pertence a qual igreja?</b> <br>${visitante.qual_igreja}<br>
		<b>Pertence a alguma célula?</b> <br>${visitante.pertence_celula}<br>
		<b>Quer conhecer alguma célula?</b> <br>${visitante.conhecer_celula}<br>
		<b>Visitou célula ou reunião?</b> <br>${visitante.celula_culto}<br>
		<b>Quer conhecer Jesus?</b> <br>${visitante.conhecer_jesus}<br>
		<b>Deseja oração?</b> ${visitante.deseja_oracao}<br>
		<b>Qual o motivo da oração?</b> <br>${visitante.motivo_oracao}<br>
		<b>Precisa de alguma ajuda específica?</b> <br>${visitante.precisa_ajuda}<br>
		<b>O que chamou a atenção na reunião de celebração ou na célula?</b>  <br>${visitante.descricao_reuniao}<br><br>		
	</div>
		
	<br>
	<div style="float: right;">
		<button type="button" onclick="closePopup()" class="btn btn-primary">Fechar</button>
	</div>
	<br>
	<br>
</form>