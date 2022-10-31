<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="atvJSP.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Noticias</title>
</head>
<body>
		<% 
		
		int codigo = Integer.parseInt(request.getParameter("id"));

		//Efetuar a conexao
		Conexao c = new Conexao();
		
		// Comando SQL
		String sql = "select * from postagens WHERE codigo = ?";
		
		//PreparedStatement
		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
		pstmt.setInt(1,codigo);
			
		ResultSet rs = pstmt.executeQuery();
		
		String titulo = "", subtitulo = "", conteudo = "";
		int id = 0; 
		boolean temResultado = rs.next();
		if(!temResultado){
			response.sendRedirect("index.jsp");
		}
			id = rs.getInt(1);
			titulo = rs.getString(2);
			subtitulo = rs.getString(3);
			conteudo = rs.getString(4);
		
		%>
		
	<div class="card">
	  <h2><% out.print(titulo);%></h2>
	  <h5><% out.print(subtitulo);%></h5>
	   <p><% out.print(conteudo);%> </p>
	</div>

<form action="cadastrarComentario.jsp?noticiaID=<% out.print(codigo);%>" method="post" onsubmit="return validaComentario()">
	<input type="text" placeholder="Nome" name="nome" id="nome" class="form-control">
	<input type="text" placeholder="Comentário" name="mensagem" id="mensagem" class="form-control">
	<input type="submit" value="Enviar comentário" class="btn btn-primary">
</form>


<!-- ESTRUTURA DOS COMENTÁRIOS -->

	
	<%
		
	sql = "SELECT nome, mensagem FROM comentarios where codigo_noticia = " + codigo;
		
	  	Statement stmt = c.efetuarConexao().createStatement();
		
		// Obter dados da tabela - comando específico do Java para dados do db como se fosse um ArrayList
		ResultSet result = stmt.executeQuery(sql);
		
		//Laço de repetição - rs.next vai fazer linha a linha até não ter mais
		// Abrindo as chaves e fechando após o TR para ele pegar a estrutura que montamos
		while(result.next()){
		
	%>
	<div class="card">
	  <h5><% out.print(result.getString(1));%></h5>
	   <p><% out.print(result.getString(2)); %> </p>
	</div>
	
	
	<% } %>

</body>
</html>