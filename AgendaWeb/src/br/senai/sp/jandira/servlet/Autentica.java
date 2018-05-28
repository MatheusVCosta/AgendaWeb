package br.senai.sp.jandira.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Autentica")
public class Autentica extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;

   
    public Autentica() {
    
    
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int valor1= 10;
		int valor2 = 20;
		
		
		//String email = request.getParameter("txtEmail");
		request.setAttribute("frase", "Estou vindo de uma servlet");
		request.setAttribute("v1", valor1);
		request.setAttribute("v2", valor2);
		
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);//encaminhar para o index.jsp e envia txtEmail,senha e frase
		/*System.out.println(request.getParameter("txtEmail"));
		System.out.println(request.getParameter("txtSenha"));*/
		
		
	}

}