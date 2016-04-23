<!-- form para alterar os dados do membro -->
<form id="alterarDados-form" class="white-popup" action="/vemev/membro/updateMembro" method="post" style="max-width: 1000px;">
	
	<div style="float: right;">
		<button type="button" onclick="closePopup()" class="btn btn-primary">Fechar</button>
	</div>
	<br>
	<h3>
		Alterar dados do membro
	</h3>
	<br><br>
	<div class="row">
          <div class="col-md-12">          
          <div class="row">
          <div class="col-md-12">          
              </div>
              </div>
        
             <div class="form-group col-md-4">
                <label for="nome">Nome</label>
               <input type="text" value="${membro.nome}" class="form-control" id="nome" name="nome" required="true">
                <label for="telefone">Telefone</label>
               <input type="text" value="${membro.telefone}" class="form-control" id="telefone" name="telefone" onkeypress="formataTelefone(this, event)">  
                 <label for="endereco">Endereço</label>
               <input type="text" value="${membro.endereco}" class="form-control" id="endereco" name="endereco" required="true">
               <label for="cep">CEP</label>
               <input type="text" value="${membro.cep}" class="form-control" id="cep" name="cep" required="true" onkeypress="formataCEP(this, event)">
               <label for="cidade">Cidade</label>
               <input type="text" value="${membro.cidade}" class="form-control" id="cidade" name="cidade" required="true">
             </div>
              <div class="form-group col-md-4">
               <label for="nome">RG</label>
               <input type="text" value="${membro.RG}" class="form-control" id="RG" name="RG" required="true">
               <label for="celular">Celular</label>
               <input type="text" value="${membro.celular}" class="form-control" id="celular" name="celular" onkeypress="formataCelular(this, event)" name="celular">
               <label for="complemento">Complemento</label>
               <input type="text" value="${membro.complemento}" class="form-control" id="complemento" name="complemento">
               <label for="bairro">Bairro</label>
               <input type="text" value="${membro.bairro}" class="form-control" id="bairro" name="bairro" required="true">
                <label for="estado">Estado</label>
            	<select class="form-control" name="estado" required="true">
            	  <option>${membro.estado}</option> 
			      <option>AC</option> 
			      <option>AL</option>	 
			      <option>AP</option>	 
			      <option>AM</option>	 
			      <option>BA</option>	 
			      <option>CE</option>	 
			      <option>DF</option>	 
			      <option>ES</option>	 
			      <option>GO</option>	 
			      <option>MA</option>	 
			      <option>MT</option>	 
			      <option>MS</option>	 
			      <option>MG</option>	 
			      <option>PA</option>	 
			      <option>PB</option>	 
			      <option>PR</option>	 
			      <option>PE</option>	 
			      <option>PI</option>	 
			      <option>RJ</option>	 
			      <option>RN</option>	 
			      <option>RS</option>	 
			      <option>RO</option>	 
			      <option>RR</option>	 
			      <option>SC</option>	 
			      <option>SP</option>	 
			      <option>SE</option>	 
			      <option>TO</option>
            	</select>               
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
		<input type="hidden" id="id_membro" name="id_membro" value="${membro.id_membro}">
</form>