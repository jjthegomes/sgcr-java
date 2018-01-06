<%-- 
    Document   : pesquisaAdministrador
    Created on : 12/10/2017, 00:55:23
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <%@ include file = "layout/head.jsp" %>
        <title>Pesquisa de Corrida</title>
    </head>
    <body>
        <%@ include file = "layout/menu.jsp" %>

        <div class="container-fluid corpo corpo-adm">
            <div class="row">
                <div class="col-lg-10 col-sm-9">
                    <h2>Minhas Corridas</h2> 
               </div>
                <div class="col-lg-2 col-sm-3">
                    <form action="ManterCorridaController?acao=prepararIncluir" method="post">
                        <h2><button type="submit" class="btn btn-success btn" name="btnIncluir" value="Incluir">Criar Corrida</button></h2>
                    </form>
                </div>
            </div>
            <hr>
            <div class="row">
                <c:forEach items="${corridas}" var="corrida">
                    <div class="col-md-4">                      
                        <div class="panel panel-info mouse-up" id="corrida${corrida.id}" >
                            <div class="panel-heading">${corrida.nome}</div>
                            <div class="panel-body corrida-info">
                                <div class="corrida-info-conteudo">
                                    <p><i class="fa fa-calendar" aria-hidden="true"></i> <span>${corrida.data}</span></p>
                                    <p><i class="fa fa-clock-o" aria-hidden="true"></i> <span>${corrida.horario}</span></p>
                                    <p>${corrida.descricao}</p>
                                </div>
                                <p><b>...</b></p>
                            </div>

                            <div class="panel-footer">
                                <div class="row">
                                    <div class="col-md-6">
                                        <a href="ManterCorridaController?acao=prepararEditar&id=<c:out value="${corrida.id}"/>" class="btn btn-primary btn-block btn-sm"><b><i class="fa fa-pencil-square-o" aria-hidden="true"></i>  Editar</b></a>
                                    </div>
                                    <div class="col-md-6">
                                        <a href="ManterCorridaController?acao=prepararExcluir&id=<c:out value="${corrida.id}"/>" class="btn btn-block btn-danger btn-sm"><b><i class="fa fa-trash" aria-hidden="true"></i> Excluir</b></a>
                                    </div>

                                </div>
                            </div>  
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <%@ include file = "layout/rodape.jsp" %>
    </body>
</html>
