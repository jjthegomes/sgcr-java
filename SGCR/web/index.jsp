<%-- 
    Document   : escolherCorridaInscricao
    Created on : 12/10/2017, 00:55:23
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <%@ include file = "layout/head.jsp" %>
        <title>Corridas</title>
    </head>
    <body>
        <nav class="navbar navbar-default navbar-fixed-top navbar-inverse" style="background-color: #2e353d">
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
                        <a href="login.jsp" style="text-decoration: none" ><button type="button" class="btn btn-primary">Login</button> </a>

                    </form>

                </div><!--/.navbar-collapse -->
            </div>
        </nav>

        <div class="container corpo">
            <div class="row">
                <c:forEach items="${corridas}" var="corrida">
                    <div class="col-md-4">                      
                        <div class="panel panel-info mouse-up" id="corrida${corrida.id}" >
                            <div class="panel-heading">${corrida.nome}</div>
                            <div class="panel-body corrida-info">
                                <div class="corrida-info-conteudo">
                                    <p><i class="fa fa-calendar" aria-hidden="true"></i> <span>${corrida.data}</span></p>
                                    <p>${corrida.descricao}</p>
                                </div>
                                <p><b>...</b></p>
                            </div>
                            <div class="panel-footer">
                                <a style="text-decoration: none" href="ManterInscricaoController?acao=prepararIncluir&corridaId=<c:out value="${corrida.id}"/>">
                                    <button class="btn btn-block btn-success"> Inscrever </button> 
                                </a>   
                            </div>  
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>

        <script type="text/javascript" src="public/js/myscript.js"></script>
        <%@ include file = "layout/rodape.jsp" %>

    </body>
</html>
