<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Formulário</title>
</head>
<body>

	<!-- enviar de uma página para outra --> 
		<form action="receber.jsp">
			<input type="text" placeholder="Nome" name="nome">
			<input type="number" placeholder="Idade" name="idade">
			<input type="submit" value="Enviar">
		
		</form>

</body>
</html>