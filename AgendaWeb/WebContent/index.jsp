<%@page import="br.senai.sp.jandira.modelo.Usuario"%>
<%@page import="br.senai.sp.jandira.servlet.Autentica"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
   	Usuario u = new Usuario();
    u = (Usuario)session.getAttribute("usuario");
    
    if(u == null){
    	response.sendRedirect("login.html");
    }else{
    	
    
    
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
			</head>
			<body>
			
			
				<h1>Resultado:</h1>
				<h3>Email: <%= u.getEmail() %></h3>
				<h3>Senha: <%= u.getSenha()%></h3>
				<h3>Cidade: <%= u.getCidade()%></h3>
				<h3>Nome: <%= u.getNome()%></h3>
				
				<%-- <h3>Frase: <%= frase%></h3>
				<h3>Soma: <%= soma %></h3> --%>
		
			
			<%-- 	<h1>Resultado:</h1>
				<h3>Email: <%= request.getParameter("txtEmail") %></h3>
				<h3>Senha: <%= request.getParameter("txtSenha") %></h3>
				<h3>Frase: <%=request.getAttribute("frase") %></h3> --%>
			</body>
		</html>
<%} %>