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
<nav class="navbar navbar-expand-lg fundoNavBar">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Notícias</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="paginaInicial.jsp">Inicio</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="index.jsp">Gerência</a>
        </li>
       </ul>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>

<form action="cadastrarPostagem.jsp" method="post" onsubmit="return validaPostagem()">
	<input type="text" placeholder="Título" name="titulo" id="titulo" class="form-control">
	<input type="text" placeholder="Subtitulo" name="subtitulo" id="subtitulo" class="form-control">
	<input type="submit" value="Cadastrar" class="btn btn-primary">
</form>


	<!-- ESTRUTURA DAS POSTAGENS -->
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
		
		String sql = "SELECT * FROM postagens";
		
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
		<td><a href="formAlterarPostagem.jsp?codigo=<% out.print(rs.getInt(1)); %>" class="btn btn-warning">Alterar</a></td>
		<td><a href="removerPostagem.jsp?codigo=<% out.print(rs.getInt(1)); %>" class="btn btn-danger">Remover</a></td>
	</tr>
	
	<% } %>
	
	<!-- ESTRUTURA DOS COMENTÁRIOS -->
	<thead>
	<tr>
		<th>#</th>
		<th>Nome</th>
		<th>Comentário</th>
	</tr>
	</thead>
	
	<%
		
		sql = "SELECT * FROM comentarios";
		
	  	stmt = c.efetuarConexao().createStatement();
		
		// Obter dados da tabela - comando específico do Java para dados do db como se fosse um ArrayList
		rs = stmt.executeQuery(sql);
		
		//Laço de repetição - rs.next vai fazer linha a linha até não ter mais
		// Abrindo as chaves e fechando após o TR para ele pegar a estrutura que montamos
		while(rs.next()){
		
	%>
		<!-- Lembrando que começa na posição 1 e não na 0 devido a estrutura do db -->
	<tr>
		<td><% out.print(rs.getInt(1)); %></td>
		<td><% out.print(rs.getString(2)); %></td>
		<td><% out.print(rs.getString(3)); %></td>
	</tr>
	
	<% } %>
	
	
</tbody>
</table>

</body>
</html>