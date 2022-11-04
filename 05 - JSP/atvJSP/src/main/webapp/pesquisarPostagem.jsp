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
          <a class="nav-link" aria-current="page" href="paginaInicial.jsp">Inicio</a>
        </li>
       </ul>
      <form class="d-flex" role="search" action="pesquisarPostagem.jsp">
        <input class="form-control me-2" name="pesquisar" type="search" placeholder="Search" aria-label="Search">
        <input type="submit" value="Pesquisar" class="btn btn-primary">
      </form>
    </div>
  </div>
</nav>

<div class="pesquisa"><h4>Resultado da sua pesquisa:</h4></div>

<%

		String resultadoPesquisa = request.getParameter("pesquisar");

	
		Conexao c = new Conexao();

	
		String sql = "SELECT * FROM postagens WHERE titulo LIKE ?";


		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
		pstmt.setString(1,"%" + resultadoPesquisa + "%");

		ResultSet result = pstmt.executeQuery();
		
		while(result.next()){
			String titulo = result.getString(2);
			String subtitulo = result.getString(3);
			String conteudo = result.getString(4);

%>

	<div class="card card2">
	  <h2 class="tit"><% out.print(titulo);%></h2>
	  <h5 class="sub"><% out.print(subtitulo);%></h5>
	   <p class="cont"><% out.print(conteudo);%> </p>
	</div>

<%} %>


</body>
</html>