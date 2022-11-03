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
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- JS -->
<script src="validation.js" charset="UTF-8"></script>
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
		
	<div class="card card2">
	  <h2 class="tit"><% out.print(titulo);%></h2>
	  <h5 class="sub"><% out.print(subtitulo);%></h5>
	   <p class="cont"><% out.print(conteudo);%> </p>
	</div>
	
<!-- ESTRUTURA DOS COMENTÁRIOS -->

<form action="cadastrarComentario.jsp?noticiaID=<% out.print(codigo);%>" method="post" onsubmit="return validaComentario()">
	<input type="text" placeholder="Comentário" name="mensagem" id="mensagem" class="form-control">
	<input type="submit" value="Enviar comentário" class="btn btn-primary">
</form>

	<%
		
	sql = "SELECT nome, mensagem FROM comentarios where ativo = 1 and codigo_noticia = " + codigo;
		
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