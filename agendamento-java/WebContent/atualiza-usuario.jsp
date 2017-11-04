<!DOCTYPE html>
<html>

<head>
	<title>Agendamento de Consultas SUS</title>

	<link type="text/css" rel="stylesheet" href="css/style.css">
	<link type="text/css" rel="stylesheet" href="css/add-student-style.css">	
</head>

<body>
	<div id="wrapper">
		<div id="header">
			<h2>Agendamento de Consultas SUS</h2>
		</div>
	</div>
	
	<div id="container">
		<h3>Atualizar Usuario</h3>
		
		<form action="UsuarioControllerServlet" method="GET">
		
			<input type="hidden" name="command" value="UPDATE" />

			<input type="hidden" name="usuarioId" value="${USUARIO.codUsuario}" />
			
			<table>
				<tbody>

					<tr>
						<td><label>Nome:</label></td>
						<td><input type="text" name="nomeUsuario" maxlength="20" 
								   value="${USUARIO.nomeUsuario}" /></td>
					</tr>				
					
						<tr>
						<td><label>Login:</label></td>
						<td><input type="text" name="loginUsuario" maxlength="10"
								   value="${USUARIO.loginUsuario}" /></td>
					</tr>	
					
						<tr>
						<td><label>Senha:</label></td>
						<td><input type="password" name="senhaUsuario" maxlength="10"
								   value="${USUARIO.senhaUsuario}" /></td>
					</tr>	
					
						<tr>
						<td><label>Descrição:</label></td>
						<td><select name="dsUsuario" >
							<option>Comum</option>
							<option>Admin</option>												
							</select>
							

					</tr>	
					
						
						
						
					
					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Salvar" class="save" /></td>
					</tr>
					
				</tbody>
			</table>
		</form>
		
		<div style="clear: both;"></div>
		
		<p>
			<a href="UsuarioControllerServlet">Voltar à Lista</a>
		</p>
	</div>
</body>

</html>











