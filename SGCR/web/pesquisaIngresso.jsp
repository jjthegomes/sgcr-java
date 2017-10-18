<%-- 
    Document   : pesquisaIngresso
    Created on : 12/10/2017, 00:57:43
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa de Ingresso</title>
    </head>
    <body>
        <h1>Pesquisa Ingresso</h1>
    </body>
    <table border="1">
        <tr>
            <th>Codigo</th>
            <th>Tipo</th>
            <th>Preço</th>
            <th>Data Inicio</th>
            <th>Data Final</th>
            <th>Quantidade</th>
            <th>Corrida</th>           

            <th colspan="2">Ação</th>
        </tr>
        <c:forEach items="${ingressos}" var="ingresso">
            <tr>
                <td><c:out value="${ingresso.id}" /> </td>
                <td><c:out value="${ingresso.tipo}" /> </td>
                <td><c:out value="${ingresso.preco}" /> </td>
                <td><c:out value="${ingresso.dataInicio}" /> </td>
                <td><c:out value="${ingresso.dataFinal}" /> </td>
                <td><c:out value="${ingresso.quantidade}" /> </td>
                <td><c:out value="${ingresso.corridasId}" /> </td>                
                <td><a href="ManterIngressoController?acao=prepararEditar&id=<c:out value="${ingresso.id}"/>">Editar</a> </td>
                <td><a href="ManterIngressoController?acao=prepararExcluir&id=<c:out value="${ingresso.id}"/>">Excluir</a> </td>
            </tr>
        </c:forEach>
    </table>

    <form action="ManterIngressoController?acao=prepararIncluir" method="post">
        <input type="submit" name="btnIncluir" value="Incluir">
    </form>
</html>
