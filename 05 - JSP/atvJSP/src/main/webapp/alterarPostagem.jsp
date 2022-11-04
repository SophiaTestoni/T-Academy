<%@page import="java.sql.PreparedStatement"%>
<%@page import="atvJSP.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alterar Postagem</title>
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
		String titulo = request.getParameter("titulo");
		String subtitulo = request.getParameter("subtitulo");
		String conteudo = request.getParameter("conteudo");
		
	
		Conexao c = new Conexao();
		
		
		String sql = "UPDATE postagens SET titulo = ?, subtitulo = ?, conteudo = ? WHERE codigo = ?";
		
	
		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
		pstmt.setString(1, titulo);
		pstmt.setString(2,subtitulo);
		pstmt.setString(3,conteudo);
		pstmt.setInt(4,codigo);
		
		pstmt.execute();
		
		
		response.sendRedirect("index.jsp");
}
	%>
 

</body>
</html>