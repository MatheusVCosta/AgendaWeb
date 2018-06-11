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
	<!--CABEÇALHO DA PAGINA-->
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
	
	<!-- CONTEÚDO -->
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="panel panel-primary" style="margin-top:20px;">
				 	<div class="panel-heading"><img style="margin-right:10px;" src="imagens/user32.png" height="24px" width="24px" ><strong>Usuário</strong></div>
				 	<div class="panel-body">
				    	<p><strong>Usuário:</strong><%=u.getNome()%></p>
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
				    		<li class="nav-item"><a href="#">Cadastrar contato</a></li>
				    	</ul>
				 	</div>
				</div>
			</div>
			<div class="col-md-9">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3>Vamos efetuar o seu cadastro</h3>
					</div>
					<div class="panel body">
						<form method="post" action="GravarContato">
						<fieldset>
							<legend>Dados gerais:</legend>
							<div class="form-row">
								<div class="form group col-md-6">
									<label for="txtName">Nome</</label>
									<input type="text" name="txtName" class="form-control">
								</div>
								<div class="form group col-md-3">
									<label for="txtName">Data de nascimento</</label>
									<input type="text" name="txtName" class="form-control">
								</div>
								<div class="form group col-md-3">
									<label for="cbSexo">Sexo</</label>
									<select name="cbSexo" class="form-control">
										<optio value="s">Selecione</option>
										<option value="f">Feminino</option>
										<option value="m">Masculino</option>
									</select>
								</div>
							</div>
						</fieldset>
						<fieldset>
							<legend>Dados de Contatos:</legend>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="txtEmail">E-mail</</label>
									<input type="email" name="txtEmail" class="form-control">
								</div>
								<div class="form-group col-md-3">
									<label for="txtTelefone">Telefone</</label>
									<input type="text" name="txtTelefone" class="form-control">
								</div>
								<div class="form-group col-md-3">
									<label for="txtCelular">Celular</</label>
									<input type="text" name="txtCelular" class="form-control">
								</div>
							</div>
						</fieldset>
						<fieldset>
							<legend>Endereço:</legend>
							<div class="form-row">
								<div class="form-group col-md-8">
									<label for="txtLogradouro">Logradouro</</label>
									<input type="text" name="txtLogradouro" class="form-control">
								</div>
								<div class="form-group col-md-4">
									<label for="txtBairro">Bairro</</label>
									<input type="text" name="txtBairro" class="form-control">
								</div>
								
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="txtLogradouro">Logradouro</</label>
									<input type="text" name="txtLogradouro" class="form-control">
								</div>
								<div class="form-group col-md-3">
									<label for="txtBairro">Bairro</</label>
									<input type="text" name="txtBairro" class="form-control">
								</div>
								<div class="form-group col-md-3">
									<label for="txtBairro">Bairro</</label>
									<input type="text" name="txtBairro" class="form-control">
								</div>
								
							</div>
						</fieldset>
						</form>
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