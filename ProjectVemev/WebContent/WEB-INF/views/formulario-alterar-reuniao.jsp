<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- form para alterar os dados da reuniao -->
<form id="alterarDados-form" class="white-popup" action="/vemev/reuniao/updateReuniao" method="post" style="max-width: 1000px;">	
	<div style="float: right;">
		<button type="button" onclick="closePopup()" class="btn btn-primary">Fechar</button>
	</div>
	<br>
	<h3>
		Alterar dados da reunião
	</h3>
	<br><br>
	<div class="row">
  <div class="col-md-12">
     <div class="form-group col-md-4">
     <label for="nome_celula">Célula</label>
			<select class="form-control" required="true" id="comboCelula" name="nome_celula" style="width: 250px;">
				<option value="${reuniao.nome_celula}">${reuniao.nome_celula}</option>
				<c:forEach var="lista" items="${listaTodasCelulas}">
					<option value="${lista.nome_celula}">${lista.nome_celula}</option>
				</c:forEach>
			</select>
 	<label for="dia_reuniao">Dia da semana</label>
        <select class="form-control" name="dia_reuniao" required="true">
        	<option value ="${reuniao.dia_reuniao}">${reuniao.dia_reuniao}</option>
        	<option value ="Segunda">Segunda</option>
            <option value ="Terça">Terça</option>
            <option value ="Quarta">Quarta</option>
           <option value ="Quinta">Quinta</option>
            <option value ="Sexta">Sexta</option>
           <option value ="Sábado">Sábado</option>
            <option value ="Domingo">Domingo</option>
          
        </select>
          <label for="num_visitantes">Número de Visitantes</label>
       <input type="text" value="${reuniao.num_visitantes}" class="form-control" id="num_visitantes" name = "num_visitantes" required="true">
    </div>
    
     <div class="form-group col-md-4">
       <label for="horario">Horário</label>
       <input type="time" value="${reuniao.horario}" class="form-control" id="horario" name ="horario" required="true">
       <label for="num_membros">Número de Membros</label>
       <input type="text" value="${reuniao.num_membros}" class="form-control" id="num_membros" name ="num_membros" required="true">
     </div>     
	 </div>
	</div>
    <hr>              
	<br>
	<div id="actions" class="row">
	    <div class="col-md-12">
	      <button type="submit" class="btn btn-primary">Salvar</button>
	      <a onclick="closePopup()" class="btn btn-default">Cancelar</a>
	    </div>
  	</div>
	<input type="hidden" id="id_reuniao" name="id_reuniao" value="${reuniao.id_reuniao}">
</form>