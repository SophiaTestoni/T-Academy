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
<script src="validation.js" charset="UTF-8"></script>
</head>
<body>

<nav class="navbar navbar-expand-lg fundoNavBar">
  <div class="container-fluid">
    <a class="navbar-brand" href="paginaInicial.jsp">Notícias</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="paginaInicial.jsp">Inicio</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="index.jsp">Gerência</a>
        </li>
       </ul>
      <form class="d-flex" role="search" action="pesquisarPostagem.jsp">
        <input class="form-control me-2" name="pesquisar" type="search" placeholder="Search" aria-label="Search">
        <input type="submit" value="Pesquisar" class="btn btn-primary">
      </form>
    </div>
  </div>
</nav>

<!-- ESTRUTURA DAS POSTAGENS -->

<form action="cadastrarPostagem.jsp" method="post" onsubmit="return validaPostagem()">
	<input type="text" placeholder="Título" name="titulo" id="titulo" class="form-control">
	<input type="text" placeholder="Subtitulo" name="subtitulo" id="subtitulo" class="form-control">
	<input type="text" placeholder="Notícia" name="conteudo" id="conteudo" class="form-control">
	<input type="submit" value="Cadastrar" class="btn btn-primary">
</form>

	<table class="table">
	<thead>
	<tr>
		<th>ID</th>
		<th>Título</th>
		<th>Subtítulo</th>
		<th>Conteúdo</th>
		<th>Alterar</th>
		<th>Remover</th>
	</tr>
	</thead>
<tbody>
	<%
 
    int permissao = 0;
    String session_u_name = (String)session.getAttribute("user");
    String[] dados = null;
    boolean estaLogado = false;
	   if(session_u_name != null)
	   {
        dados = session_u_name.split(",");
        permissao = Integer.parseInt(dados[1]);                  
		   estaLogado = true;
	   }
	   
	   if(permissao == 0){
		   response.sendRedirect("telaLogin.jsp");
	   }
	   else
	   {
		   	
		Conexao c = new Conexao();
		
		String sql = "SELECT * FROM postagens";
		
		Statement  stmt = c.efetuarConexao().createStatement();
		
		ResultSet rs = stmt.executeQuery(sql);

		while(rs.next()){
		
	%>
	
	<tr>
		<td><% out.print(rs.getInt(1)); %></td>
		<td><% out.print(rs.getString(2)); %></td>
		<td><% out.print(rs.getString(3)); %></td>
		<td><% out.print(rs.getString(4)); %></td>
		<td><a href="formAlterarPostagem.jsp?codigo=<% out.print(rs.getInt(1)); %>" class="btn btn-warning">Alterar</a></td>
		<td><a href="removerPostagem.jsp?codigo=<% out.print(rs.getInt(1)); %>" class="btn btn-danger">Remover</a></td>
	</tr>
	
	<% }} %>
	
		
</tbody>
</table>

</body>
</html>