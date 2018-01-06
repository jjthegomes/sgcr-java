<%-- 
    Document   : perquisaRanging
    Created on : 03/01/2018, 18:37:05
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
            <h1>Classificação do Ranking</h1>
            <table class="table table-hover table-responsive">
                <tr>
                    <th>Id</th>
                    <th>Atleta</th>
                    <th>Tempo Largada</th>
                    <th>Tempo Chegada</th>
                    <th>Tempo Final</th>                    
                    <th>Quilometragem </th>
                    <th>Pace </th>
                    <th>Media Pace </th>
                </tr>
                </thead>
                <tbody>

                    <c:forEach items="${rankings}" var="ranking">
                        <tr>
                            <td><c:out value="${ranking.id}" /></td>
                            <td><c:out value="${ranking.atleta.nome}" /></td>
                            <td><c:out value="${ranking.tempoLargada}" /></td>
                            <td><c:out value="${ranking.tempoChegada}" /></td>
                            <td><c:out value="${ranking.tempo}" /></td>
                            <td><c:out value="${ranking.quilometragem}" /></td>
                            <td><c:out value="${ranking.pace}" /></td>
                            <td><c:out value="${ranking.mediaPace}" /></td>
                        </tr>
                    </c:forEach> 
            </table>
           
            <%@ include file = "layout/rodape.jsp" %>
    </body>
</html>
