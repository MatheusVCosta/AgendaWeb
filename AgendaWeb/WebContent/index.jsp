<%@page import="br.senai.sp.jandira.dao.ContatoDAO"%>
<%@page import="br.senai.sp.jandira.modelo.Contatos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.senai.sp.jandira.modelo.Usuario"%>
<%@page import="br.senai.sp.jandira.servlet.Autentica"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
	ArrayList<Contatos> listaContatos= new ArrayList();

	Usuario u = new Usuario();
	u = (Usuario) session.getAttribute("usuario");

	if (u == null) {
		response.sendRedirect("login.html");
	} else {
		ContatoDAO contatoDao = new ContatoDAO();
		listaContatos = contatoDao.getContatos(u.getId());
		
		/* String email = request.getParameter("txtEmail");
		String senha = request.getParameter("txtSenha"); */

		/*String frase = request.getAttribute("frase").toString();    
		int soma = (int)request.getAttribute("v1") + (int)request.getAttribute("v2"); */
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resposta do Servlet</title>
<link href="css/bootstrap.css" rel="stylesheet">
</head>
<body style="background:#084950">
	<!--CABE�ALHO DA PAGINA-->
	<header>
		<div style="background-color: #48e6d6; height: 100px; box-shadow: 0px 9px 10px #48e6d680;">
			<div class="container">
				<div class="row">
					<div class="col-md-12 col-md-offset-2">
						<div style="margin-left: -400px;">
							<h1 style="color: white;">UaiContatos</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	
	<!-- CONTE�DO -->
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="panel panel-primary" style="margin-top:20px; ">
				 	<div class="panel-heading"><img style="margin-right:10px;" src="imagens/user32.png" height="24px" width="24px" ><strong>Usu�rio</strong></div>
				 	<div class="panel-body">
				    	<p><strong>Usu�rio:</strong><%=u.getNome()%></p>
				    	<p><strong>Cidade:</strong><%=u.getCidade()%></p>
				    	<p><strong>DataNascimento: </strong><%=u.getDtNasc()%></p>
				    	<p>
				    		<img style="margin-right:10px;" src="imagens/sair.png" height="24px" width="24px" ><a href="sair.jsp">Efetuar Logout</a>
				    	 </p>
				 	</div>
				</div>
				<div class="panel panel-primary" style="margin-top:-10px; ">
				 	<div class="panel-heading"><img style="margin-right:10px;" src="imagens/menu.png" height="24px" width="24px" ><strong>Menu</strong></div>
				 	<div class="panel-body">
				    	<ul class="nav">
				    		<li class="nav-item"><a href="index.jsp">Home</a></li>
				    		<li class="nav-item"><a href="cadastrar_contatos.jsp">Cadastrar contato</a></li>
				    	</ul>
				 	</div>
				</div>
			</div>
			<div class="col-md-9">
				<div class="panel panel-primary" style="margin-top:20px; ">
				 	<div class="panel-heading"><img style="margin-right:10px;" src="imagens/agenda2.png" height="24px" width="24px" ><strong>Meus contatos</strong></div>
				 	<div class="panel-body">
				    	<table class="table table-hover">
							<thead>
								<tr>
									<th>ID</th>
									<th>Nome</th>
									<th>E-mail</th>
									<th></th>
									<th></th>
								</tr>
							</thead>	
								<%for(Contatos contato : listaContatos){%>
									<tr>
										<td><%= contato.getId()%></td>
										<td><%= contato.getNome()%></td>
										<td><%= contato.getEmail()%></td>
										<td><a href="editar_contato.jsp?id=<%= contato.getId()%>"><img src="imagens/edit.png" height="24px" width="24px" ></a></td>
										<td><a href="excluir_contato.jsp?id=<%= contato.getId()%>"><img src="imagens/del.png" height="24px" width="24px" ></a></td>
									</tr>
								
								<%}%> 
								
								
								
						</table>
				 	</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container" style="color:white;">
		<div class="container-fluid">
			<div class="navbar-header">
				<p>&copy;TheuSoft - 2018</p>
			</div>
		</div>
	</div>
	<%-- 	<h1>Resultado:</h1>
				<h3>Email: <%= u.getEmail() %></h3>
				<h3>Senha: <%= u.getSenha()%></h3>
				<h3>Cidade: <%= u.getCidade()%></h3>
				<h3>Nome: <%= u.getNome()%></h3>
				
				<h3>Frase: <%= frase%></h3>
				<h3>Soma: <%= soma %></h3> --%>


	<%-- 	<h1>Resultado:</h1>
				<h3>Email: <%= request.getParameter("txtEmail") %></h3>
				<h3>Senha: <%= request.getParameter("txtSenha") %></h3>
				<h3>Frase: <%=request.getAttribute("frase") %></h3> --%>
</body>
</html>
<%
	}
%>