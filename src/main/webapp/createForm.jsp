<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Criar Usuário</title>
</head>
<body>

	<h1>Cadastrar usuário</h1>
	
	<form action="createUsuario.jsp" method="post">
		<input type="hidden" name="id" />
		<label>Nome: </label>
		<input type="text" name="nome" />
		<br>
		<label>Senha: </label>
		<input type="password" name="password" />
		<br>
		<label>Email: </label>
		<input type="email" name="email" />
		<br>
		<label>País: </label>
		<select name="pais">
			<option value="Brasil">Brasil</option>
			<option value="Argentina">Argentina</option>
			<option value="Outro">Outro</option>
		</select>
		<br>
		<label>Sexo: </label>
		<input type="radio" name="sexo" value="masculino" />Masculino
		<input type="radio" name="sexo" value="feminino" />Feminino
		<br>
		<input type="submit" value="Criar Usuario">
	</form>
</body>
</html>