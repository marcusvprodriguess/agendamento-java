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
		<h3>Cadastro de Medico</h3>
		
		<form action="MedicoControllerServlet" method="GET">
		
			<input type="hidden" name="command" value="ADD" />
			
			<table>
			<!-- 	nm_Medico VARCHAR(50),
	crm_Medico INT,   
    cd_Especialidade INT,
	cd_RG INT(11),
    cd_CPF INT(11),     
	ds_Endereco VARCHAR (50),
    nm_Cidade VARCHAR(20),
    nm_Bairro VARCHAR(20),
	sg_Estado CHAR(2),
	cd_Telefone VARCHAR(20),
    ds_Email VARCHAR(50),
    dt_Nascimento DATE,-->
				<tbody>
					<tr>
						<td><label>Nome:</label></td>
						<td><input type="text" name="nomeMedico" placeholder="Jane Doe" maxlength="50" /></td>
					</tr>
					
					<tr>
						<td><label>CRM:</label></td>
						<td><input type="number" name="crmMedico" placeholder="98128734" maxlength="20"/></td>
					</tr>
					
					<tr>
						<td><label>Especialidade:</label></td>
						<td>
						<select name="especialidadeMedico">
    						<c:forEach items="${ESPECIALIDADES_FORM}" var="tempEsp">
        						<option value="${tempEsp.codEspecialidade}"><c:out value="${tempEsp.nomeEspecialidade}" /></option>
    						</c:forEach>
						</select>
						</td>
						<!-- <td><input type="text" name="especialidadeMedico" placeholder="Especialidade"  /></td> -->
					</tr>

					<tr>
						<td><label>RG:</label></td>
						<td><input type="number" name="rgMedico" placeholder="12345678900" maxlength="11"/></td>
					</tr>
					
					<tr>
						<td><label>CPF:</label></td>
						<td><input type="number" name="cpfMedico" placeholder="00987654321" maxlength="11" /></td>
					</tr>
					<tr>
						<td><label>Endere�o:</label></td>
						<td><input type="text" name="enderecoMedico" placeholder="Rua ZYX, 999" maxlength="50"/></td>
					</tr>
					
					<tr>
						<td><label>Cidade:</label></td>
						<td>
						<select name="cidadeMedico" >
    						<c:forEach items="${CIDADES_FORM}" var="tempCid">
        						<option value="${tempCid.codCidade}"><c:out value="${tempCid.nomeCidade}" /></option>
    						</c:forEach>
						</select>
						</td>
						<!-- <td><input type="text" name="cidadeMedico" placeholder="Minha Cidade" maxlength="20"/></td> -->
					</tr>
					
					<tr>
						<td><label>Bairro:</label></td>
						<td><input type="text" name="bairroMedico" maxlength="20" placeholder="Meu Bairro"/></td>
					</tr>
					<tr>
						<td><label>Estado:</label></td>
						<td><input type="text" name="estadoMedico" maxlength="2" placeholder="SP"/></td>
					</tr>
					<tr>
						<td><label>Telefone:</label></td>
						<td><input type="tel" name="telefoneMedico" placeholder="555666000" maxlength="20"/></td>
					</tr>
					<tr>
						<td><label>E-Mail:</label></td>
						<td><input type="email" name="emailMedico" placeholder="mymail@mymail.com" maxlength="50"/></td>
					</tr>
					
					<tr>
						<td><label>Nascimento:</label></td>
						<td><input type="date" name="datanascMedico" placeholder="00/00/0000"/></td>
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
			<a href="MedicoControllerServlet">Voltar � Lista</a>
		</p>
	</div>
</body>

</html>











