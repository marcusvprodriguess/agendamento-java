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
			<h2>Lista de Médicos Cadastrados</h2>
		</div>
	</div>

	<div id="container">
	
		<div id="content">
		
			<!-- put new button: <input type="button" value="Cadastrar Medico" 
				   onclick="window.location.href='cadastro-medico.jsp'; return false;"
				   class="add-student-button"
			/>Add Medico -->
			
			<form action="MedicoControllerServlet" method="GET">
						
			
			<input type="hidden" name="command" value="CADASTRO" />
			<input type="submit" value="Cadastro de Médicos" class="save" />
			</form>
			<table>
			
			<!-- 
			(int codMedico, String nomeMedico, int rgMedico, int cpfMedico, 
			String enderecoMedico, String cidadeMedico, String bairroMedico, String estadoMedico,
			String emailMedico, String telefoneMedico, String  datanascMedico) -->
			
				<tr>
					<th>Código</th>
					<th>CRM</th>
					<th>Nome</th>
					<th>Especialidade</th>
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
				
				<c:forEach var="tempMedico" items="${MEDICO_LIST}">
					
					<!-- set up a link for each student -->
					<c:url var="tempLink" value="MedicoControllerServlet">
						<c:param name="command" value="LOAD" />
						<c:param name="medicoId" value="${tempMedico.codMedico}" />
					</c:url>

					<!--  set up a link to delete a student -->
					<c:url var="deleteLink" value="MedicoControllerServlet">
						<c:param name="command" value="DELETE" />
						<c:param name="medicoId" value="${tempMedico.codMedico}" />
					</c:url>
									
									<!-- 
			(int codMedico, String nomeMedico, int rgMedico, int cpfMedico, 
			String enderecoMedico, String cidadeMedico, String bairroMedico, String estadoMedico,
			String emailMedico, String telefoneMedico, String  datanascMedico) -->
																		
					<tr>
						<td> ${tempMedico.codMedico} </td>
						<td> ${tempMedico.crmMedico} </td>
						<td> ${tempMedico.nomeMedico} </td>
						
						<!-- LOOP PELA LISTA DE ESPECIALIDADES PARA DAR MATCH NO CODIGO DA TABELA MEDICO -->
						<td>
						<c:forEach items="${ESPECIALIDADES_FORM}" var="tempEspec" >
							<c:if test="${tempMedico.especialidadeMedico == tempEspec.codEspecialidade }">
								${tempEspec.nomeEspecialidade}
							</c:if>
						</c:forEach>
						</td>
						
						<!--  <td> ${tempMedico.especialidadeMedico} </td> --> 
						
						<td> ${tempMedico.rgMedico} </td>
						<td> ${tempMedico.cpfMedico} </td>
						<td> ${tempMedico.enderecoMedico} </td>
						
						<!-- LOOP PELA LISTA DE CIDADES PARA DAR MATCH NO CODIGO DA TABELA MEDICO -->
						<td>
						<c:forEach items="${CIDADES_FORM}" var="tempCid" >
							<c:if test="${tempMedico.cidadeMedico == tempCid.codCidade }">
								${tempCid.nomeCidade}
							</c:if>
						</c:forEach>
						</td>
						
						<!-- <td> ${tempMedico.cidadeMedico} </td> -->
						<td> ${tempMedico.bairroMedico} </td>
						<td> ${tempMedico.estadoMedico} </td>
						<td> ${tempMedico.emailMedico} </td>
						<td> ${tempMedico.telefoneMedico} </td>
						<td> ${tempMedico.datanascMedico} </td>
						
						
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








