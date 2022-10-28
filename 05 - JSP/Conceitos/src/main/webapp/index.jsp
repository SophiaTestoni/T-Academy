<%@page import="pacote.Aluno"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Aprendendo JSP</title>
</head>
<body>

	<h1>Hello World!</h1>
	
	<%
		String nome = "Brena";
		out.print("<p>O nome é: "+nome+" </p>");
		out.print("<p> Exibindo dados via out.print </p>");	
	
	%>
	
	<hr>
	
	<table border="1">
		<thead>
			<tr>
			 <th>Número</th>
			</tr>
		</thead>
		
		<tbody> 
		<%
			// Laço de repetição
			for(int i=0; i<10; i++){
				
		%>
		<tr>
			<td><% out.print(i); %></td>
		</tr>
			
			<%
				}
			%>
			
		</tbody>
	</table>
	<hr>
	<%
		//Instanciar objeto da classe aluno
		Aluno a = new Aluno("Jobson", 8,10);
		//Retornar o nome e a média
		out.print("<h1>"+a.retorno()+"</h1");
	%>
	
	
	
	

</body>
</html>