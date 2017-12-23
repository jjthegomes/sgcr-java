<%-- 
    Document   : menu
    Created on : 04/12/2017, 17:18:40
    Author     : rafael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
            <c:choose>
                <c:when test="${usuario==null}">
                    <div class="navbar-form navbar-right">
                        <a href="login.jsp" style="text-decoration: none" ><button type="button" class="btn btn-primary">Login</button> </a>
                        <a href="cadastro.jsp" style="text-decoration: none" ><button type="button" class="btn btn-primary">Cadastrar</button> </a>
                    </div>
                </c:when> 
                <c:when test="${usuario=='atleta' && atleta != null}">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">${atleta.nome}<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li class="dropdown-header">Atleta</li>
                                <li><a href="ManterAtletaController?acao=prepararEditar&id=${atleta.id}">Minha Conta</a></li>
                                <li><a href="#">Minhas Corridas</a></li>
                                <li class="divider"></li>
                                <li><a href="LoginController?acao=logout">Sair</a></li>
                            </ul>
                        </li>
                    </ul>
                </c:when>    
                <c:when test="${usuario=='administrador' && administrador != null}">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">${administrador.nome}<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li class="dropdown-header">Administrador</li>
                                <li class="active"><a href="PesquisaAdministradorController">Minha Conta</a></li>
                                <li><a href="ManterRankingController?acao=prepararIncluir">Criar Ranking</a></li>
                                <li><a href="PesquisaRankingController">Alterar Ranking</a></li>
                                <li class="divider"></li>
                                <li><a href="LoginController?acao=logout">Sair</a></li>
                            </ul>
                        </li>
                    </ul>
                </c:when> 
                <c:when test="${usuario=='organizador' && organizador != null}">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">${organizador.nome}<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li class="dropdown-header">Organizador</li>
                                <li><a href="ManterOrganizadorController?acao=prepararEditar&id=${organizador.id}">Editar Dados</a></li>
                                <li><a href="ManterCorridaController?acao=prepararIncluir">Criar Corrida</a></li>
                                <li><a href="PesquisaCorridaController">Editar Corridas</a></li>
                                <li><a href="#">Importar Dados</a></li>
                                <li><a href="#">Gerar Relatórios</a></li>
                                <li class="divider"></li>
                                <li><a href="LoginController?acao=logout">Sair</a></li>
                            </ul>
                        </li>
                    </ul>
                </c:when>
            </c:choose>

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
        </div>
    </div>
</nav>

<c:choose>
    <c:when test="${usuario=='administrador'}">
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
                    <li><a href="PesquisaAdministradorController"><i class="fa fa-lock fa-lg"></i> Administrador</a></li>
                    <li><a href="PesquisaOrganizadorController"><i class="fa fa-male fa-lg"></i> Organizador</a></li>
                    <li><a href="PesquisaCorridaController"><i class="fa fa-map-marker fa-lg"></i> Corrida</a></li>
                    <li><a href="PesquisaPercursoController"><i class="fa fa-map fa-lg"></i> Percurso</a></li>
                    <li><a href="PesquisaKitController"><i class="fa fa-shopping-bag fa-lg"></i> Kit</a></li>
                    <li><a href="PesquisaProdutoKitController"><i class="fa fa-cubes fa-lg"></i> Produto Kit</a></li>
                    <li><a href="PesquisaProdutoController"><i class="fa fa-cube fa-lg"></i> Produto</a></li>
                    <li><a href="PesquisaAtletaController"><i class="fa fa-male fa-lg"></i> Atleta</a></li>
                    <li><a href="PesquisaInscricaoController"><i class="fa fa-calendar fa-lg"></i> Inscrição</a></li>
                    <li><a href="PesquisaLoteController"><i class="fa fa-ticket fa-lg"></i> Lote</a></li>
                    <li><a href="PesquisaRankingController"><i class="fa fa-trophy fa-lg"></i> Ranking</a></li>
                </ul>
            </div>
        </div>
    </c:when>
    <c:when test="${usuario=='organizador'}">
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
    </c:when>
</c:choose>