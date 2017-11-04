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
 * Servlet implementation class PacienteControllerServlet
 */
@WebServlet("/PacienteControllerServlet")
public class PacienteControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private PacienteDbUtil PacienteDbUtil;
	
	@Resource(name="jdbc/sus_agendamento")
	private DataSource dataSource;
	
	@Override
	public void init() throws ServletException {
		super.init();
		
		// create our student db util ... and pass in the conn pool / datasource
		try {
			PacienteDbUtil = new PacienteDbUtil(dataSource);
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
				listPaciente(request, response);
				break;
				
			case "ADD":
				addPaciente(request, response);
				break;
				
			case "LOAD":
				loadPaciente(request, response);
				break;
				
			case "UPDATE":
				updatePaciente(request, response);
				break;
			
			case "DELETE":
				deletePaciente(request, response);
				break;
				
			default:
				listPaciente(request, response);
			}
				
		}
		catch (Exception exc) {
			throw new ServletException(exc);
		}
		
	}

	//APAGA
	private void deletePaciente(HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		// read student id from form data
		String localPacienteId = request.getParameter("pacienteId");
		
		// delete student from database
		PacienteDbUtil.deletePaciente(localPacienteId);
		
		// send them back to "list students" page
		//listPaciente(request, response);
		response.sendRedirect("./PacienteControllerServlet");
	}

	//ATUALIZA
	private void updatePaciente(HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		// read student info from form data
		int codPaciente = Integer.parseInt(request.getParameter("pacienteId"));
		String nomePaciente = request.getParameter("nomePaciente");
		int rgPaciente = Integer.parseInt(request.getParameter("rgPaciente"));
		int cpfPaciente = Integer.parseInt(request.getParameter("cpfPaciente"));
		String enderecoPaciente = request.getParameter("enderecoPaciente");
		String cidadePaciente = request.getParameter("cidadePaciente");
		String bairroPaciente = request.getParameter("bairroPaciente");
		String estadoPaciente = request.getParameter("estadoPaciente");
		String emailPaciente = request.getParameter("emailPaciente");
		String telefonePaciente = request.getParameter("telefonePaciente");
		String datanascPaciente = request.getParameter("datanascPaciente");
				
		// create a new student object
		Paciente paciente = new Paciente(codPaciente, nomePaciente, rgPaciente, cpfPaciente, 
				enderecoPaciente, cidadePaciente, bairroPaciente, estadoPaciente,
				emailPaciente, telefonePaciente, datanascPaciente);
		
		// perform update on database
		PacienteDbUtil.updatePaciente(paciente);
		
		// send them back to the "list students" page
		//listPaciente(request, response);
		response.sendRedirect("./PacienteControllerServlet");
		
	}

	//CARREGA
	private void loadPaciente(HttpServletRequest request, HttpServletResponse response) 
		throws Exception {

		// read student id from form data
		String localPacienteId = request.getParameter("pacienteId");
		
		// get student from database (db util)
		Paciente paciente = PacienteDbUtil.getPaciente(localPacienteId);
		
		// place student in the request attribute
		request.setAttribute("PACIENTE", paciente);
		
		// send to jsp page: update-student-form.jsp
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("/atualiza-paciente.jsp");
		dispatcher.forward(request, response);		
	}

	//ADCIONA
	private void addPaciente(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// le informa��es de paciente do form recebido
		
		//int codPaciente = Integer.parseInt(request.getParameter("pacienteId"));
		String nomePaciente = request.getParameter("nomePaciente");
		int rgPaciente = Integer.parseInt(request.getParameter("rgPaciente"));
		int cpfPaciente = Integer.parseInt(request.getParameter("cpfPaciente"));
		String enderecoPaciente = request.getParameter("enderecoPaciente");
		String cidadePaciente = request.getParameter("cidadePaciente");
		String bairroPaciente = request.getParameter("bairroPaciente");
		String estadoPaciente = request.getParameter("estadoPaciente");
		String emailPaciente = request.getParameter("emailPaciente");
		String telefonePaciente = request.getParameter("telefonePaciente");
		String datanascPaciente = request.getParameter("datanascPaciente");
		
		// cria novo objeto paciente
		Paciente paciente = new Paciente(nomePaciente, rgPaciente, cpfPaciente, 
				enderecoPaciente, cidadePaciente, bairroPaciente, estadoPaciente,
				emailPaciente, telefonePaciente, datanascPaciente);
		
		// add the student to the database
		PacienteDbUtil.addPaciente(paciente);
				
		// send back to main page (the student list)
		//listPaciente(request, response);
		response.sendRedirect("./PacienteControllerServlet");
	}

	//LISTA 
	private void listPaciente(HttpServletRequest request, HttpServletResponse response) 
		throws Exception {

		// get students from db util
		List<Paciente> pacientes = PacienteDbUtil.getPacientes();
		
		// add students to the request
		request.setAttribute("PACIENTE_LIST", pacientes);
				
		// send to JSP page (view)
		RequestDispatcher dispatcher = request.getRequestDispatcher("/list-pacientes.jsp");
		dispatcher.forward(request, response);
	}

}













