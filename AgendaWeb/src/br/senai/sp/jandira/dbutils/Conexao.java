package br.senai.sp.jandira.dbutils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
	private static Connection con;
	
	public static Connection getConexao(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String dbURL = "jdbc:mysql://10.107.134.3:3306/agenda?useSSL=FALSE";
			con = DriverManager.getConnection(dbURL, "root", "bcd127");
			System.out.println("Banco Conectado");
		}
		catch(SQLException erroBanco){
			erroBanco.printStackTrace();
			System.out.println("Banco n�o Conectado");
		}catch(Exception erro){
			erro.printStackTrace();
			System.out.println("Banco n�o Conectado1");
		}
		return con;
	}
}
