<%@page import="java.sql.PreparedStatement"%>
<%@page import="atvJSP.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Remover Postagem</title>
</head>
<body>


	<%		

	//Obter o codigo da pessoa
		int codigo = Integer.parseInt(request.getParameter("codigo"));

		//Efetuar a conexao
		Conexao c = new Conexao();
		
		// Comando SQL
		String sql = "DELETE FROM postagens WHERE codigo = ?";
		
	
		//PreparedStatement
		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
		pstmt.setInt(1,codigo);
		
		//Executar a remoção
		pstmt.execute();
		
		//Redirecionamento
		response.sendRedirect("index.jsp");
	%>



</body>
</html>