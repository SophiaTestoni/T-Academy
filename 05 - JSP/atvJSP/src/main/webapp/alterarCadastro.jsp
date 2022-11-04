<%@page import="java.sql.PreparedStatement"%>
<%@page import="atvJSP.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alterar Cadastro</title>
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
		String email = request.getParameter("login");
		String senha = request.getParameter("password");
		
		Conexao c = new Conexao();
		
		
		String sql = "UPDATE usuarios SET email = ?, senha = ? WHERE codigo = ?";
		
	
		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
		pstmt.setString(1, email);
		pstmt.setString(2, senha);
		pstmt.setInt(3, codigo);
		
		
		pstmt.execute();
	
		
		response.sendRedirect("paginaInicial.jsp");

	}
		%>
	
 

</body>
</html>