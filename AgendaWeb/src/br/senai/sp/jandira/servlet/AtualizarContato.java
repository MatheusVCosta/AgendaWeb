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

@WebServlet("/AtualizarContato")
public class AtualizarContato extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public AtualizarContato() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("atualizar contato");
		System.out.println("sd");
		Contatos contato = new Contatos();
		contato.setId(Integer.parseInt(request.getParameter("txtIdContato")));
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
		
		if(contatoDao.atualizar()){
			rd = request.getRequestDispatcher("index.jsp");
		}else{
			rd = request.getRequestDispatcher("editar_contato.jsp");
		}
		rd.forward(request, response);
	}

}
