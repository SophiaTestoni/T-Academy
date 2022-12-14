<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="atvJSP.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index Cadastro</title>
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
       </ul>
      <form class="d-flex" role="search" action="pesquisarPostagem.jsp">
        <input class="form-control me-2" name="pesquisar" type="search" placeholder="Search" aria-label="Search">
        <input type="submit" value="Pesquisar" class="btn btn-primary">
      </form>
    </div>
  </div>
</nav>

<div class="cadastroAlt"><h4>Altere seu e-mail ou sua senha:</h4></div>


<!-- ESTRUTURA DA ALTERAÇÃO DE CADASTRO -->

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
     
     if(estaLogado == false){
       response.sendRedirect("telaLogin.jsp");
     }
     else
     {
        

    Conexao c = new Conexao();
    
    String sql = "SELECT * FROM usuarios where codigo = ?";
    
    PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
    pstmt.setInt(1,Integer.parseInt(dados[2]));

    
    ResultSet rs = pstmt.executeQuery();
    rs.next();
    
  %>
<div class="wrapper fadeInDown">
  <div id="formContent">

    <form method="post" action="alterarCadastro.jsp">
      <input type="text"  minlength=5 maxlength=60 id="login" value="<% out.print(rs.getString(2)); %>" class="fadeIn second" name="login" placeholder="Login">
      <input type="text" minlength=5 maxlength=20 id="password" value="<% out.print(rs.getString(3)); %>" class="fadeIn third" name="password" placeholder="Digite sua senha">
      <input type="hidden" name="codigo" value="<% out.print(rs.getString(1)); %>">
	<input type="submit" value="Alterar" class="btn btn-success">

    </form>

  </div>
</div>    
 <%}%>
</body>