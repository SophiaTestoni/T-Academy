<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="atvJSP.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gerência Comentários</title>
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


	<table class="table">
	<thead>
	<tr>
		<th>Nome</th>
		<th>Mensagem</th>
		<th>Ativo</th>
		<th>Aprovar</th>
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
		
		String sql = "SELECT codigo_comentario, nome, mensagem, ativo FROM comentarios";
		
		Statement  stmt = c.efetuarConexao().createStatement();
		
		ResultSet rs = stmt.executeQuery(sql);

		while(rs.next()){
		int ativo = rs.getInt(4);
		String mensagem = "";
		if(ativo == 0){
			mensagem = "Esperando Aprovação";
		}
		else{
			mensagem = "Aprovado";
		}
	%>
	
	<tr>
		<td><% out.print(rs.getString(2)); %></td>
		<td><% out.print(rs.getString(3)); %></td>
		<td><% out.print(mensagem); %></td>
		<td><a href="formAprovarComentario.jsp?codigo=<% out.print(rs.getInt(1)); %>" class="btn btn-warning">Aprovar</a></td>
		<td><a href="formExcluirComentario.jsp?codigo=<% out.print(rs.getInt(1)); %>" class="btn btn-danger">Excluir</a></td>
	</tr>
	
	<% }} %>
	
		
</tbody>
</table>

</body>
</html>