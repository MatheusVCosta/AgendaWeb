package br.senai.sp.jandira.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import br.senai.sp.jandira.dbutils.Conexao;
import br.senai.sp.jandira.modelo.Contatos;

public class ContatoDAO {
	private PreparedStatement stm;
	private ResultSet rs;
	private Contatos contato;
	
	public ArrayList<Contatos> getContatos(int idUsuario){
		ArrayList<Contatos> contatos = new ArrayList<>();
		
		String sql = "SELECT * FROM contatos WHERE idUsuario = ? ORDER BY nome ASC";
		stm = null;
		try{
			stm = Conexao.getConexao().prepareStatement(sql);
			stm.setInt(1, idUsuario);
			rs = stm.executeQuery();
			
			while(rs.next()){
				
				contato = new Contatos();
				contato.setId(rs.getInt("id"));
				contato.setNome(rs.getString("nome"));
				contato.setDtNasc(rs.getDate("dtNasc"));
				contato.setEmail(rs.getString("email"));
				contato.setLogradouro(rs.getString("logradouro"));
				contato.setBairro(rs.getString("bairro"));
				contato.setCidade(rs.getString("cidade"));
				contato.setEstado(rs.getString("estado"));
				contato.setCep(rs.getString("cep"));
				contato.setTelefone(rs.getString("telefone"));
				contato.setCelular(rs.getString("celular"));
				contato.setSexo(rs.getString("sexo"));
				contato.setIdUsuario(rs.getInt("idUsuario"));
				contatos.add(contato);
				
			}
			
			
			
		}catch(Exception erro){
			erro.printStackTrace();
		}
		
		
		return contatos;
	}
	
}
