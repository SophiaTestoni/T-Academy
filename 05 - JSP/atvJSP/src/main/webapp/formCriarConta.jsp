<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastre-se</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- CSS -->
<link rel="stylesheet" href="postagem.css">
</head>
<body>

<div class="cadastre"><h3>Cadastre-se</h3></div>

<form action="criarConta.jsp" method="post" onsubmit="return validaPostagem()">
	<input type="text" placeholder="E-mail" name="email" id="email" class="form-control">
	<input type="text" placeholder="Senha" name="senha" id="senha" class="form-control">
	<input type="submit" value="Cadastrar" class="btn btn-success">
</form>

</body>
</html>