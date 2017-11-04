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
 * Servlet implementation class UsuarioControllerServlet
 */
@WebServlet("/UsuarioControllerServlet")
public class UsuarioControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UsuarioDbUtil UsuarioDbUtil;
	
	@Resource(name="jdbc/sus_agendamento")
	private DataSource dataSource;
	
	@Override
	public void init() throws ServletException {
		super.init();
		
		// create our student db util ... and pass in the conn pool / datasource
		try {
			UsuarioDbUtil = new UsuarioDbUtil(dataSource);
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
				listUsuario(request, response);
				break;
				
			case "ADD":
				addUsuario(request, response);
				break;
				
			case "LOAD":
				loadUsuario(request, response);
				break;
				
			case "UPDATE":
				updateUsuario(request, response);
				break;
			
			case "DELETE":
				deleteUsuario(request, response);
				break;
				
			default:
				listUsuario(request, response);
			}
				
		}
		catch (Exception exc) {
			throw new ServletException(exc);
		}
		
	}

	//APAGA
	private void deleteUsuario(HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		// read student id from form data
		String localUsuarioId = request.getParameter("usuarioId");
		
		// delete student from database
		UsuarioDbUtil.deleteUsuario(localUsuarioId);
		
		// send them back to "list students" page
		listUsuario(request, response);
	}

	//ATUALIZA
	private void updateUsuario(HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		// read student info from form data
		int codUsuario = Integer.parseInt(request.getParameter("usuarioId"));
		String nomeUsuario = request.getParameter("nomeUsuario");
		String loginUsuario = request.getParameter("loginUsuario");
		String senhaUsuario = request.getParameter("senhaUsuario");
		String dsUsuario = request.getParameter("dsUsuario");
		
				
		// create a new student object
		Usuario usuario = new Usuario(codUsuario, nomeUsuario, loginUsuario, senhaUsuario, dsUsuario);
		
		// perform update on database
		UsuarioDbUtil.updateUsuario(usuario);
		
		// send them back to the "list students" page
		listUsuario(request, response);
		
	}

	//CARREGA
	private void loadUsuario(HttpServletRequest request, HttpServletResponse response) 
		throws Exception {

		// read student id from form data
		String localUsuarioId = request.getParameter("usuarioId");
		
		// get student from database (db util)
		Usuario usuario = UsuarioDbUtil.getUsuario(localUsuarioId);
		
		// place student in the request attribute
		request.setAttribute("USUARIO", usuario);
		
		// send to jsp page: update-student-form.jsp
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("/atualiza-usuario.jsp");
		dispatcher.forward(request, response);		
	}

	//ADCIONA
	private void addUsuario(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// le informações de usuario do form recebido
		
		//int codUsuario = Integer.parseInt(request.getParameter("usuarioId"));
		String nomeUsuario = request.getParameter("nomeUsuario");
		String loginUsuario = request.getParameter("loginUsuario");
		String senhaUsuario = request.getParameter("senhaUsuario");
		String dsUsuario = request.getParameter("dsUsuario");

		
		// cria novo objeto usuario
		Usuario usuario = new Usuario(nomeUsuario, loginUsuario, senhaUsuario, dsUsuario);
		
		// add the student to the database
		UsuarioDbUtil.addUsuario(usuario);
				
		// send back to main page (the student list)
		listUsuario(request, response);
	}

	//LISTA 
	private void listUsuario(HttpServletRequest request, HttpServletResponse response) 
		throws Exception {

		// get students from db util
		List<Usuario> usuarios = UsuarioDbUtil.getUsuarios();
		
		// add students to the request
		request.setAttribute("USUARIO_LIST", usuarios);
				
		// send to JSP page (view)
		RequestDispatcher dispatcher = request.getRequestDispatcher("/list-usuarios.jsp");
		dispatcher.forward(request, response);
	}

}













