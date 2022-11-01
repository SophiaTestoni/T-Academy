<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="atvJSP.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pesquisar Postagem</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- CSS -->
<link rel="stylesheet" href="postagem.css">
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
          <a class="nav-link active" aria-current="page" href="paginaInicial.jsp">Inicio</a>
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

<p>Resultado da sua pesquisa</p>

<%
		//Obter o codigo da pessoa
		String resultadoPesquisa = request.getParameter("pesquisar");

		//Efetuar a conexao
		Conexao c = new Conexao();

		// Comando SQL
		String sql = "SELECT * FROM postagens WHERE titulo LIKE ?";

		//PreparedStatement
		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
		pstmt.setString(1,"%" + resultadoPesquisa + "%");

		//Executar a remoção
		ResultSet result = pstmt.executeQuery();
		
		while(result.next()){
			String titulo = result.getString(2);
			String subtitulo = result.getString(3);
			String conteudo = result.getString(4);

%>

<form method="post" onsubmit="return validaPostagem()">
	<input type="text" placeholder="Título" value="<% out.print(titulo); %>" name="titulo" id="titulo" class="form-control">
	<input type="text" placeholder="Subtitulo" value="<% out.print(subtitulo); %>" name="subtitulo" id="subtitulo" class="form-control">
	<input type="text" placeholder="Conteudo" value="<% out.print(conteudo); %>" name="conteudo" id="conteudo" class="form-control">
</form>

<%} %>



	
	
</body>
</html>