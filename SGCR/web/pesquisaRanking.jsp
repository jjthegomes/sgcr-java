<%-- 
    Document   : perquisaRanging
    Created on : 15/10/2017, 11:37:05
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

    <head>
        <%@ include file = "layout/head.jsp" %>
        <title>Pesquisa Ranking</title>
    </head>
    <body>
        <%@ include file = "layout/menu.jsp" %>
        <div class="container-fluid corpo corpo-adm">
            <h1>Pesquisa Ranking</h1>
            <table class="table table-hover table-responsive">
                <tr>
                    <th>Administrador</th>
                    <th>Nome Ranking</th>
                    <th>Faixa Etaria</th>                
                    <th colspan="2" class="table-action">Ação</th>
                </tr>
                </thead>
                <tbody>

                    <c:forEach items="${rankings}" var="ranking">
                        <tr>
                            <td><c:out value="${ranking.administrador.nome}" /></td>
                            <td><c:out value="${ranking.nome}" /></td>
                            <td><c:out value="${ranking.intervaloFaixaEtaria}" /></td>
                            <td class="table-action"><a href="ManterRankingController?acao=prepararEditar&id=<c:out value="${ranking.id}"/>" class="btn-primary btn-block btn-xs"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>  Editar</a> </td>
                            <td class="table-action"><a href="ManterRankingController?acao=prepararExcluir&id=<c:out value="${ranking.id}"/>"  class="btn-danger btn-block btn-xs"><i class="fa fa-trash" aria-hidden="true"></i> Excluir</a> </td>
                        </tr>
                    </c:forEach> 
            </table>
            <form action="ManterRankingController?acao=prepararIncluir" method="post">
                <button type="submit" class="btn btn-success" name="btnIncluir" value="Incluir"><i class="fa fa-trophy" aria-hidden="true"></i> Incluir Ranking</button>
            </form>
            <%@ include file = "layout/rodape.jsp" %>
    </body>
</html>
