<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- form para alterar os dados da reuniao -->
<form id="alterarDados-form" class="white-popup" action="/vemev/agenda/updateContataVisitante" method="post" style="max-width: 600px;" role="form">	
	<div style="float: right;">
		<button type="button" onclick="closePopup()" class="btn btn-primary">Fechar</button>
	</div>
	<br>
	<div style="text-align: center; width:100%; color: blue;">
		<h3><span class="glyphicon glyphicon-calendar"></span> Agendamento de visita</h3>
	</div>	
	<br>
  		<div class="well">
	  		<b>Nome do visitante:</b> ${visitante.nome}<br>
			<b>Telefone visitante:</b> ${visitante.telefone} / ${visitante.celular}<br>
			<b>Célula responsável: </b> ${celula.nome_celula}<br>
		</div>
	     <div class="form-group">
	     <label for="nome_celula">Membro responsável</label>
				<select class="form-control" required="true" id="comboCelula" name="id_membro" style="max-width: 300px;">
					<option value="${responsavel.id_membro}">${responsavel.nome}</option>
					<c:forEach var="membro" items="${listaMembrosCelula}">
						<option value="${membro.id_membro}">${membro.nome}</option>
					</c:forEach>
				</select>
	     </div>    
	     <div class="form-group">
	       <label for="data_agendado">Data de agendamento</label>
	       <input type="date" value="${contato.data_agendado}" class="form-control" style="max-width: 300px;" id="data_agendado" name ="data_agendado" required="true">
	     </div> 
     	<div class="form-group">
			<label for="status_contato">Status</label>
			<select class="form-control" required="true" id="status_contato" name="status_contato" style="max-width: 300px;">
				<option value=""></option>
				<option value="Não contatado">Não contatado</option>
				<option value="Agendado">Agendado</option>
				<option value="Concluído">Concluído</option>
			</select>
		</div> 
		<div class="form-group">
	 	<label for="observacao">Observação</label> 
	 	<textarea class="form-control" rows="4" id="observacao" name="observacao" style="max-width: 300px;">${contato.observacao}</textarea>
	</div>   
    <hr>
	<div id="actions" class="row">
	    <div class="col-md-12">
	      <button type="submit" class="btn btn-primary">Salvar</button>
	      <a onclick="closePopup()" class="btn btn-default">Cancelar</a>
	    </div>
  	</div>
	<input type="hidden" name="id_contato" value="${contato.id_contato}">
</form>