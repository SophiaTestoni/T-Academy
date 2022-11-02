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

int codigo = Integer.parseInt(request.getParameter("codigo"));

// efetuar a conexão
Conexao c = new Conexao();

// SQL - Não concatena por segurança e performance, será passado o parâmetro conforme linha 32
String sql = "UPDATE usuarios SET ATIVO = 0 WHERE codigo = ?";
		
//PreparedStatement	-     vai fazer a conexao com o banco e o que ele precisa fazer
PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
		
//Passar os parametros do SQL - aqui começa com 1 pq começa com 1 no banco de dados
pstmt.setInt(1, codigo);

//Executar o comando SQL
pstmt.execute();
		
//Redirecionamento - como se fosse um href
response.sendRedirect("indexUsuario.jsp");

%>
</body>
</html>