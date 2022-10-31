<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="pacote.Conexao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gerenciar pessoas</title>
<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- CSS -->
	<link rel="stylesheet" href="pessoa.css">
<!-- JS -->
<script src="pessoa.js"></script>

</head>
<body>
	<!-- o GET exibe os valores informados na URL
	O POST oculta as informações na URL -->
<form action="cadastrarPessoa.jsp" method="post" onsubmit="return valida()">
	<input type="text" placeholder="Nome" name="nome" id="nome" class="form-control">
	<input type="number" placeholder="Idade" name="idade" id="idade" class="form-control">
	<input type="submit" value="Cadastrar" class="btn btn-primary">
	
</form>

	<table class="table">
	<thead>
	<tr>
		<th>#</th>
		<th>Nome</th>
		<th>Idade</th>
		<th>Remover</th>
	</tr>
	</thead>
	<tbody>
	
	<%
		//Conexão com o banco MySQL
		Conexao c = new Conexao();
		
		// Comando SQL - esse comando vai selecionar todas as informações cadastradas na tabela pessoas
		String sql = "SELECT * FROM pessoas";
		
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
		<td><% out.print(rs.getInt(3)); %></td>
		<!-- Preciso saber qual será removido, portanto necessário passar o codigo tbm -->
		<td><a href="removerPessoa.jsp?codigo=<% out.print(rs.getInt(1)); %>" class="btn btn-danger">Remover</a></td>
	</tr>
	
	<% } %>
	
	</tbody>
	</table>

</body>
</html>