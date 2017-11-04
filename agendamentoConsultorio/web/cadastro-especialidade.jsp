<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="menu.jsp" %>
	<div class="container">
	<div id="wrapper">
		<div id="header">
			<h2>Cadastro de Especialidade</h2>
		</div>
	</div>
	
		
		<form action="EspecialidadeControllerServlet" method="GET">
		
			<input type="hidden" name="command" value="ADD" />
			
			<table class="table table-striped table-hover">
				<tbody>
					<tr>
						<td><label>Código:</label></td>
						<td><input type="text" name="codEspecialidade"  /></td>
					</tr>

					<tr>
						<td><label>Especialidade:</label></td>
						<td><input type="text" name="nomeEspecialidade" required /></td>
					</tr>					
				</tbody>
			</table>
			<input type="submit" value="Salvar" class="btn btn-info" />
		</form>
		
		<div style="clear: both;"></div>
		
		<p>
			<a href="EspecialidadeControllerServlet">Voltar à Lista</a>
		</p>
	</div>
</body>

</html>











