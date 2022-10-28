<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Receber</title>
</head>
<body>

	<%
		//obter nome e idade
		String nome = request.getParameter("nome");
		int idade = Integer.parseInt(request.getParameter("idade"));
		
		//exibir nome e idade
		out.print("<h1>"+nome+"</h1>");
		out.print("<h1>"+idade+"</h1>");
	%>

</body>
</html>