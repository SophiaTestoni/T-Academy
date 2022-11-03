<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="telaLogin.css">
</head>
<body>
<div class="wrapper fadeInDown">
  <div id="formContent">

    <!-- Login Form -->
    <form method="post" action="login.jsp">
      <input type="text" id="login" class="fadeIn second" name="login" placeholder="Login">
      <input type="text" id="password" class="fadeIn third" name="password" placeholder="Digite sua senha">
      <input type="submit" class="fadeIn fourth" value="Entrar">
      <label>Não tem conta?</label> <a href="formCriarConta.jsp">Criar aqui</a>
    </form>

  </div>
</div>

</body>
</html>