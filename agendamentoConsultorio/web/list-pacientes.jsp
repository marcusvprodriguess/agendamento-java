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
		
			<!-- put new button: Add Paciente -->
			
			<input type="button" value="Cadastrar Paciente" 
				   onclick="window.location.href='cadastro-paciente.jsp'; return false;"
				   class="add-student-button"
			/>
			
			<table>
			
			<!-- 
			(int codPaciente, String nomePaciente, int rgPaciente, int cpfPaciente, 
			String enderecoPaciente, String cidadePaciente, String bairroPaciente, String estadoPaciente,
			String emailPaciente, String telefonePaciente, String  datanascPaciente) -->
			
				<tr>
					<th>Código</th>
					<th>Nome</th>
					<th>RG</th>
					<th>CPF</th>
					<th>Endereço</th>
					<th>Cidade</th>
					<th>Bairro</th>
					<th>Estado</th>
					<th>E-Mail</th>
					<th>Telefone</th>
					<th>Nascimento</th>														
					<th>Ação</th>
				</tr>
				
				<c:forEach var="tempPaciente" items="${PACIENTE_LIST}">
					
					<!-- set up a link for each student -->
					<c:url var="tempLink" value="PacienteControllerServlet">
						<c:param name="command" value="LOAD" />
						<c:param name="pacienteId" value="${tempPaciente.codPaciente}" />
					</c:url>

					<!--  set up a link to delete a student -->
					<c:url var="deleteLink" value="PacienteControllerServlet">
						<c:param name="command" value="DELETE" />
						<c:param name="pacienteId" value="${tempPaciente.codPaciente}" />
					</c:url>
									
									<!-- 
			(int codPaciente, String nomePaciente, int rgPaciente, int cpfPaciente, 
			String enderecoPaciente, String cidadePaciente, String bairroPaciente, String estadoPaciente,
			String emailPaciente, String telefonePaciente, String  datanascPaciente) -->
																		
					<tr>
						<td> ${tempPaciente.codPaciente} </td>
						<td> ${tempPaciente.nomePaciente} </td>
						<td> ${tempPaciente.rgPaciente} </td>
						<td> ${tempPaciente.cpfPaciente} </td>
						<td> ${tempPaciente.enderecoPaciente} </td>
						<td> ${tempPaciente.cidadePaciente} </td>
						<td> ${tempPaciente.bairroPaciente} </td>
						<td> ${tempPaciente.estadoPaciente} </td>
						<td> ${tempPaciente.emailPaciente} </td>
						<td> ${tempPaciente.telefonePaciente} </td>
						<td> ${tempPaciente.datanascPaciente} </td>
						
						
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








