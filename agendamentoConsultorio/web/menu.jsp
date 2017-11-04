<%-- 
    Document   : menu
    Created on : 04/11/2017, 12:20:53
    Author     : JessicaMaria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
 
    <meta name="description" content="">
    <meta name="author" content="">
    <script src="js/angular.min.js"></script>
    <link rel="icon" href="imagens/favicon.ico">

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/estilos.css" rel="stylesheet">
    <script src="assets/js/ie-emulation-modes-warning.js"></script>

    <!-- Custom styles for this template -->
    <link href="css/carousel.css" rel="stylesheet">
  </head>
<!-- NAVBAR
================================================== -->
  <body>

<div class="navbar-default">
      <div class="container-fluid">
        <nav class="navbar">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a id="novaConsulta" class="navbar-brand" href="#">Nova Consulta</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
              <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Cadastros<span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="EspecialidadeControllerServlet">Especialidade</a></li>
                    <li><a href="medicos.html">Médico</a></li>
                    <li><a  href="PacienteControllerServlet">Paciente</a></li>
                    <li><a href="MedicoControllerServlet">Usuário</a></li>
                  </ul>
                  </li>  
                  <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Agendamento<span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="#">Nova Consulta</a></li>
                    <li><a href="#">Consultas Agendadas</a></li>
                  </ul>
                  </li>
                  <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Relatório<span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="#">Consultas</a></li>
                    <li><a href="prontuario.html">Prontuários</a></li>
                  </ul>
                  </li>
                </ul>
            </div>
          </div>
        </nav>

      </div>
    </div>
    </body>
<script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>