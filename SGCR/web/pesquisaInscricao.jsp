<%-- 
    Document   : pesquisaAdministrador
    Created on : 10/10/2017, 08:49:47
    Author     : straby
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa de Inscricoes</title>
    </head>
    <body>
        <h1>Pesquisa Inscricao</h1>
    </body>
    <table border="1">
        <tr>
            <th>Codigo</th>
     


            <th colspan="2">Ação</th>
        </tr>
        <c:forEach items="${inscricoes}" var="inscricao">
            <tr>
                <td><c:out value="${inscricao.id}" /> </td>

                <td><a href="ManterInscricaoController?acao=prepararEditar&id=<c:out value="${inscricao.id}"/>">Editar</a> </td>
                <td><a href="ManterInscricaoController?acao=prepararExcluir&id=<c:out value="${inscricao.id}"/>">Excluir</a> </td>
            </tr>
        </c:forEach>
    </table>

    <form action="ManterInscricaoController?acao=prepararIncluir" method="post">
        <input type="submit" name="btnIncluir" value="Incluir">
    </form>
</html>
