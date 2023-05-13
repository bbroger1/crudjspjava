<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.crudjspjava.dao.UsuarioDao, com.crudjspjava.bean.Usuario, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lista Usuários</title>
</head>
<body>
	
	<h1>Listagem de Usuários</h1>
	
	<%
		
		int pages = 0;
		int start = 0;
		int total = 5;
		int totalRecords = UsuarioDao.getTotalRecords();
		int quantidadePaginas = totalRecords / total;
		
		if(totalRecords % total > 0) {
			quantidadePaginas++;
		}
		
		String pageRequest = request.getParameter("page");
		
		if(pageRequest != null){
			pages = Integer.parseInt(pageRequest);
		} else {
			pages = 1;
		}
		
		if(pages <= 0 || pages > quantidadePaginas){
			start = 0;
		} else {
			start = pages - 1;
		}
		
		start = start * total;
		
		//List<Usuario> list = UsuarioDao.getAllUsuarios();
		List<Usuario> list = UsuarioDao.getRecords(start, total);
		request.setAttribute("list", list);
		request.setAttribute("quantidadePaginas", quantidadePaginas);
		
	%>
	<div>
		<a href="createForm.jsp">Novo Usuário</a>
	</div>
	<br>
	<div>
		<table border="1" >
			<tr>
				<th>ID</th>
				<th>Nome</th>
				<th>Password</th>
				<th>Email</th>
				<th>Pais</th>
				<th>Sexo</th>
				<th>Editar</th>
				<th>Excluir</th>
			</tr>
			
			<c:forEach items="${list}" var="usuario">
				<tr>
					<td>${usuario.getId()}</td>
					<td>${usuario.getNome()}</td>
					<td>${usuario.getPassword()}</td>
					<td>${usuario.getEmail()}</td>
					<td>${usuario.getPais()}</td>
					<td>${usuario.getSexo()}</td>
					<td><a href="editForm.jsp?id=${usuario.getId()}">Editar</a></td>
					<td><a href="deleteUsuario.jsp?id=${usuario.getId()}">Excluir</a></td>
				</tr>
			
			</c:forEach>
		</table>
		
		<br>
		
		<c:forEach var="i" begin="1" end="${quantidadePaginas}" step="1">
		   <a href="viewUsuarios.jsp?page=${i}">${i}</a>
		</c:forEach>
				
	</div>
		
</body>
</html>