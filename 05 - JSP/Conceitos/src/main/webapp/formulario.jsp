<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Formul�rio</title>
</head>
<body>

	<!-- enviar de uma p�gina para outra --> 
		<form action="receber.jsp">
			<input type="text" placeholder="Nome" name="nome">
			<input type="number" placeholder="Idade" name="idade">
			<input type="submit" value="Enviar">
		
		</form>

</body>
</html>