<%@page import="br.senai.sp.jandira.dao.ContatoDAO"%>
<%@page import="br.senai.sp.jandira.modelo.Contatos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.senai.sp.jandira.modelo.Usuario"%>
<%@page import="br.senai.sp.jandira.servlet.Autentica"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
	ArrayList<Contatos> listaContatos= new ArrayList();

	Usuario u = new Usuario();
	u = (Usuario) session.getAttribute("usuario");

	if (u == null) {
		response.sendRedirect("login.html");
	} else {
		ContatoDAO contatoDao = new ContatoDAO();
		Contatos contato = new Contatos();
		contato = contatoDao.getContato(Integer.parseInt(request.getParameter("id")));
		
		System.out.println(contatoDao.getContato(Integer.parseInt(request.getParameter("id"))));
		
		
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
			<div class="col-md-9" style="margin-top:20px;">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3>Vamos efetuar o seu cadastro</h3>
					</div>
					<div class="panel body">
						<form method="get" action="AtualizarContato">
						<fieldset>
							<legend>Dados gerais:</legend>
							<div class="form-row">
								<div class="form group col-md-6">
									<input type="hidden" name="txtIdUsuario" value="<%=u.getId()%>">
									<input type="hidden" name="txtIdContato" value="<%=u.getId()%>">
									<label for="txtNome">Nome</</label>
									<input type="text" name="txtNome" class="form-control" style="width: 400px;" value="<%=contato.getNome() %>">
								</div>
								<div class="form group col-md-3">
									<label for="txtDtNasc">Data de nascimento</</label>
									<input type="date" name="txtDtNasc" class="form-control" value="<%=contato.getDtNasc()%>">
								</div>
								<div class="form group col-md-3">
									<label for="cbSexo">Sexo</</label>
									<select name="cbSexo" class="form-control">
										<option value="s" <%=contato.getSexo().equals("s")? "selected":""%>>Selecione</option>
										<option value="f" <%=contato.getSexo().equals("f")? "selected":""%>>Feminino</option>
										<option value="m" <%=contato.getSexo().equals("m")? "selected":""%>>Masculino</option>
									</select>
								</div>
							</div>
						</fieldset>
						<fieldset>
							<legend>Dados de Contatos:</legend>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="txtEmail">E-mail</</label>
									<input type="email" name="txtEmail" class="form-control" style="width: 400px;" value="<%=contato.getEmail()%>">
								</div>
								<div class="form-group col-md-3">
									<label for="txtTelefone">Telefone</</label>
									<input type="text" name="txtTelefone" class="form-control" value="<%=contato.getTelefone() %>">
								</div>
								<div class="form-group col-md-3">
									<label for="txtCelular">Celular</</label>
									<input type="text" name="txtCelular" class="form-control" value="<%=contato.getCelular()%>">
								</div>
							</div>
						</fieldset>
						<fieldset>
							<legend>Endereço:</legend>
							<div class="form-row">
								<div class="form-group col-md-8">
									<label for="txtLogradouro">Logradouro</</label>
									<input type="text" name="txtLogradouro" class="form-control" style="width: 550px;" value="<%=contato.getLogradouro()%>">
								</div>
								<div class="form-group col-md-4">
									<label for="txtBairro">Bairro</</label>
									<input type="text" name="txtBairro" class="form-control" value="<%=contato.getBairro()%>">
								</div>
								
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="txtCidade">Cidade</</label>
									<input type="text" name="txtCidade" class="form-control" style="width: 400px;" value="<%=contato.getCidade()%>">
								</div>
								<div class="form-group col-md-3">
									<label for="txtEstado">Estado</</label>
									<input type="text" name="txtEstado" class="form-control" value="<%=contato.getEstado()%>">
								</div>
								<div class="form-group col-md-3">
									<label for="txtCep">CEP</</label>
									<input type="text" name="txtCep" class="form-control" value="<%=contato.getCep()%>">
								</div>
															
							</div>
						</fieldset>
						<div class="form-group" style="margin-left: 50px;">
							<input class="btn btn-success"type="submit" value="Salvar">
							<input class="btn btn-warning"type="submit" value="Limpar">
							<input class="btn btn-danger"type="submit" value="Sair">
						</div>	
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