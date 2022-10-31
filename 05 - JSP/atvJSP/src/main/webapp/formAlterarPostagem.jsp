<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mysql.cj.xdevapi.PreparableStatement"%>
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

<% 
	int codigo = Integer.parseInt(request.getParameter("codigo"));
	
	Conexao c = new Conexao();
	
	String sql = "SELECT * FROM postagens WHERE codigo = ?";
	
	PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
	
	pstmt.setInt(1, codigo);
	
	ResultSet rs = pstmt.executeQuery();
	
	String titulo = "", subtitulo = "";
	
	while(rs.next()){
		titulo = rs.getString(2);
		subtitulo = rs.getString(3);
	}
	
	
%>

<form action="alterarPostagem.jsp" method="post" onsubmit="return validaPostagem()">
	<input type="text" placeholder="Título" value="<% out.print(titulo); %>" name="titulo" id="titulo" class="form-control">
	<input type="text" placeholder="Subtitulo" value="<% out.print(subtitulo); %>" name="subtitulo" id="subtitulo" class="form-control">
	<input type="hidden" name="codigo" value="<% out.print(codigo); %>">
	<input type="submit" value="Alterar" class="btn btn-primary">
</form>


</body>
</html>;