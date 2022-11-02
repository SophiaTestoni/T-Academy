<%@page import="atvJSP.Usuario"%>
<%@page import="java.sql.ResultSet"%>
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

String login  = request.getParameter("login");
String password = request.getParameter("password");

//Efetuar a conexao
Conexao c = new Conexao();

// Comando SQL
String sql = "SELECT permissao FROM usuarios WHERE email = ? and senha = ? and ativo = 1";

//PreparedStatement
PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
pstmt.setString(1,login);
pstmt.setString(2,password);

//Executar a remoção
ResultSet result = pstmt.executeQuery();

boolean loginFuncionou = result.next();
 if(!loginFuncionou)
 {
	 response.sendRedirect("telaLogin.jsp"); 
 }
 else
 {
	Usuario user = new Usuario();
    user.setEmail(login);
    user.setPermissao(result.getInt(1));
    session.setAttribute("user", user.getDadosParaSessao());
    response.sendRedirect("paginaInicial.jsp"); 
 }
 
 %>



</body>
</html>