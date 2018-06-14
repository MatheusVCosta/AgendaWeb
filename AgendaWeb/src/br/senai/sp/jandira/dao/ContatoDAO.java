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
	
	public void setContato(Contatos contato) {
		this.contato = contato;
	}
	public Contatos getContato(int idContato){
		
		String sql = "SELECT * FROM contatos WHERE id = ? ORDER BY nome ASC";
		stm = null;
		try{
			stm = Conexao.getConexao().prepareStatement(sql);
			stm.setInt(1, idContato);
			rs = stm.executeQuery();
			
			rs.next();	
			contato = new Contatos();
			contato.setId(rs.getInt("id"));
			contato.setNome(rs.getString("nome"));
			contato.setDtNasc(rs.getString("dtNasc"));
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
				
		}catch(Exception erro){
			erro.printStackTrace();
		}
		
		
		return contato;
	}
	
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
				contato.setDtNasc(rs.getString("dtNasc"));
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
	public boolean gravarContato(){
		boolean status = true;
		String sql = "INSERT INTO Contatos (nome, dtNasc, email, logradouro, bairro, cidade, "
				+ "estado, cep, telefone, celular, sexo, idUsuario) VALUES(?,?,?,?,?,?,?,?,?,?,?,?) ";
		
		try{
			stm = Conexao.getConexao().prepareStatement(sql);
			stm.setString(1, contato.getNome());
			stm.setString(2, contato.getDtNasc());
			stm.setString(3, contato.getEmail());
			stm.setString(4, contato.getLogradouro());
			stm.setString(5, contato.getBairro());
			stm.setString(6, contato.getCidade());
			stm.setString(7, contato.getEstado());
			stm.setString(8, contato.getCep());
			stm.setString(9, contato.getTelefone());
			stm.setString(10, contato.getCelular());
			stm.setString(11, contato.getSexo());
			stm.setInt(12, contato.getIdUsuario());
			stm.execute();
			
			
			
			
			Conexao.getConexao().close();
		}catch(Exception erro){
			status = false;
			erro.printStackTrace();
		}
		
		return status;
	}
	
	
}
