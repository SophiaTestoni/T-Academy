<%@page import="java.sql.PreparedStatement"%>
<%@page import="atvJSP.Conexao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
		
		//Obter o codigo da pessoa
		int codigo = Integer.parseInt(request.getParameter("codigo"));
		String titulo = request.getParameter("titulo");
		String subtitulo = request.getParameter("subtitulo");

		//Efetuar a conexao
		Conexao c = new Conexao();
		
		// Comando SQL
		String sql = "UPDATE postagens SET titulo = ?, subtitulo = ? WHERE codigo = ?";
		
		//PreparedStatement
		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
		pstmt.setString(1, titulo);
		pstmt.setString(2,subtitulo);
		pstmt.setInt(3,codigo);
		
		//Executar a altera��o
		pstmt.execute();
		
		//Redirecionamento
		response.sendRedirect("index.jsp");
	%>
 

</body>
</html>