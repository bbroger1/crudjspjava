<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.crudjspjava.bean.Usuario, com.crudjspjava.dao.UsuarioDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar Usuário</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		Usuario usuario = UsuarioDao.getUsario(Integer.parseInt(id));
	%>
	
	<h1>Editar o usuário <%= usuario.getNome() %></h1>
	
	<form action="editUsuario.jsp" method="post">
		<input type="hidden" name="id" value="<%= usuario.getId() %>" />
		<label>Nome: </label>
		<input type="text" name="nome" value="<%= usuario.getNome() %>" />
		<br>
		<label>Senha: </label>
		<input type="password" name="password" value="<%= usuario.getPassword() %>" />
		<br>
		<label>Email: </label>
		<input type="email" name="email" value="<%= usuario.getEmail() %>" />
		<br>
		<label>País: </label>
		<select name="pais">
			<option>Brasil</option>
			<option>Argentina</option>
			<option>Outro</option>
		</select>
		<br>
		<label>Sexo: </label>
		<input type="radio" name="sexo" value="masculino" />Masculino
		<input type="radio" name="sexo" value="feminino" />Feminino
		<br>
		<input type="submit" value="Editar Usuario">
	</form>
</body>
</html>