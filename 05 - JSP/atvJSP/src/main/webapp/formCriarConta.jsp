<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="criarConta.jsp" method="post" onsubmit="return validaPostagem()">
	<input type="text" placeholder="E-mail" name="email" id="email" class="form-control">
	<input type="text" placeholder="Senha" name="senha" id="senha" class="form-control">
	<input type="submit" value="Cadastrar" class="btn btn-primary">
</form>

</body>
</html>