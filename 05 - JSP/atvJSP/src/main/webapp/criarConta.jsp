<%@page import="atvJSP.Usuario"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="atvJSP.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- CSS -->
<link rel="stylesheet" href="postagem.css">
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