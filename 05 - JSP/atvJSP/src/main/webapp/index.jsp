<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="atvJSP.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- CSS -->
<link rel="stylesheet" href="postagem.css">
<!-- JS -->
<script src="postagem.js" charset="UTF-8"></script>
</head>
<body>

<form action="cadastrarPostagem.jsp" method="post" onsubmit="return valida()">
	<input type="text" placeholder="Título" name="titulo" id="titulo" class="form-control">
	<input type="text" placeholder="Subtitulo" name="subtitulo" id="subtitulo" class="form-control">
	<input type="submit" value="Cadastrar" class="btn btn-primary">
</form>

	<table class="table">
	<thead>
	<tr>
		<th>#</th>
		<th>Título</th>
		<th>Subtitulo</th>
		<th>Alterar</th>
		<th>Remover</th>
	</tr>
	</thead>
<tbody>
	<%
		//Conexão com o banco MySQL
		Conexao c = new Conexao();
		
		// Comando SQL - esse comando vai selecionar todas as informações cadastradas na tabela pessoas
		String sql = "SELECT * FROM postagens";
		
		//Statement - não tem parametros para passar, usar o Statement
		// Quando tem parâmetros usar o PreparedStatement
		Statement  stmt = c.efetuarConexao().createStatement();
		
		// Obter dados da tabela pessoas - comando específico do Java para dados do db como se fosse um ArrayList
		ResultSet rs = stmt.executeQuery(sql);
		
		//Laço de repetição - rs.next vai fazer linha a linha até não ter mais
		// Abrindo as chaves e fechando após o TR para ele pegar a estrutura que montamos
		while(rs.next()){
		
	%>
		<!-- Lembrando que começa na posição 1 e não na 0 devido a estrutura do db -->
	<tr>
		<td><% out.print(rs.getInt(1)); %></td>
		<td><% out.print(rs.getString(2)); %></td>
		<td><% out.print(rs.getString(3)); %></td>
		<td><a href="alterarPostagem.jsp?codigo=<% out.print(rs.getInt(1)); %>" class="btn btn-warning">Alterar</a></td>
		<td><a href="removerPostagem.jsp?codigo=<% out.print(rs.getInt(1)); %>" class="btn btn-danger">Remover</a></td>
	</tr>
	
	<% } %>

</tbody>
</table>
	
	
</body>
</html>