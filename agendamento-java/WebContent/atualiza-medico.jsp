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
		<h3>Atualizar Medico</h3>
		
		<form action="MedicoControllerServlet" method="GET">
		
			<input type="hidden" name="command" value="UPDATE" />

			<input type="hidden" name="medicoId" value="${MEDICO.codMedico}" />
			
			<table>
				<tbody>
					
		<!--			nm_Medico VARCHAR(50),
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
    dt_Nascimento DATE,
					-->
					
					<tr>
						<td><label>Nome:</label></td>
						<td><input type="text" name="nomeMedico" maxlength="50"
								   value="${MEDICO.nomeMedico}" /></td>
					</tr>				
					
					<tr>
						<td><label>CRM:</label></td>
						<td><input type="number" name="crmMedico" maxlength="20"
								   value="${MEDICO.crmMedico}" /></td>
					</tr>
					
					<tr>
						<td><label>Especialidade:</label></td>
						<td>
						<select name="especialidadeMedico">
    						<c:forEach items="${ESPECIALIDADES_FORM}" var="tempEsp">
    						
    							<c:choose>
    							<c:when test="${MEDICO.especialidadeMedico == tempEsp.codEspecialidade }">
        							<option value="${tempEsp.codEspecialidade}" selected><c:out value="${tempEsp.nomeEspecialidade}" /></option>
    							</c:when>
    							
    							<c:otherwise>
    								<option value="${tempEsp.codEspecialidade}"><c:out value="${tempEsp.nomeEspecialidade}" /></option>
    							</c:otherwise>
    							</c:choose>
    							
    						</c:forEach>
						</select>
						</td>
						<!-- <td><input type="text" name="especialidadeMedico" 
								   value="${MEDICO.especialidadeMedico}" /></td> -->
					</tr>
					
						<tr>
						<td><label>RG:</label></td>
						<td><input type="number" name="rgMedico" maxlength="11" 
								   value="${MEDICO.rgMedico}" /></td>
					</tr>	
					
						<tr>
						<td><label>CPF:</label></td>
						<td><input type="number" name="cpfMedico" maxlength="11"
								   value="${MEDICO.cpfMedico}" /></td>
					</tr>	
					
						<tr>
						<td><label>Endereço:</label></td>
						<td><input type="text" name="enderecoMedico" maxlength="50"
								   value="${MEDICO.enderecoMedico}" /></td>
					</tr>	
					
						<tr>
						<td><label>Cidade:</label></td>
						<td>
						<select name="cidadeMedico">
    						<c:forEach items="${CIDADES_FORM}" var="tempCid">
    							
    							<c:choose>
    								<c:when test="${MEDICO.cidadeMedico == tempCid.codCidade }">
        								<option value="${tempCid.codCidade}" selected><c:out value="${tempCid.nomeCidade}" /></option>
        							</c:when>
        							<c:otherwise>
        								<option value="${tempCid.codCidade}"><c:out value="${tempCid.nomeCidade}" /></option>
        							</c:otherwise>
        						</c:choose>	
        							
    						</c:forEach>
						</select>
						</td>
						<!-- <td><input type="text" name="cidadeMedico" maxlength="20"
								   value="${MEDICO.cidadeMedico}" /></td> -->
					</tr>	
					
						<tr>
						<td><label>Bairro:</label></td>
						<td><input type="text" name="bairroMedico" maxlength="20"
								   value="${MEDICO.bairroMedico}" /></td>
					</tr>	
					
						<tr>
						<td><label>Estado:</label></td>
						<td><input type="text" name="estadoMedico" maxlength="2"
								   value="${MEDICO.estadoMedico}" /></td>
					</tr>	
					
					<tr>
						<td><label>Telefone:</label></td>
						<td><input type="tel" name="telefoneMedico" maxlength="20"
								   value="${MEDICO.telefoneMedico}" /></td>
					</tr>
					
					<tr>
						<td><label>E-mail:</label></td>
						<td><input type="email" name="emailMedico" max="50"
								   value="${MEDICO.emailMedico}" /></td>
					</tr>
					
					<tr>
						<td><label>Nascimento:</label></td>
						<td><input type="date" name="datanascMedico" 
								   value="${MEDICO.datanascMedico}" /></td>
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
			<a href="MedicoControllerServlet">Voltar à Lista</a>
		</p>
	</div>
</body>

</html>











