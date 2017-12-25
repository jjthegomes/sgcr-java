<%-- 
    Document   : escolherCorridaInscricao
    Created on : 12/10/2017, 00:55:23
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:choose>
    <c:when test="${usuario=='administrador' || usuario=='organizador'}">
        <% response.sendRedirect("dashboard.jsp"); %>
    </c:when>    
</c:choose>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <%@ include file = "layout/head.jsp" %>
        <title>Corridas</title>
    </head>
    <body>
        <%@ include file = "layout/menu.jsp" %>

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
                                <div class="row">
                                    <div class="col-md-6">
                                        <a style="text-decoration: none" href="ManterInscricaoController?acao=prepararIncluir&corridaId=<c:out value="${corrida.id}"/>">

                                            <button class="btn btn-block btn-success"> Inscrever </button> 

                                        </a>
                                    </div>
                                    <div class="col-md-6">
                                        <a style="text-decoration: none" href=""href="ManterInscricaoController?acao=informacao&corridaId=<c:out value="${corrida.id}"/>">
                                        <button class="btn btn-block btn-success"> informações </button> 
                                    </div>
                                </div>


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
