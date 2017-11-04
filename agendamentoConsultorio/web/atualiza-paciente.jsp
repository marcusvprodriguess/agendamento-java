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
		<h3>Atualizar Paciente</h3>
		
		<form action="PacienteControllerServlet" method="GET">
		
			<input type="hidden" name="command" value="UPDATE" />

			<input type="hidden" name="pacienteId" value="${PACIENTE.codPaciente}" />
			
			<table>
				<tbody>

					<tr>
						<td><label>Nome:</label></td>
						<td><input type="text" name="nomePaciente" maxlength="50" 
								   value="${PACIENTE.nomePaciente}" /></td>
					</tr>				
					
						<tr>
						<td><label>RG:</label></td>
						<td><input type="text" name="rgPaciente" maxlength="11"
								   value="${PACIENTE.rgPaciente}" /></td>
					</tr>	
					
						<tr>
						<td><label>CPF:</label></td>
						<td><input type="text" name="cpfPaciente" maxlength="11"
								   value="${PACIENTE.cpfPaciente}" /></td>
					</tr>	
					
						<tr>
						<td><label>Endereço:</label></td>
						<td><input type="text" name="enderecoPaciente" maxlength="50"
								   value="${PACIENTE.enderecoPaciente}" /></td>
					</tr>	
					
						<tr>
						<td><label>Cidade:</label></td>
						<td><input type="text" name="cidadePaciente" maxlength="20"
								   value="${PACIENTE.cidadePaciente}" /></td>
					</tr>	
					
						<tr>
						<td><label>Bairro:</label></td>
						<td><input type="text" name="bairroPaciente" maxlength="20"
								   value="${PACIENTE.bairroPaciente}" /></td>
					</tr>	
					
						<tr>
						<td><label>Estado:</label></td>
						<td><input type="text" name="estadoPaciente" maxlength="2"
								   value="${PACIENTE.estadoPaciente}" /></td>
					</tr>	
					
					<tr>
						<td><label>Telefone:</label></td>
						<td><input type="text" name="telefonePaciente" maxlength="20"
								   value="${PACIENTE.telefonePaciente}" /></td>
					</tr>
					
					<tr>
						<td><label>E-mail:</label></td>
						<td><input type="text" name="emailPaciente" maxlength="50"
								   value="${PACIENTE.emailPaciente}" /></td>
					</tr>
					
					<tr>
						<td><label>Nascimento:</label></td>
						<td><input type="text" name="datanascPaciente" 
								   value="${PACIENTE.datanascPaciente}" /></td>
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
			<a href="PacienteControllerServlet">Voltar à Lista</a>
		</p>
	</div>
</body>

</html>











