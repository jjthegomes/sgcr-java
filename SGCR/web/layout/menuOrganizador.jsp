<%-- 
    Document   : menuOrganizador
    Created on : 04/12/2017, 16:48:31
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav class="navbar navbar-default navbar-fixed-top navbar-inverse" style="background-color: #2e353d">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/SGCR">Sistema de Corrida</a>
        </div>

        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Nome Organizador<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="dropdown-header">Organizador</li>
                        <li><a href="PesquisaOrganizadorController">Editar Dados</a></li>
                        <li><a href="ManterCorridaController?acao=prepararIncluir">Criar Corrida</a></li>
                        <li><a href="PesquisaCorridaController">Editar Corridas</a></li>
                        <li><a href="#">Importar Dados</a></li>
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

<div class="nav-side-menu">
    <div class="brand">Dashboard</div>
    <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>

    <div class="menu-list">
        <ul id="menu-content" class="menu-content collapse out">
            <li>
                <a href="dashboard.jsp">
                    <i class="fa fa-dashboard fa-lg"></i> Dashboard
                </a>
            </li>
            <li data-toggle="collapse" data-target="#service" class="collapsed">
                <a href="#"><i class="fa fa-cog fa-lg"></i> Gerenciar <span class="arrow"></span></a>
            </li>  
            <ul class="sub-menu collapse" id="service">
                <li><a href="ManterRetirarKitController?acao=escolherCorrida">Retirar Kit</a></li>
                <li><a href="ManterResultadoCorridaController?acao=escolherCorrida">Resultado Corridas </a></li>
                <li><a href="ManterPagamentoController?acao=escolherCorrida"> Pagamento</a></li>

            </ul>
            <li><a href="PesquisaCorridaController"><i class="fa fa-map-marker fa-lg"></i> Corrida</a></li>
            <li><a href="PesquisaPercursoController"><i class="fa fa-map fa-lg"></i> Percurso</a></li>
            <li><a href="PesquisaKitController"><i class="fa fa-shopping-bag fa-lg"></i> Kit</a></li>
            <li><a href="PesquisaProdutoKitController"><i class="fa fa-cubes fa-lg"></i> Produto Kit</a></li>
            <li><a href="PesquisaInscricaoController"><i class="fa fa-calendar fa-lg"></i> Inscrição</a></li>
            <li><a href="PesquisaLoteController"><i class="fa fa-ticket fa-lg"></i> Lote</a></li>
<!--            <li><a href="PesquisaPontuacaoController"><i class="fa fa-gamepad fa-lg"></i> Pontuação</a> </li>-->

        </ul>
    </div>
</div>