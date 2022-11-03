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
		
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		

		Conexao c = new Conexao();
		
		
		String sql = "UPDATE usuarios SET email = ?, senha = ? WHERE email = ?";
		
	
		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
		pstmt.setString(1, email);
		pstmt.setString(2, senha);
		pstmt.setString(3, email);
		
		
		//Executar a alteração
		pstmt.execute();
	
		
		response.sendRedirect("indexCadastro.jsp");
	%>
 

</body>
</html>