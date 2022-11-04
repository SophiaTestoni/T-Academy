<%@page import="java.sql.PreparedStatement"%>
<%@page import="atvJSP.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alterar Cadastro</title>
</head>
<body>

<%	
		
		int codigo = Integer.parseInt(request.getParameter("codigo"));
		String email = request.getParameter("login");
		String senha = request.getParameter("password");
		
		Conexao c = new Conexao();
		
		
		String sql = "UPDATE usuarios SET email = ?, senha = ? WHERE codigo = ?";
		
	
		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
		pstmt.setString(1, email);
		pstmt.setString(2, senha);
		pstmt.setInt(3, codigo);
		
		
		pstmt.execute();
	
		
		response.sendRedirect("paginaInicial.jsp");


		%>
	
 

</body>
</html>