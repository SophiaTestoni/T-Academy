<%@page import="atvJSP.Usuario"%>
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

		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		
		// efetuar a conexão
		Conexao c = new Conexao();
		
		// SQL - Não concatena por segurança e performance, será passado o parâmetro conforme linha 32
		String sql = "INSERT INTO USUARIOS (email,senha,permissao) VALUES (?,?,?)";
				
		//PreparedStatement	-     vai fazer a conexao com o banco e o que ele precisa fazer
		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
				
		//Passar os parametros do SQL - aqui começa com 1 pq começa com 1 no banco de dados
		pstmt.setString(1, email);
		pstmt.setString(2, senha);
		pstmt.setInt(3,0);
		
		//Executar o comando SQL
		pstmt.execute();
		
		Usuario user = new Usuario();
	    user.setEmail(email);
	    user.setPermissao(0);
	    session.setAttribute("user", user.getDadosParaSessao());
	    response.sendRedirect("paginaInicial.jsp"); 
	 
		
%>


</body>
</html>