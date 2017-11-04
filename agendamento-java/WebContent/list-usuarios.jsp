<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
	<title>Agendamento de Consultas SUS</title>
	
	<link type="text/css" rel="stylesheet" href="css/style.css">
</head>

<body>

	<div id="wrapper">
		<div id="header">
			<h2>Lista de Usuários Cadastrados</h2>
		</div>
	</div>

	<div id="container">
	
		<div id="content">
		
			<!-- put new button: Add Usuario -->
			
			<input type="button" value="Cadastrar Usuario" 
				   onclick="window.location.href='cadastro-usuario.jsp'; return false;"
				   class="add-student-button"
			/>
			
			<table>			
			
				<tr>
					<th>Código</th>
					<th>Nome</th>
					<th>Login</th>
					<th>Senha</th>
					<th>Descrição</th>													
					<th>Ação</th>
				</tr>
				
				<c:forEach var="tempUsuario" items="${USUARIO_LIST}">
					
					<!-- set up a link for each student -->
					<c:url var="tempLink" value="UsuarioControllerServlet">
						<c:param name="command" value="LOAD" />
						<c:param name="usuarioId" value="${tempUsuario.codUsuario}" />
					</c:url>

					<!--  set up a link to delete a student -->
					<c:url var="deleteLink" value="UsuarioControllerServlet">
						<c:param name="command" value="DELETE" />
						<c:param name="usuarioId" value="${tempUsuario.codUsuario}" />
					</c:url>
									
									<!-- 
			(int codUsuario, String nomeUsuario, int rgUsuario, int cpfUsuario, 
			String enderecoUsuario, String cidadeUsuario, String bairroUsuario, String estadoUsuario,
			String emailUsuario, String telefoneUsuario, String  datanascUsuario) -->
																		
					<tr>
						<td> ${tempUsuario.codUsuario} </td>
						<td> ${tempUsuario.nomeUsuario} </td>
						<td> ${tempUsuario.loginUsuario} </td>
						<td> ${tempUsuario.senhaUsuario} </td>
						<td> ${tempUsuario.dsUsuario} </td>				
						
						
						<td> 
							<a href="${tempLink}">Atualizar</a> 
							 | 
							<a href="${deleteLink}"
							onclick="if (!(confirm('Tem certeza que deseja excluir registro?'))) return false">
							Apagar</a>	
						</td>
					</tr>
				
				</c:forEach>
				
			</table>
		
		</div>
	
	</div>
</body>


</html>








