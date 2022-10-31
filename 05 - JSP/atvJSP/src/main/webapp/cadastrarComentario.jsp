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
		//Obter titulo e subtitulo
		String nome = request.getParameter("nome");
		String mensagem = request.getParameter("mensagem");
		
		//exibir dados
		out.print(nome + "<br>" + mensagem);  
		
		// efetuar a conex�o
		Conexao c = new Conexao();
		
		// SQL - N�o concatena por seguran�a e performance, ser� passado o par�metro conforme linha 30
		String sql = "INSERT INTO comentarios (nome, mensagem) VALUES (?,?)";
				
		//PreparedStatement	-     vai fazer a conexao com o banco e o que ele precisa fazer
		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
				
		//Passar os parametros do SQL - aqui come�a com 1 pq come�a com 1 no banco de dados
		pstmt.setString(1, nome);
		pstmt.setString(2, mensagem);
				
		//Executar o comando SQL
		pstmt.execute();
				
		//Redirecionamento - como se fosse um href
		response.sendRedirect("index.jsp");
				
%>


</body>
</html>