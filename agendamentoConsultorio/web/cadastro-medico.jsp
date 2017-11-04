<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="menu.jsp" %>

<!DOCTYPE html>

<div class="container">
    <h3>Cadastro de Medico</h3>

    <form action="MedicoControllerServlet" method="GET">

        <input type="hidden" name="command" value="ADD" />

        <table class="table table-striped table-hover">
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
                    <td><input type="text" name="nomeMedico"  maxlength="50" /></td>
                </tr>

                <tr>
                    <td><label>CRM:</label></td>
                    <td><input type="text" name="crmMedico"  maxlength="20"/></td>
                </tr>

                <tr>
                    <td><label>Especialidade:</label></td>
                    <td>
                        <select name="especialidadeMedico">      
                        </select>
                    </td>
                </tr>

                <tr>
                    <td><label>RG:</label></td>
                    <td><input type="text" name="rgMedico"  maxlength="11"/></td>
                </tr>

                <tr>
                    <td><label>CPF:</label></td>
                    <td><input type="text" name="cpfMedico"  maxlength="11" /></td>
                </tr>
                <tr>
                    <td><label>Endereço:</label></td>
                    <td><input type="text" name="enderecoMedico"  maxlength="50"/></td>
                </tr>
                <tr>
                    <td><label>Cidade:</label></td>
                    <td><input type="text" name="cidadeMedico"  maxlength="20"/></td>
                </tr>
                <tr>
                    <td><label>Bairro:</label></td>
                    <td><input type="text" name="bairroMedico" value="" /></td>
                </tr>
                <tr>
                    <td><label>Estado:</label></td>
                    <td><input type="text" name="estadoMedico" value="" /></td>
                </tr>
                <tr>
                    <td><label>Telefone:</label></td>
                    <td><input type="text" name="telefoneMedico"  maxlength="20"/></td>
                </tr>
                <tr>
                    <td><label>E-Mail:</label></td>
                    <td><input type="text" name="emailMedico"  maxlength="50"/></td>
                </tr>

                <tr>
                    <td><label>Nascimento:</label></td>
                    <td><input type="text" name="datanascMedico" value="" /></td>
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











