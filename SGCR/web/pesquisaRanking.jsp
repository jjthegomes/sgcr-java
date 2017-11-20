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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa Ranking</title>
    </head>
    <body>
        <h1>Pesquisa Ranking</h1>
        <table border="1">
            <tr>
                <th>Código</th>
                <th>Administrador</th>
                <th>Nome Ranking</th>
                <th>Faixa Etaria</th>                
                <th colspan="2">Ação</th>
            </tr>

            <c:forEach items="${rankings}" var="ranking">
                <tr>
                    <td><c:out value="${ranking.id}" /></td>
                    <td><c:out value="${ranking.administrador.nome}" /></td>
                    <td><c:out value="${ranking.nome}" /></td>
                    <td><c:out value="${ranking.intervaloFaixaEtaria}" /></td>
                    <td><a href="ManterRankingController?acao=prepararEditar&id=<c:out value="${ranking.id}"/>">Editar</a> </td>
                    <td><a href="ManterRankingController?acao=prepararExcluir&id=<c:out value="${ranking.id}"/>">Excluir</a> </td>
                </tr>
            </c:forEach> 
        </table>
        <form action="ManterRankingController?acao=prepararIncluir" method="post">
            <input type="submit" name="btnIncluir" value="Incluir">
        </form>
        <br>
        <a href="index.jsp">Menu</a>

    </body>
</html>
