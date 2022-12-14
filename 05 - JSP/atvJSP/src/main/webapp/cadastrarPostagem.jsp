<%@page import="java.sql.PreparedStatement"%>
<%@page import="atvJSP.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de postagem</title>
<script src="postagem.js"></script>
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
		
		String titulo = request.getParameter("titulo");
		String subtitulo = request.getParameter("subtitulo");
		String conteudo = request.getParameter("conteudo");
		
		//exibir dados
		out.print(titulo + "<br>" + subtitulo + "<br>" + conteudo);  
		
		// efetuar a conexão
		Conexao c = new Conexao();
		
		// SQL - Não concatena por segurança e performance, será passado o parâmetro conforme linha 32
		String sql = "INSERT INTO postagens (titulo, subtitulo, conteudo) VALUES (?,?,?)";
				
		//PreparedStatement	-     vai fazer a conexao com o banco e o que ele precisa fazer
		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
				
		//Passar os parametros do SQL - aqui começa com 1 pq começa com 1 no banco de dados
		pstmt.setString(1, titulo);
		pstmt.setString(2, subtitulo);
		pstmt.setString(3, conteudo);
				
		//Executar o comando SQL
		pstmt.execute();
				
		//Redirecionamento - como se fosse um href
		response.sendRedirect("index.jsp");
}
				
%>

</body>
</html>