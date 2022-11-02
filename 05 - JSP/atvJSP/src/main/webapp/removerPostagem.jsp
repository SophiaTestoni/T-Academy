<%@page import="java.sql.PreparedStatement"%>
<%@page import="atvJSP.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
		
	<%		
		int codigo = Integer.parseInt(request.getParameter("codigo"));
		
		String deleteC = "DELETE FROM comentarios WHERE codigo_noticia = ?";
		
		//Efetuar a conexao
		Conexao c = new Conexao();
		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(deleteC);
		pstmt.setInt(1,codigo);
		//Executar a remoção
		pstmt.execute();

		// Comando SQL
		String sql = "DELETE FROM postagens WHERE codigo = ?";
			
		//PreparedStatement
		PreparedStatement pstmtP = c.efetuarConexao().prepareStatement(sql);
		pstmtP.setInt(1,codigo);
				
		//Executar a remoção
		pstmtP.execute();
				
		//Redirecionamento
		response.sendRedirect("index.jsp");


	%>


</body>
</html>