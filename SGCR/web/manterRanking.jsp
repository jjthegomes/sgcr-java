<%-- 
    Document   : manterRanking
    Created on : 17/10/2017, 09:31:01
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;" charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Inscrição</title>
        <meta http-equiv="pragma" content="no-cache">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" type="text/css" href="public/bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" type="text/css" href="public/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="public/css/estilo.css">
        <title>Manter Ranking</title>
    </head>

    <body>
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
                                <li><a href="#">Minha Conta</a></li>
                                <li><a href="#">Criar Ranking</a></li>
                                <li><a href="#">Alterar Ranking</a></li>
                                <li><a href="#">Gerar Relatórios</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Sair</a></li>
                            </ul>
                        </li>
                    </ul>
                </div><!--/.navbar-collapse -->
            </div>
        </nav>
        
        <div class="container corpo">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-success">
                        <div class="panel-heading">Ranking - ${operacao}</div>
                        <div class="panel-body">
                            <p><button class="btn btn-basic btn-info" >Digite suas informações abaixo:</button></p>
                            <form action="ManterRankingController?acao=confirmar${operacao}" method="post" name="frmManterRanking">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                        <label for="codigo">Administrador:</label>
                                        <select  class="form-control" name="optAdministrador" <c:if test="${operacao == 'Excluir'}"> disabled</c:if>>
                                            <option value="0" <c:if test="${ranking.administrador.id == null}"> selected</c:if>> </option>  
                                            <c:forEach items="${administradores}" var="administrador">
                                            <option value="${administrador.id}" <c:if test="${ranking.administradorId == administrador.id}"> selected</c:if>>${administrador.nome}</option>  
                                            </c:forEach>
                                        </select>
                                    </div>
                                        <div class="form-group">
                                            <label for="codigo">Código:</label>
                                            <input type="text" class="form-control" name="txtIdRanking" value="${ranking.id}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if>>
                                        </div>
                                        <div class="form-group">
                                            <label for="nome">Nome</label>
                                            <input type="text" id="nome" class="form-control" name="txtNomeRanking" value="${ranking.nome}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        </div>
                                        <div class="form-group">
                                            <label for="FaixaEtaria">Intervalo de Faixa Etaria</label>
                                            <input type="text" class="form-control" name="txtIntervaloFaixaEtaria" value="${ranking.intervaloFaixaEtaria}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        </div>
                                        <div class="form-group">
                                            <a href="index.jsp" style="text-decoration: none" ><button type="button" class="btn btn-danger">Cancelar</button> </a>
                                            <input type="submit" name="btnConfirmar" value="Confirmar" class="btn btn-success" >

                                        </div>
                                    </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <script type="text/javascript" src="public/bootstrap/js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="public/bootstrap/js/bootstrap.js"></script>
</body>
</html>
