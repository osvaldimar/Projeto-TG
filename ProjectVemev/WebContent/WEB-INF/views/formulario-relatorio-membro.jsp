<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="br.com.vemev.dao.*, br.com.vemev.modelo.*" %>
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
		width: 100%; 
		vertical-align: text-top; 
		padding: 10px;
		-moz-border-radius:5px;
		-webkit-border-radius:5px;
 		border-radius:5px;
 		background-color: #cce9ff;
	}
		
</style>
	
<!-- form para alterar os dados do membro -->
<form id="alterarDados-form" class="white-popup" action="/vemev/membro/updateMembro" method="post" style="max-width: 1000px; background-color: #fff;">
	<div style="float: right;">
		<button type="button" onclick="closePopup()" class="btn btn-primary">Fechar</button>
	</div>
	<br>
	
	<div style="text-align: center; width:100%; color: blue;">
		<h3><span class="glyphicon glyphicon-user"></span> Visão geral do membro</h3>
	</div>	
	<br>
	
	<h4>Dados pessoais</h4>
	<div class="divRelatorio">
		<b>Nome:</b> ${membro.nome}<br>
		<b>Celular:</b> ${membro.celular}<br>
		<b>Telefone:</b> ${membro.telefone}<br>
		<b>Email:</b> ${membro.email}<br>
		<b>Endereço:</b> ${membro.endereco}<br>
		<b>Complemento:</b> ${membro.complemento}<br>
		<b>Cep:</b> ${membro.cep}<br>
		<b>Bairro:</b> ${membro.bairro}<br>
		<b>Cidade:</b> ${membro.cidade}<br>
		<b>Estado:</b> ${membro.estado}<br>
		<b>RG:</b> ${membro.RG}<br><br>
	</div>
	<br>
	
	<hr>
	<h4>Atribuições atuais</h4>
	<div class="divRelatorio">
		<% boolean temAtribuicao = false; %>
		<c:forEach var="lista" items="${listaParticipacoes}">
			<c:if test="${lista.frequenta eq 'Sim'}">
				<b>Participa de célula:</b> ${lista.nome_celula}<br>
				<% temAtribuicao = true; %>
			</c:if>
		</c:forEach>
		<c:forEach var="lista" items="${listaLiderancaCelulas}">
			<c:if test="${lista.status_lider eq 'Ativo'}">
				<b>É líder da célula:</b> ${lista.nome_celula}<br>
				<% temAtribuicao = true; %>
			</c:if>
		</c:forEach>
		<c:forEach var="lista" items="${listaLiderancaTrein}">
			<c:if test="${lista.status_lider eq 'Ativo'}">
				<b>É líder em Treinamento:</b> ${lista.nome_celula}<br>
				<% temAtribuicao = true; %>
			</c:if>
		</c:forEach>
		<c:forEach var="lista" items="${listaLiderancaSetores}">
			<c:if test="${lista.status_lider eq 'Ativo'}">
				<jsp:useBean id="lider" class="br.com.vemev.modelo.LiderSetor" scope="page"></jsp:useBean>
				<jsp:setProperty property="id_setor" name="lider" value="${lista.id_setor}"/>
				<%	Setor setor = new SetorDAO().read( ((br.com.vemev.modelo.LiderSetor)pageContext.getAttribute("lider")).getId_setor() ); %>
				<b>É líder do Setor:</b> <%=setor.getNome_setor()%> - <%=setor.getCor_rede()%><br>
				<% temAtribuicao = true; %>
			</c:if>
		</c:forEach>
		<c:forEach var="lista" items="${listaLiderancaRedes}">
			<c:if test="${lista.status_lider eq 'Ativo'}">
				<b>É líder da Rede:</b> ${lista.cor_rede}<br>
				<% temAtribuicao = true; %>
			</c:if>
		</c:forEach>	
		<%if(temAtribuicao == false){ %>
			Sem atribuições no momento!
		<%} %>
	</div>
	<br>
	
	
	<hr>
	<h4>Outras partipações em Células</h4>
	<div class="divRelatorio">	
		<% boolean temPaticipacao = false; %>
		<c:forEach var="lista" items="${listaParticipacoes}">
	      		<c:if test="${lista.frequenta eq 'Não'}">
	      			<% temPaticipacao = true; %>
	      		</c:if>
	    </c:forEach>	
	    <%if(temPaticipacao == true){ %>		
			<table id="myTable" cellspacing="0" border="1"> 
				<thead>
			      	<tr>
			      		<th width="120px">Nome célula</th>
			      		<th width="120px">Data inicio</th>
			      		<th width="120px">Data fim</th>
			    	</tr>
				</thead>
		      <tbody>
		      	<c:forEach var="lista" items="${listaParticipacoes}">
		      		<c:if test="${lista.frequenta eq 'Não'}">
				    	<tr>
				    		<td width="120px">${lista.nome_celula}</td>
				    		<td width="120px">${lista.data_ini}</td>
				    		<td width="120px">${lista.data_fim}</td>
				    	</tr>
			    	</c:if>
			    </c:forEach>
		      </tbody>
		    </table>
	    <%}else{ %>
	    	Nenhum registro!<br>
	    <%} %>
	</div>
	<br>
	
	
	<hr>
	<h4>Lideranças anteriores</h4>
	<div class="divRelatorio">	
	
		<b>Como líder de Célula</b>		
		<% boolean temLider = false; %>
		<c:forEach var="lista" items="${listaLiderancaCelulas}">
	      		<c:if test="${lista.status_lider eq 'Inativo'}">
	      			<% temLider = true; %>
	      		</c:if>
	    </c:forEach>	
	    <%if(temLider == true){ %>
			<table id="myTable" cellspacing="0" border="1"> 
				<thead>
			      	<tr>
			      		<th width="120px">Nome célula</th>
			      		<th width="120px">Data inicio</th>
			      		<th width="120px">Data fim</th>
			    	</tr>
				</thead>
		      <tbody>	        
		      	<c:forEach var="lista" items="${listaLiderancaCelulas}">
		      		<c:if test="${lista.status_lider eq 'Inativo'}">
				    	<tr>
				    		<td width="120px">${lista.nome_celula}</td>
				    		<td width="120px">${lista.data_ini}</td>
				    		<td width="120px">${lista.data_fim}</td>
				    	</tr>
			    	</c:if>
			    </c:forEach>
		      </tbody>
		    </table>
	    <%}else{ %>
	    	<br>Nenhum registro!<br>
	    <%} %>
	    
	    
	    <hr>
	    <b>Como líder em Treinamento</b>
	    <% temLider = false; %>
		<c:forEach var="lista" items="${listaLiderancaTrein}">
	      		<c:if test="${lista.status_lider eq 'Inativo'}">
	      			<% temLider = true; %>
	      		</c:if>
	    </c:forEach>	
	    <%if(temLider == true){ %>
			<table id="myTable" cellspacing="0" border="1"> 
				<thead>
			      	<tr>
			      		<th width="120px">Nome célula</th>
			      		<th width="120px">Data inicio</th>
			      		<th width="120px">Data fim</th>
			    	</tr>
				</thead>
		      <tbody>	        
		      	<c:forEach var="lista" items="${listaLiderancaTrein}">
		      		<c:if test="${lista.status_lider eq 'Inativo'}">
				    	<tr>
				    		<td width="120px">${lista.nome_celula}</td>
				    		<td width="120px">${lista.data_ini}</td>
				    		<td width="120px">${lista.data_fim}</td>
				    	</tr>
			    	</c:if>
			    </c:forEach>
		      </tbody>
		    </table>
	    <%}else{ %>
	    	<br>Nenhum registro!<br>
	    <%} %>
	    
	    
	    <hr>
	    <b>Como líder de Setor</b>
	    <% temLider = false; %>
		<c:forEach var="lista" items="${listaLiderancaSetores}">
	      		<c:if test="${lista.status_lider eq 'Inativo'}">
	      			<% temLider = true; %>
	      		</c:if>
	    </c:forEach>	
	    <%if(temLider == true){ %>
			<table id="myTable" cellspacing="0" border="1"> 
				<thead>
			      	<tr>
			      		<th width="120px">Nome setor</th>
			      		<th width="120px">Data inicio</th>
			      		<th width="120px">Data fim</th>
			    	</tr>
				</thead>
		      <tbody>	        
		      	<c:forEach var="lista" items="${listaLiderancaSetores}">
		      		<c:if test="${lista.status_lider eq 'Inativo'}">
				    	<tr>
				    		<td width="120px">
				    			<jsp:useBean id="liderAnterior" class="br.com.vemev.modelo.LiderSetor" scope="page"></jsp:useBean>
								<jsp:setProperty property="id_setor" name="liderAnterior" value="${lista.id_setor}"/>
								<%	Setor setorAnt = new SetorDAO().read( ((br.com.vemev.modelo.LiderSetor)pageContext.getAttribute("liderAnterior")).getId_setor() ); %>
								<%=setorAnt.getNome_setor()%> - <%=setorAnt.getCor_rede()%>
				    		</td>
				    		<td width="120px">${lista.data_ini}</td>
				    		<td width="120px">${lista.data_fim}</td>
				    	</tr>
			    	</c:if>
			    </c:forEach>
		      </tbody>
		    </table>
	    <%}else{ %>
	    	<br>Nenhum registro!<br>
	    <%} %>
	    
	    
	    <hr>
	    <b>Como líder de Rede</b>
	    <% temLider = false; %>
		<c:forEach var="lista" items="${listaLiderancaRedes}">
	      		<c:if test="${lista.status_lider eq 'Inativo'}">
	      			<% temLider = true; %>
	      		</c:if>
	    </c:forEach>	
	    <%if(temLider == true){ %>
			<table id="myTable" cellspacing="0" border="1"> 
				<thead>
			      	<tr>
			      		<th width="120px">Nome da Rede</th>
			      		<th width="120px">Data inicio</th>
			      		<th width="120px">Data fim</th>
			    	</tr>
				</thead>
		      <tbody>	        
		      	<c:forEach var="lista" items="${listaLiderancaRedes}">
		      		<c:if test="${lista.status_lider eq 'Inativo'}">
				    	<tr>
				    		<td width="120px">${lista.cor_rede}</td>
				    		<td width="120px">${lista.data_ini}</td>
				    		<td width="120px">${lista.data_fim}</td>
				    	</tr>
			    	</c:if>
			    </c:forEach>
		      </tbody>
		    </table>
	    <%}else{ %>
	    	<br>Nenhum registro!<br>
	    <%} %>
	    
	</div>
	<br>
	<div style="float: right;">
		<button type="button" onclick="closePopup()" class="btn btn-primary">Fechar</button>
	</div>
	<br>
	<br>
</form>