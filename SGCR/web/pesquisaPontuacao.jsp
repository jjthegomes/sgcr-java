<%-- 
    Document   : pesquisaPontuacao
    Created on : 15/10/2017, 02:11:50
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa Pontuação</title>
    </head>
    <body>
        <h1>Pesquisas Pontuação</h1>
        <table border="1">
            <tr>
                <th>Id Pontuação</th>
                <th>Ranking</th>
                <th>Pontuação</th>
                <th colspan="2">Ação</th>
            </tr>

            <c:forEach items="${pontuacoes}" var="pontuacao">
                <tr>
                    <td><c:out value="${pontuacao.id}" /></td>
                    <td><c:out value="${pontuacao.ranking.nome}" /></td>
                    <td><c:out value="${pontuacao.pontuacao}" /></td>
                    <td><a href="ManterPontuacaoController?acao=prepararEditar&id=<c:out value="${pontuacao.id}"/>">Editar</a> </td>
                    <td><a href="ManterPontuacaoController?acao=prepararExcluir&id=<c:out value="${pontuacao.id}"/>">Excluir</a> </td>
                </tr>
            </c:forEach>  
        </table>
        <form action="ManterPontuacaoController?acao=prepararIncluir" method="post">
            <input type="submit" name="btnIncluir" value="Incluir">
        </form>
        <br>
        <a href="index.jsp">Menu</a>

    </body>
</html>
