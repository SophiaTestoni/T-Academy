<%@page import="java.sql.PreparedStatement"%>
<%@page import="pacote.Conexao"%>
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
		//obter nome e idade
		String nome = request.getParameter("nome");
		int idade = Integer.parseInt(request.getParameter("idade"));
		
		//exibir dados
		out.print(nome + "<br>" + idade);
		
		// efetuar a conexão
		Conexao c = new Conexao();
		
		// SQL - Não concatena por segurança e performance
		String sql = "INSERT INTO pessoas (nome, idade) VALUES (?,?)";
		
		//PreparedStatement	-     vai fazer a conexao com o banco e o que ele precisa fazer
		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
		
		//Passar os parametros do SQL - aqui começa com 1 pq começa com 1 no banco de dados
		pstmt.setString(1, nome);
		pstmt.setInt(2, idade);
		
		//Executar o comando SQL
		pstmt.execute();
		
		//Redirecionamento - como se fosse um href
		response.sendRedirect("pessoa.jsp");
	%>

</body>
</html>