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
		<h3>Atualizar Especialidade</h3>
		
		<form action="EspecialidadeControllerServlet" method="GET">
		
			<input type="hidden" name="command" value="UPDATE" />

			<input type="hidden" name="especialidadeId" value="${ESPECIALIDADE.codEspecialidade}" />
			
			<table>
				<tbody>
				
					<tr>
						<td><label>Nome:</label></td>
						<td><input type="text" name="nomeEspecialidade" 
								   value="${ESPECIALIDADE.nomeEspecialidade}" /></td>
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
			<a href="EspecialidadeControllerServlet">Voltar à Lista</a>
		</p>
	</div>
</body>

</html>











