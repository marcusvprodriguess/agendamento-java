<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<h3>Cadastro de Paciente</h3>
		
		<form action="PacienteControllerServlet" method="GET">
		
			<input type="hidden" name="command" value="ADD" />
			
			<table>
			<!--  cd_Paciente INT,
		    sg_Estado CHAR(2),
		    nm_Paciente VARCHAR(50),
		    cd_CPF INT(11),
		    cd_RG INT(11),
		    ds_Endereco VARCHAR(50),
		    nm_Cidade VARCHAR(20),
		    nm_Bairro VARCHAR(20),
		    cd_Telefone VARCHAR(20),
		    ds_Email VARCHAR(50),
		    dt_Nascimento DATE, -->
				<tbody>
					<tr>
						<td><label>Nome:</label></td>
						<td><input type="text" name="nomePaciente" placeholder="John Doe" maxlength="50"/></td>
					</tr>

					<tr>
						<td><label>RG:</label></td>
						<td><input type="number" name="rgPaciente" placeholder="12345678900" maxlength="11"/></td>
					</tr>
					
					<tr>
						<td><label>CPF:</label></td>
						<td><input type="number" name="cpfPaciente" placeholder="00987654321" maxlength="11"/></td>
					</tr>
					<tr>
						<td><label>Endereço:</label></td>
						<td><input type="text" name="enderecoPaciente" placeholder="Rua Xyz, 000" maxlength="50"/></td>
					</tr>
					
					<tr>
						<td><label>Cidade:</label></td>
						<td>
						<select name="cidadePaciente">
    						<c:forEach items="${CIDADES_FORM}" var="tempCid">
        						<option value="${tempCid.codCidade}"><c:out value="${tempCid.nomeCidade}" /></option>
    						</c:forEach>
						</select>
						</td>
						<!-- <td><input type="text" name="cidadePaciente" placeholder="Minha Cidade" maxlength="20" /></td> -->
					</tr>
					
					<tr>
						<td><label>Bairro:</label></td>
						<td><input type="text" name="bairroPaciente" placeholder="Meu Bairro" maxlength="20" /></td>
					</tr>
					<tr>
						<td><label>Estado:</label></td>
						<td><input type="text" name="estadoPaciente" placeholder="XX" maxlength="2"/></td>
					</tr>
					<tr>
						<td><label>Telefone:</label></td>
						<td><input type="tel" name="telefonePaciente" placeholder="2345678" maxlength="20"/></td>
					</tr>
					<tr>
						<td><label>E-Mail:</label></td>
						<td><input type="email" name="emailPaciente" placeholder="email@email.com" maxlength="50" /></td>
					</tr>
					
					<tr>
						<td><label>Nascimento:</label></td>
						<td><input type="date" name="datanascPaciente" placeholder="00/00/0000" /></td>
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











