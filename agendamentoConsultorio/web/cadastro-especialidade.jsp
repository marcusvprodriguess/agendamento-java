<!DOCTYPE html>
<%@page import="com.sus.web.jdbc.EspecialidadeControllerServlet"%>
<%@page import="com.sus.web.jdbc.EspecialidadeDbUtil"%>
<%@page import="com.sus.web.jdbc.Especialidade"%>
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
		
		<form action="EspecialidadeControllerServlet" method="GET">
		
			<input type="hidden" name="command" value="ADD" />
			
			<table>
				<tbody>

					<tr>
						<td><label>Especialidade:</label></td>
						<td><input type="text" name="nomeEspecialidade" value="Especialidade" /></td>
					</tr>							
					
					<tr>					
						<td><label></label></td>
						<td><input type="submit" value="Salvar" class="save" /></td>
					</tr>
					
				</tbody>
			</table>
			
			<!--  
			<sql:setDataSource var = "dbAccess" driver = "com.mysql.jdbc.Driver"
         			url = "jdbc:mysql://localhost:3306/sus_agendamento"
         			user = "sus"  password = "sus"/>
      		<sql:query dataSource = "${dbAccess}" sql = "select * from especialidade" var = "result" />
					
									
			<select name="especialidade">
					
					<c:forEach var="temp" items="${result}">
						<option value="${temp}">oi</option>											
					</c:forEach>
					
			</select> -->
			
		</form>
		
		<div style="clear: both;"></div>
		
		<p>
			<a href="EspecialidadeControllerServlet">Voltar à Lista</a>
		</p>
	</div>
</body>

</html>











