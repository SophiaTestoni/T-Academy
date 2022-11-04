<%@page import="java.sql.PreparedStatement"%>
<%@page import="atvJSP.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	else
	{
		int codigo = Integer.parseInt(request.getParameter("codigo"));
		
		String deleteC = "DELETE FROM comentarios WHERE codigo_noticia = ?";
		
		
		Conexao c = new Conexao();
		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(deleteC);
		pstmt.setInt(1,codigo);
		
		pstmt.execute();


		String sql = "DELETE FROM postagens WHERE codigo = ?";
			
		
		PreparedStatement pstmtP = c.efetuarConexao().prepareStatement(sql);
		pstmtP.setInt(1,codigo);
				
		
		pstmtP.execute();
				
		
		response.sendRedirect("index.jsp");
	}

	%>


</body>
</html>