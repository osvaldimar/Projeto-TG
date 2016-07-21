<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Alterar dados do Visitante</title>

<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<script src="/js/mascaras-validacoes.js"></script>
</head>
<body>
	<!-- Fixed navbar -->
	<div class="navbar navbar-default " role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Vem v�</a>
			</div>
			<div class="navbar-collapse collapse">
				<!-- cabecalho default -->
				<%@include file="/cabecalho.jsp"%>
			</div>
			<!--/.nav-collapse -->
			
			<div id="main" class="container-fluid">
				<h3 class="page-header">Alterar dados do Visitante</h3>
				<form action="/vemev/visitante/updateVisitante" method="post">
					<!-- area de campos do form -->
					<div class="row">
						<div class="col-md-12">
							<div class="form-group col-md-3">
								<label for="txt_nome">Nome</label> 
								<input type="text" class="form-control" value="${visitante.nome}" id="txt_nome" name="nome" required="true"> 									
								<label for="data_nascimento">Data de Nascimento</label> 
								<input type="date" value="${visitante.data_nascimento}" class="form-control" id="data_nascimento" name="data_nascimento" required="true"> 
								<label for="txt_telefone">Telefone</label>
								<input type="text" value="${visitante.telefone}" onkeypress="formataTelefone(this, event)" class="form-control" id="txt_telefone" name="telefone"> 
								<label for="slc_estadoCivil">Estado Civil</label> 
								<select class="form-control" name="estado_civil">
									<option>${visitante.estado_civil}</option>
									<option>Solteiro(a)</option>
									<option>Casado(a)</option>
									<option>Divorciado(a)</option>
								</select> 
								<label for="txt_endereco">Endere�o</label> 
								<input type="text" value="${visitante.endereco}" class="form-control" id="txt_endereco" name="endereco" required="true">
								<label for="txt_bairro">Bairro</label> 
								<input type="text" value="${visitante.bairro}" class="form-control" id="txt_bairro" name="bairro"> 
								<label for="estado">Estado</label> 
								<select class="form-control" name="estado" required="true">
									<option>${visitante.estado}</option>
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

							<div class="form-group col-md-3">
								<label for="txt_apelido">Apelido</label> 
								<input type="text" value="${visitante.apelido}" class="form-control" id="txt_apelido" name="apelido"> 
								<label for="slc_sexo">Sexo</label> 
								<select class="form-control" name="sexo" required="true">
									<option value="${visitante.sexo}">${visitante.sexo}</option>
									<option value = "F">F</option>
									<option value = "M">M</option>
								</select> 
								<label for="txt_celular">Celular</label> 
								<input type="text" value="${visitante.celular}" class="form-control" id="txt_celular" onkeypress="formataCelular(this, event)" name="celular"> 
								<label for="txt_email">E-mail</label> 
								<input type="text" value="${visitante.email}" class="form-control" id="txt_email" name="email"> 
								<label for="txt_complemento">Complemento</label> 
								<input type="text" value="${visitante.complemento}" class="form-control" id="txt_complemento" name="complemento">
								<label for="txt_cidade">Cidade</label> 
								<input type="text" value="${visitante.cidade}" class="form-control" id="txt_cidade" name="cidade" required="true"> 
								<label for="txt_cep">CEP</label> 
								<input type="text" value="${visitante.cep}" class="form-control" id="txt_cep" name="cep" onkeypress="formataCEP(this, event)">
							</div>

							<div class="form-group col-md-3">
								<div style="height: 59px;">
									<label for="txt_celula">RG</label> 
									<input type="text" value="${visitante.RG}" class="form-control" id="txt_rg" name="RG">
								</div>
								<div style="height: 59px;">
									<label for="data_reuniao">Data da Visita</label> 
									<input type="date" value="${visitante.data_reuniao}" class="form-control" id="data_reuniao" name="data_reuniao" required="true">
								</div>
								<div style="height: 59px;">
									<label for="txt_rdigreja">Pertence a alguma igreja?</label><br>
									<input type="radio" name="pertence_igreja" value="Sim">Sim&nbsp;&nbsp;
									<input type="radio" name="pertence_igreja" value="N�o">N�o<br>
									<br>
								</div>
								<div style="height: 59px;">
									<label for="txt_rdpertence">Pertence a alguma c�lula?</label><br><br><br><br>
									<input type="radio" name="pertence_celula" value="Sim">Sim&nbsp;&nbsp;
									<input type="radio" name="pertence_celula" value="N�o">N�o<br>
									<br>
								</div>
								<div style="height: 44px;">
									<label for="txt_rdoracao">Deseja ora��o?</label><br> 
									<input type="radio" name="deseja_oracao" value="Sim">Sim&nbsp;&nbsp;
									<input type="radio" name="deseja_oracao" value="N�o">N�o<br>
									<br>
								</div>
							</div>
							<div class="form-group col-md-3">
								<div style="height: 59px;">
									<label for="slc_visitou">Visitou c�lula ou reuni�o?</label> 
									<select class="form-control" name="celula_culto">
										<option value="${visitante.celula_culto}">${visitante.celula_culto}</option>
										<option value ="celula">C�lula</option>
										<option value ="culto">Reuni�o de Celebra��o</option>
									</select>
								</div>
								<div style="height: 59px;">
									<label for="txt_rdconhecer">Quer conhecer Jesus?</label><br>
									<input type="radio" name="conhecer_jesus" value="Sim">Sim&nbsp;&nbsp;
									<input type="radio" name="conhecer_jesus" value="N�o">N�o<br>
									<br>
								</div>	
								<div style="height: 59px;">
									<label for="txt_igreja">Pertence a qual igreja?</label> 
									<input type="text" value="${visitante.qual_igreja}" class="form-control" id="txt_igreja" name="qual_igreja">
								</div>
								<div style="height: 59px;">
									<label for="txt_rdcelula">Quer conhecer alguma c�lula?</label><br>
									<input type="radio" name="conhecer_celula" value="Sim">Sim&nbsp;&nbsp;
									<input type="radio" name="conhecer_celula" value="N�o">N�o<br>
									<br>
								</div>
								<div style="height: 44px;">
									<label for="txt_oracao">Qual o motivo da ora��o?</label> 
									<input type="text" value="${visitante.motivo_oracao}" class="form-control" id="txt_oracao" name="motivo_oracao">
								</div>
							</div>
							<div class="form-group col-md-6">
								<div style="height: 59px;">
									<label for="txt_ajuda">Precisa de alguma ajuda espec�fica?</label> 
									<input type="text" value="${visitante.precisa_ajuda}" class="form-control" id="txt_ajuda" name="precisa_ajuda">
								</div>
								<div style="height: 59px;">
									<label for="txt_descricao">O que chamou a aten��o na reuni�o de celebra��o ou na c�lula?</label> 
									<input type="text" value="${visitante.descricao_reuniao}" class="form-control" id="txt_descricao" name="descricao_reuniao">
								</div>
							</div>

						</div>
					</div>




			<hr />
			<div id="actions" class="row">
				<div class="col-md-12">
					<button type="submit" class="btn btn-primary">Salvar</button>
					<a href="/home.jsp" class="btn btn-default">Cancelar</a>
					<input type="hidden" value="${visitante.id_visit}" id="id_visit" name="id_visit">
				</div>
			</div>
			</form>
			</div>
		</div>
</div>
		<h6>
			<!-- Bootstrap core JavaScript
    ================================================== -->
			<!-- Placed at the end of the document so the pages load faster -->
			<script
				src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

			<script src="/js/bootstrap.min.js"></script>
			<script src="/js/submenus-bootstrap.js"></script>
		</h6>
		<div class="loader" id="loader"></div>
</body>
</html>