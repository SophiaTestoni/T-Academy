<%@page import="java.sql.PreparedStatement"%>
<%@page import="atvJSP.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alterar Postagem</title>
</head>
<body>

<%		
		
		int codigo = Integer.parseInt(request.getParameter("codigo"));
		String titulo = request.getParameter("titulo");
		String subtitulo = request.getParameter("subtitulo");
		String conteudo = request.getParameter("conteudo");
		
	
		Conexao c = new Conexao();
		
		
		String sql = "UPDATE postagens SET titulo = ?, subtitulo = ?, conteudo = ? WHERE codigo = ?";
		
	
		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
		pstmt.setString(1, titulo);
		pstmt.setString(2,subtitulo);
		pstmt.setString(3,conteudo);
		pstmt.setInt(4,codigo);
		
		//Executar a alteração
		pstmt.execute();
		
		
		response.sendRedirect("index.jsp");
	%>
 

</body>
</html>