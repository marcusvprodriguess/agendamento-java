<!DOCTYPE html>
<%@page import="com.sus.web.jdbc.EspecialidadeControllerServlet"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

	
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
		<h3>Cadastro de Especialidade</h3>
		
		<form action="EspecialidadeControllerServlet" method="POST">
		
			<input type="hidden" name="command" value="ADD" />
			
			<table>
				<tbody>

					<tr>
						<td><label>Especialidade:</label></td>
						<td><input type="text" name="nomeEspecialidade" placeholder="Especialidade" maxlength="30" /></td>
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











