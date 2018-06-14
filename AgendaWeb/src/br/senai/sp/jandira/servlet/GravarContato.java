package br.senai.sp.jandira.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.jandira.dao.ContatoDAO;
import br.senai.sp.jandira.modelo.Contatos;

@WebServlet("/GravarContato")
public class GravarContato extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public GravarContato() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("gravando contato");
		
		Contatos contato = new Contatos();
		contato.setNome(request.getParameter("txtNome"));
		contato.setLogradouro(request.getParameter("txtLogradouro"));
		contato.setEmail(request.getParameter("txtEmail"));
		contato.setBairro(request.getParameter("txtBairro"));
		contato.setCelular(request.getParameter("txtCelular"));
		contato.setCep(request.getParameter("txtCep"));
		contato.setCidade(request.getParameter("txtCidade"));
		contato.setDtNasc(request.getParameter("txtDtNasc"));
		contato.setEstado(request.getParameter("txtEstado"));
		contato.setTelefone(request.getParameter("txtTelefone"));
		contato.setSexo(request.getParameter("cbSexo"));
		contato.setIdUsuario(Integer.parseInt(request.getParameter("txtIdUsuario")));
		
		ContatoDAO contatoDao = new ContatoDAO();
		contatoDao.setContato(contato);
		
		RequestDispatcher rd;
		
		if(contatoDao.gravarContato()){
			rd = request.getRequestDispatcher("index.jsp");
		}else{
			rd = request.getRequestDispatcher("cadastrar_contatos.jsp");
		}
		rd.forward(request, response);
	}

}
