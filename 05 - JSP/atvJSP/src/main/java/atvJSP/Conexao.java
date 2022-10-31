package atvJSP;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {
	//Atributo contendo acesso ao banco de dados
	private Connection con = null;
	
	//Metodo para efetuar a conexão
	public Connection efetuarConexao() {
		
		//Tentativa
		try {
			
			con = DriverManager.getConnection("jdbc:mysql://localhost/jspblog", "root", "#Nintendo260100");
			System.out.println("Conexão efetuada com sucesso!");
			
		}catch(Exception erro) {
			System.out.println(erro.getMessage());
			
		}
		//Retorno
		return con;
	}

}