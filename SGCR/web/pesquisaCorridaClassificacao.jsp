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

        <%@ include file = "layout/head.jsp" %>
        <title>Classificação</title>

    </head>

    <body>

        <%@ include file = "layout/menu.jsp" %>
        <div class="container-fluid corpo corpo-adm col-md-8">
            
            
            <ul class="breadcrumb">
                <li><a href="PesquisaHomeController">Home</a></li>
                <li class="active">Classificação</li>
            </ul>
            
            <h1>Classificação ${corrida.nome}</h1>
            <br>
            
            <ul class="nav nav-tabs">
                <c:forEach items="${percursos}" var="percurso">
                    <li><a data-toggle="tab" href="#percurso${percurso.id}">Percurso - ${percurso.quilometragem}Km</a></li>
                <c:forEach>
            </ul>
            <h4>Percurso - ${percurso.quilometragem}</h4>
            
            <div class="tab-content">
                <c:forEach items="${percursos}" var="percurso">
                <div id="#percurso${percurso.id}" class="tab-pane fade">
                <div class="panel-body">
                <table class="table table-hover table-responsive">
                    <thead>
                <tr>
                    <th>Colocação</th>
                    <th>Nome</th>
                    <th>Largada</th>
                    <th>Chegada</th> 
                    <th>Tempo Final</th> 
                </tr>
                </thead>
                <tbody>
                    <%int i = 0;%>
                    <c:forEach items="${inscricoes}" var="inscricao">
                        <tr>
                            <td ><%i++;%>${i}</td>
                            <td><c:out value="${inscricao.atleta.nome}" /></td>
                            <td><c:out value="${inscricao.tempoLargada}" /></td>
                            <td><c:out value="${inscricao.tempoChegada}" /></td>
                            <td></td>
                            <td class="table-action"><a href="ManterRankingController?acao=prepararEditar&id=<c:out value="${ranking.id}"/>" class="btn-primary btn-block btn-xs"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>  Editar</a> </td>
                            <td class="table-action"><a href="ManterRankingController?acao=prepararExcluir&id=<c:out value="${ranking.id}"/>"  class="btn-danger btn-block btn-xs"><i class="fa fa-trash" aria-hidden="true"></i> Excluir</a> </td>
                        </tr>
                    </c:forEach>
                </tbody>
                    </table>
                    </div>
                </div>   
                </c:forEach>
            </div>
            
            <%@ include file = "layout/rodape.jsp" %>
        </div>
    </body>
</html>
