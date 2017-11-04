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
			<h2>Agendamento de Consultas SUS</h2>
		</div>
	</div>

	<div id="container">
	
		<div id="content">
		
			<!-- put new button: Add Student -->
			
			<input type="button" value="Cadastrar Especialidade" 
				   onclick="window.location.href='cadastro-especialidade.jsp'; return false;"
				   class="add-student-button"
			/>
			
			<table>
			
				<tr>
					<th>Código</th>
					<th>Nome</th>
					<th>Ação</th>
				</tr>
				
				<c:forEach var="tempEspecialidade" items="${ESPECIALIDADE_LIST}">
					
					<!-- set up a link for each student -->
					<c:url var="tempLink" value="EspecialidadeControllerServlet">
						<c:param name="command" value="LOAD" />
						<c:param name="especialidadeId" value="${tempEspecialidade.codEspecialidade}" />
					</c:url>

					<!--  set up a link to delete a student -->
					<c:url var="deleteLink" value="EspecialidadeControllerServlet">
						<c:param name="command" value="DELETE" />
						<c:param name="especialidadeId" value="${tempEspecialidade.codEspecialidade}" />
					</c:url>
																		
					<tr>
						<td> ${tempEspecialidade.codEspecialidade} </td>
						<td> ${tempEspecialidade.nomeEspecialidade} </td>
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








