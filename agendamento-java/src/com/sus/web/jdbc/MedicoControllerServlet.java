package com.sus.web.jdbc;


import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;


/**
 * Servlet implementation class MedicoControllerServlet
 */
@WebServlet("/MedicoControllerServlet")
public class MedicoControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MedicoDbUtil MedicoDbUtil;
	private EspecialidadeDbUtil EspecialidadeDbUtil;
	private CidadeDbUtil CidadeDbUtil;
	
	@Resource(name="jdbc/sus_agendamento")
	private DataSource dataSource;
	
	@Override
	public void init() throws ServletException {
		super.init();
		
		// create our student db util ... and pass in the conn pool / datasource
		try {
			MedicoDbUtil = new MedicoDbUtil(dataSource);
		}
		catch (Exception exc) {
			throw new ServletException(exc);
		}
	}
	
	//AVALIA PARAM COMMAND
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			// read the "command" parameter
			String theCommand = request.getParameter("command");
			
			// if the command is missing, then default to listing students
			if (theCommand == null) {
				theCommand = "LIST";
			}
			
			// route to the appropriate method
			switch (theCommand) {
			
			case "LIST":
				listMedico(request, response);
				break;
				
			case "CADASTRO":
				formMedico(request, response);
				break;
				
			case "ADD":
				addMedico(request, response);
				break;
				
			case "LOAD":
				loadMedico(request, response);
				break;
				
			case "UPDATE":
				updateMedico(request, response);
				break;
			
			case "DELETE":
				deleteMedico(request, response);
				break;
				
			default:
				listMedico(request, response);
			}
				
		}
		catch (Exception exc) {
			throw new ServletException(exc);
		}
		
	}
	
	private void formMedico(HttpServletRequest request, HttpServletResponse response) throws Exception{

			getDadosParaForm(request, response);		
		
			// send to JSP page (view)
			RequestDispatcher dispatcher = request.getRequestDispatcher("/cadastro-medico.jsp");
			dispatcher.forward(request, response);

	}
	
	//teste
	private void getDadosParaForm(HttpServletRequest request, HttpServletResponse response) throws Exception{

		EspecialidadeDbUtil = new EspecialidadeDbUtil(dataSource);	
		List<Especialidade> listEsp = EspecialidadeDbUtil.getEspecialidades();
			
		request.setAttribute("ESPECIALIDADES_FORM", listEsp);
			
		CidadeDbUtil = new CidadeDbUtil(dataSource);
		List<Cidade> listCid = CidadeDbUtil.getCidades();
		
		request.setAttribute("CIDADES_FORM", listCid);	


	}
	
	
	//APAGA
	private void deleteMedico(HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		// read student id from form data
		String localMedicoId = request.getParameter("medicoId");
		
		// delete student from database
		MedicoDbUtil.deleteMedico(localMedicoId);
		
		// send them back to "list students" page
		//listMedico(request, response);
		response.sendRedirect("./MedicoControllerServlet");
	}

	//ATUALIZA
	private void updateMedico(HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		/*	nm_Medico VARCHAR(50),
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
    dt_Nascimento DATE,*/
		// read student info from form data
		int codMedico = Integer.parseInt(request.getParameter("medicoId")); //ID é o campo identificador sequencial
		int crmMedico = Integer.parseInt(request.getParameter("crmMedico"));
		String nomeMedico = request.getParameter("nomeMedico");
		int especialidadeMedico = Integer.parseInt(request.getParameter("especialidadeMedico"));
		int rgMedico = Integer.parseInt(request.getParameter("rgMedico"));
		int cpfMedico = Integer.parseInt(request.getParameter("cpfMedico"));
		String enderecoMedico = request.getParameter("enderecoMedico");
		String cidadeMedico = request.getParameter("cidadeMedico");
		String bairroMedico = request.getParameter("bairroMedico");
		String estadoMedico = request.getParameter("estadoMedico");
		String emailMedico = request.getParameter("emailMedico");
		String telefoneMedico = request.getParameter("telefoneMedico");
		String datanascMedico = request.getParameter("datanascMedico");
				
		// create a new student object
		Medico medico = new Medico(codMedico, crmMedico, nomeMedico, especialidadeMedico, rgMedico, cpfMedico, 
				enderecoMedico, cidadeMedico, bairroMedico, estadoMedico,
				emailMedico, telefoneMedico, datanascMedico);
		
		// perform update on database
		MedicoDbUtil.updateMedico(medico);
		
		// send them back to the "list students" page
		//listMedico(request, response);
		response.sendRedirect("./MedicoControllerServlet");
		
	}

	//CARREGA
	private void loadMedico(HttpServletRequest request, HttpServletResponse response) 
		throws Exception {

		// read medico id from form data (codMedico)
		String localMedicoId = request.getParameter("medicoId");
		
		// get student from database (db util)
		Medico medico = MedicoDbUtil.getMedico(localMedicoId);
		
		// place student in the request attribute
		request.setAttribute("MEDICO", medico);
		
		//seta parametros usados para dropdown no request
		getDadosParaForm(request, response);
		
		// send to jsp page: update-student-form.jsp
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("/atualiza-medico.jsp");
		dispatcher.forward(request, response);		
	}

	//ADCIONA
	private void addMedico(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// le informações de medico do form recebido
		
		int crmMedico = Integer.parseInt(request.getParameter("crmMedico"));
		String nomeMedico = request.getParameter("nomeMedico");
		int especialidadeMedico = Integer.parseInt(request.getParameter("especialidadeMedico"));
		int rgMedico = Integer.parseInt(request.getParameter("rgMedico"));
		int cpfMedico = Integer.parseInt(request.getParameter("cpfMedico"));
		String enderecoMedico = request.getParameter("enderecoMedico");
		String cidadeMedico = request.getParameter("cidadeMedico");
		String bairroMedico = request.getParameter("bairroMedico");
		String estadoMedico = request.getParameter("estadoMedico");
		String emailMedico = request.getParameter("emailMedico");
		String telefoneMedico = request.getParameter("telefoneMedico");
		String datanascMedico = request.getParameter("datanascMedico");
		
		// cria novo objeto medico - chama construtor com CRM pois este é digitado
		Medico medico = new Medico(crmMedico, nomeMedico, especialidadeMedico, rgMedico, cpfMedico, 
				enderecoMedico, cidadeMedico, bairroMedico, estadoMedico,
				emailMedico, telefoneMedico, datanascMedico);
		
		// add the medico to the database
		MedicoDbUtil.addMedico(medico);
				
		// send back to main page (the medico list)
		//listMedico(request, response);
		response.sendRedirect("./MedicoControllerServlet");
	}

	//LISTA 
	private void listMedico(HttpServletRequest request, HttpServletResponse response) 
		throws Exception {

		// get students from db util
		List<Medico> medicos = MedicoDbUtil.getMedicos();
		
		// add students to the request
		request.setAttribute("MEDICO_LIST", medicos);
				
		// send to JSP page (view)
		RequestDispatcher dispatcher = request.getRequestDispatcher("/list-medicos.jsp");
		dispatcher.forward(request, response);
	}

}













