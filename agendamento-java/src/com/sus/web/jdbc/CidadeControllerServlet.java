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
 * Servlet implementation class CidadeControllerServlet
 */
@WebServlet("/CidadeControllerServlet")
public class CidadeControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private CidadeDbUtil CidadeDbUtil;
	
	@Resource(name="jdbc/sus_agendamento")
	private DataSource dataSource;
	
	@Override
	public void init() throws ServletException {
		super.init();
		
		// create our especialidad db util ... and pass in the conn pool / datasource
		try {
			CidadeDbUtil = new CidadeDbUtil(dataSource);
		}
		catch (Exception exc) {
			throw new ServletException(exc);
		}
	}
	
	
	//get DbUtil
	public CidadeDbUtil getDbUtil() {
		return this.CidadeDbUtil;
	}
	
	//get datasource
	public DataSource getDataSource() {
		return this.dataSource;
	}
	

	//AVALIA PARAM COMMAND
	//metodo get
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
				listCidade(request, response);
				break;
				
		//	case "ADD":
		//		addCidade(request, response);
		//		break;
				
		//	case "LOAD":
		//		loadCidade(request, response);
		//		break;
				
		//	case "UPDATE":
		//		updateCidade(request, response);
		//		break;
			
		//	case "DELETE":
		//		deleteCidade(request, response);
		//		break;
				
			default:
				listCidade(request, response);
			}
				
		}
		catch (Exception exc) {
			throw new ServletException(exc);
		}
		
	}

	//APAGA // não há exclusão via aplicação
	private void deleteCidade(HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		// read student id from form data
		String localCidadeId = request.getParameter("cidadeId");
		
		// delete student from database
		CidadeDbUtil.deleteCidade(localCidadeId);
		
		// send them back to "list students" page
		listCidade(request, response);
	}

	//ATUALIZA //nao há atualização feita via aplicação
	private void updateCidade(HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		// read cidade info from form data
		
		String sgEstado = request.getParameter("cidadeId");
		String nomeCidade = request.getParameter("nomeCidade");
				
		// create a new student object
		Cidade cidade = new Cidade(sgEstado, nomeCidade);
		
		// perform update on database
		CidadeDbUtil.updateCidade(cidade);
		
		// send them back to the "list students" page
		listCidade(request, response);
		
	}

	//CARREGA // nao carrega pois nao há edição via aplicação
	private void loadCidade(HttpServletRequest request, HttpServletResponse response) 
		throws Exception {

		// read cidade id from form data
		String localCidadeId = request.getParameter("cidadeId");
		
		// get cidade from database (db util)
		Cidade cidade = CidadeDbUtil.getCidade(localCidadeId);
		
		// place student in the request attribute
		request.setAttribute("CIDADE", cidade);
		
		// send to jsp page: update-student-form.jsp
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("/atualiza-cidade.jsp");
		dispatcher.forward(request, response);		
	}

	//ADCIONA // não adciona via aplicação
	private void addCidade(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// le informações de cidade do form recebido
		//String codCidade = request.getParameter("codCidade");
		String nomeCidade = request.getParameter("nomeCidade");	
		
		// cria novo objeto cidade
		//Cidade cidade = new Cidade(nomeCidade);
		
		// add the student to the database
		//CidadeDbUtil.addCidade(cidade);
				
		// send back to main page (the student list)
		listCidade(request, response);
	}

	//LISTA 
	private void listCidade(HttpServletRequest request, HttpServletResponse response) 
		throws Exception {

		// get students from db util
		List<Cidade> cidades = CidadeDbUtil.getCidades();
		
		// add students to the request
		request.setAttribute("CIDADE_LIST", cidades);
				
		// send to JSP page (view)
		RequestDispatcher dispatcher = request.getRequestDispatcher("/list-cidades.jsp");
		dispatcher.forward(request, response);
	}

}













