<!-- cabecalho default para todas as paginas -->
<style type="text/css">
.loader {
	position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	z-index: 9999;
	background: url('/image/loading_ios.gif') 50% 50% no-repeat rgb(249,249,249);
}
</style>

<%@page import="br.com.vemev.modelo.MembroUserWeb"%>
<% 	
	MembroUserWeb membroSession = (MembroUserWeb) request.getSession().getAttribute(MembroUserWeb.MEMBRO_SESSION);
	if(membroSession != null && membroSession.getAcesso().equals(MembroUserWeb.TipoAcessoLogin.LIDER_ACESSO)){
		//acesso total para lider
%>
	<ul class="nav navbar-nav navbar-right">
	<li class="active">
		<a href="/home.jsp"><span class="glyphicon glyphicon-home"></span> Visão Lider</a>
	</li>
	<li class="dropdown">
		&nbsp;
	</li>
	<li class="dropdown">
		<a href="/vemev/agenda/visitantes?nomeCelula=Todas&status=Não contatado">
			Agenda
		</a>
	</li>
	
	<li class="dropdown">
		<a href="#" class="dropdown-toggle" data-toggle="dropdown">Membro<b class="caret"></b></a>
		<ul class="dropdown-menu">
			<li class="dropdown-header"></li>
			<li><a href="/Tela de cadastro de Membros.jsp">Cadastrar</a></li>
			<li><a href="/vemev/membro/consultaMembros">Consultar</a></li>
			<li><a href="/vemev/membro/consultaMembros">Alterar</a></li>
		</ul>
	</li>

	<li class="dropdown">
		<a href="#" class="dropdown-toggle" data-toggle="dropdown">Visitante<b class="caret"></b></a>
		<ul class="dropdown-menu">
			<li class="dropdown-header"></li>
			<li><a href="/Tela de cadastro dos Visitantes.jsp">Cadastrar</a></li>
			<li><a href="/vemev/visitante/consultaVisitantes">Consultar</a></li>
			<li><a href="/vemev/visitante/consultaVisitantes">Alterar</a></li>
		</ul>
	</li>

	<li class="dropdown">
		<a href="#" class="dropdown-toggle" data-toggle="dropdown">Célula<b class="caret"></b></a>
		<ul class="dropdown-menu">
			<li class="dropdown-header"></li>
			<li><a href="/vemev/celula/cadastrarCelula">Cadastrar</a></li>
			<li><a href="/vemev/celula/consultaCelula">Consultar</a></li>
			<li><a href="/vemev/celula/consultaCelula">Alterar</a></li>
		</ul>
	</li>

	<li class="dropdown">
		<a href="#" class="dropdown-toggle" data-toggle="dropdown">Setor<b class="caret"></b></a>
		<ul class="dropdown-menu">
			<li class="dropdown-header"></li>
			<li><a href="/Tela de cadastro do setor.jsp">Cadastrar</a></li>
			<li><a href="/vemev/setor/consultaSetor">Consultar</a></li>
			<li><a href="/vemev/setor/consultaSetor">Alterar</a></li>
		</ul>
	</li>

	<li class="dropdown">
		<a href="#" class="dropdown-toggle" data-toggle="dropdown">Lider <b class="caret"></b></a>
		<ul class="dropdown-menu">
			<li class="dropdown-header"></li>
			<li class="dropdown-submenu" id="btn-liderCelula">
				<a tabindex="-1" href="#"> < Lider de Célula </a>
				<ul class="dropdown-menu" id="menu-liderCelula"
					style="right: 192px; top: 2px;">
					<li><a tabindex="-1" href="/vemev/cadastro/liderCelula">Cadastrar</a></li>
					<li><a tabindex="-1" href="/vemev/lider/consultaLideres?tipoLider=Celula">Consultar</a></li>
					<li><a tabindex="-1" href="/vemev/lider/consultaLideres?tipoLider=Celula">Alterar</a></li>
				</ul>
			</li>
			<li class="dropdown-submenu" id="btn-liderTreinamento">
				<a tabindex="-1" href="#"> < Lider em Treinamento </a>
				<ul class="dropdown-menu" id="menu-liderTreinamento"
					style="right: 192px; top: 31px;">
					<li><a tabindex="-1" href="/vemev/cadastro/liderTreinamento">Cadastrar</a></li>
					<li><a tabindex="-1" href="/vemev/lider/consultaLideres?tipoLider=Treinamento">Consultar</a></li>
					<li><a tabindex="-1" href="/vemev/lider/consultaLideres?tipoLider=Treinamento">Alterar</a></li>
				</ul>
			</li>
			
			<li class="divider"></li>
			<li class="dropdown-submenu" id="btn-liderSetor">
				<a tabindex="-1" href="#"> < Lider de Setor </a>
				<ul class="dropdown-menu" id="menu-liderSetor"
					style="right: 192px; top: 72px;">
					<li><a tabindex="-1" href="/vemev/lider/CadastrarLiderSetor">Cadastrar</a></li>
					<li><a tabindex="-1" href="/vemev/lider/consultaLideres?tipoLider=Setor">Consultar</a></li>
					<li><a tabindex="-1" href="/vemev/lider/consultaLideres?tipoLider=Setor">Alterar</a></li>
				</ul>
			</li>							
			<li class="dropdown-submenu" id="btn-liderRede">
				<a tabindex="-1" href="#"> < Lider de Rede </a>
				<ul class="dropdown-menu" id="menu-liderRede"
					style="right: 192px; top: 99px;">
						<li><a tabindex="-1" href="/vemev/cadastro/liderRede">Cadastrar</a></li>
						<li><a tabindex="-1" href="/vemev/lider/consultaLideres?tipoLider=Rede">Consultar</a></li>
						<li><a tabindex="-1" href="/vemev/lider/consultaLideres?tipoLider=Rede">Alterar</a></li>
					</ul>
				</li>
			</ul>
		</li>
		
		<li class="dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown">Reunião<b class="caret"></b></a>
			<ul class="dropdown-menu">
				<li class="dropdown-header"></li>
				<li><a href="/vemev/reuniao/cadastrarReuniao">Cadastrar</a></li>
				<li><a href="/vemev/reuniao/consultaReunioes">Consultar</a></li>
				<li><a href="/vemev/reuniao/consultaReunioes">Alterar</a></li>
			</ul>
		</li>
		
		<li class="dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown">Rede<b class="caret"></b></a>
			<ul class="dropdown-menu">
				<li class="dropdown-header"></li>
				<li><a tabindex="-1" href="/vemev/lider/consultaLiderRede">Consultar</a></li>
			</ul>
		</li>
		
		<li class="dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"></span></b></a>
			<ul class="dropdown-menu">
				<li class="dropdown-header"></li>
				<li><a tabindex="-1" href="/vemev/lider/consultaLiderRede">Alterar senha de lider</a></li>
				<li><a tabindex="-1" href="/vemev/lider/consultaLiderRede">Alterar senha de membro</a></li>
			</ul>
		</li>
		
		<li class="dropdown">
			<a style="text-decoration:underline;" href="/vemev/logout">
				<span class="glyphicon glyphicon-log-out"></span> Sair
			</a>
		</li>
	</ul>
	
	
<%
	}else{
	//acesso limitado para o membro	
%>		
	<ul class="nav navbar-nav navbar-right">
		<li class="active">
			<a href="/home.jsp"><span class="glyphicon glyphicon-home"></span> Visão Membro</a>
		</li>
		<li class="dropdown">
			&nbsp;
		</li>
		<li class="dropdown">
			<a href="/vemev/agenda/visitantes?nomeCelula=Todas&status=Não contatado">
				Agenda
			</a>
		</li>
		
		<li class="dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown">Visitante<b class="caret"></b></a>
			<ul class="dropdown-menu">
				<li class="dropdown-header"></li>
				<li><a href="/Tela de cadastro dos Visitantes.jsp">Cadastrar</a></li>
				<li><a href="/vemev/visitante/consultaVisitantes">Consultar</a></li>
				<li><a href="/vemev/visitante/consultaVisitantes">Alterar</a></li>
			</ul>
		</li>

		<li class="dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown">Célula<b class="caret"></b></a>
			<ul class="dropdown-menu">
				<li class="dropdown-header"></li>
				<li><a href="/vemev/celula/consultaCelula">Consultar</a></li>
			</ul>
		</li>
		
		<li class="dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown">Reunião<b class="caret"></b></a>
			<ul class="dropdown-menu">
				<li class="dropdown-header"></li>
				<li><a href="/vemev/reuniao/cadastrarReuniao">Cadastrar</a></li>
				<li><a href="/vemev/reuniao/consultaReunioes">Consultar</a></li>
				<li><a href="/vemev/reuniao/consultaReunioes">Alterar</a></li>
			</ul>
		</li>
		
		<li class="dropdown">
			<a style="text-decoration:underline;" href="/vemev/logout">
				<span class="glyphicon glyphicon-log-out"></span> Sair
			</a>
		</li>
	</ul>
<%	
	}
%>

<script type="text/javascript">
	window.onload = function(e){	
		//oculta loading da pagina
		$(".loader").fadeOut("slow");
	}
	var sub = false;
	$(document).ready(function() {
		$('form').submit(function(e) {
			//alert("trying...");
			if(sub == true){
		   		alert("Por favor aguarde até o fim da solicitação!");
				e.preventDefault();
			}
		   sub = true;
		   $(".loader").show();
		}); 
	})
	
</script>
