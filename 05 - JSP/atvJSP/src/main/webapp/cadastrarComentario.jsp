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
   
   if(!estaLogado){
	   response.sendRedirect("telaLogin.jsp");
   }
   else
   {
	
	   	String email = dados[0];
		String mensagem = request.getParameter("mensagem");
		int noticiaID = Integer.parseInt(request.getParameter("noticiaID"));		
		//exibir dados
		out.print(email + "<br>" + mensagem);  
		
		// efetuar a conexão
		Conexao c = new Conexao();
		
		// SQL - Não concatena por segurança e performance, será passado o parâmetro conforme linha 30
		String sql = "INSERT INTO comentarios (nome, mensagem, codigo_noticia, ativo) VALUES (?,?,?,?)";
				
		//PreparedStatement	-     vai fazer a conexao com o banco e o que ele precisa fazer
		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
				
		//Passar os parametros do SQL - aqui começa com 1 pq começa com 1 no banco de dados
		pstmt.setString(1, email);
		pstmt.setString(2, mensagem);
		pstmt.setInt(3,noticiaID);
		pstmt.setInt(4,0);
					
		//Executar o comando SQL
		pstmt.execute();
				
		//Redirecionamento - como se fosse um href
		response.sendRedirect("noticias.jsp?id="+noticiaID);
   }
%>

</body>
</html>