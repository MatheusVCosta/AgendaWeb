package br.senai.sp.jandira.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.jandira.dao.UsuarioDao;
import br.senai.sp.jandira.modelo.Usuario;

@WebServlet("/Autentica")
public class Autentica extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;

   
    public Autentica() {
    
    
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("txtEmail");
		String senha =  request.getParameter("txtSenha");
		
		UsuarioDao usuarioDAO = new UsuarioDao();
		Usuario usuario = new Usuario();
		
		usuario = usuarioDAO.autenticar(email, senha);
		
		if(usuario == null){
			RequestDispatcher rd = request.getRequestDispatcher("login.html");
			rd.forward(request, response);
		}else{
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}
		
		
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);//encaminhar para o index.jsp e envia txtEmail,senha e frase


		
		
		/*int valor1= 10;
		int valor2 = 20;
		
		
		//String email = request.getParameter("txtEmail");
		request.setAttribute("frase", "Estou vindo de uma servlet");
		request.setAttribute("v1", valor1);
		request.setAttribute("v2", valor2);*/
		
		/*System.out.println(request.getParameter("txtEmail"));
		System.out.println(request.getParameter("txtSenha"));*/
		
		
	}

}