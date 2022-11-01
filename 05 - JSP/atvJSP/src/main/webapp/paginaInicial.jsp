<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="atvJSP.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Página Inicial</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- CSS -->
<link rel="stylesheet" href="postagem.css">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
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
      <form class="d-flex" role="search">
        <input class="form-control me-2" id="searchbar" onkeyup="busca_produtos('')" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>

<div class="container">
      <h3>Notícias de hoje</h3>
        <div class="row" id="listarPostagens"></div>
    </div>
    <div class="row">
    
    <%
    Conexao c = new Conexao();
	
	String sql = "SELECT * FROM postagens ORDER BY codigo DESC LIMIT 10";
	
	PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
	
	ResultSet rs = pstmt.executeQuery();
	
	String titulo = "", subtitulo = "", conteudo = "";
	int id = 0; 
	while(rs.next()){
		id = rs.getInt(1);
		titulo = rs.getString(2);
		subtitulo = rs.getString(3);
		conteudo = rs.getString(4);
	%>
	
	<div class="card">
	  <h2><a href="noticias.jsp?id=<%out.print(id);%>"><% out.print(titulo);%></a></h2>
	  <h5><% out.print(subtitulo);%></h5>
	  <!-- trocar substring pro numero de caracteres que desejamos mostrar no preview da noticia -->
	   <p><% out.print(conteudo.substring(0,15)); %> <a href="noticias.jsp?id=<%out.print(id);%>">ver mais...</a> </p>
	</div>
	
	
	<% }%>
	

    
    </div>
     
   
</body>
</html>