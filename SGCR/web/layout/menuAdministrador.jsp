<%-- 
    Document   : menuAdministrador
    Created on : 04/12/2017, 17:25:59
    Author     : rafael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">Sistema de Corrida</a>
      </div>
      <div id="navbar" class="navbar-collapse collapse">
        <ul class="nav navbar-nav navbar-right">
          <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Administrador<span class="caret"></span></a>
            <ul class="dropdown-menu">
            <li class="dropdown-header">Administrador</li>
            <li class="active"><a href="#">Minha Conta</a></li>
            <li><a href="#">Criar Ranking</a></li>
            <li><a href="#">Alterar Ranking</a></li>
            <li><a href="#">Bloquear Usuário</a></li>
            <li><a href="#">Gerar Relatórios</a></li>
             <li class="divider"></li>
              <li><a href="#">Sair</a></li>
            </ul>
          </li>
        </ul>
        <form class="navbar-form navbar-right">
          <div class="form-group">
            <div class="input-group">
              <div class="input-group-btn">
                <button class="btn btn-default" type="submit">
                  <i class="fa fa-search" aria-hidden="true"></i>
                </button>
              </div>
              <input type="text" class="form-control" placeholder="Busca" size="40">
            </div>
          </div>
        </form>
      </div><!--/.navbar-collapse -->
    </div>
  </nav>