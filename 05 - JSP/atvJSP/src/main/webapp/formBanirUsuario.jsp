<%@page import="java.sql.PreparedStatement"%>
<%@page import="atvJSP.Conexao"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

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
	response.sendError(401, "Você precisa ser um administrador para realizar esta ação.");
}
	else{

		int codigo = Integer.parseInt(request.getParameter("codigo"));


		Conexao c = new Conexao();

		String sql = "UPDATE usuarios SET ATIVO = 0 WHERE codigo = ?";
		

		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
		
		pstmt.setInt(1, codigo);


		pstmt.execute();
		

		response.sendRedirect("indexUsuario.jsp");

%>

<% } %>
</body>
</html>