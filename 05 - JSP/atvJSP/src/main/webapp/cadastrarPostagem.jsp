<%@page import="java.sql.PreparedStatement"%>
<%@page import="atvJSP.Conexao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro de postagem</title>
<script src="postagem.js"></script>
</head>
<body>

<%
		//Obter titulo e subtitulo
		String titulo = request.getParameter("titulo");
		String subtitulo = request.getParameter("subtitulo");
		
		//exibir dados
		out.print(titulo + "<br>" + subtitulo);  
		
		// efetuar a conexão
		Conexao c = new Conexao();
		
		// SQL - Não concatena por segurança e performance, será passado o parâmetro conforme linha 30
		String sql = "INSERT INTO postagens (titulo, subtitulo) VALUES (?,?)";
				
		//PreparedStatement	-     vai fazer a conexao com o banco e o que ele precisa fazer
		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
				
		//Passar os parametros do SQL - aqui começa com 1 pq começa com 1 no banco de dados
		pstmt.setString(1, titulo);
		pstmt.setString(2, subtitulo);
				
		//Executar o comando SQL
		pstmt.execute();
				
		//Redirecionamento - como se fosse um href
		response.sendRedirect("index.jsp");
				
%>

</body>
</html>