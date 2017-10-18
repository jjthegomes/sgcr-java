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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa de Corrida</title>
    </head>
    <body>
        <h1>Pesquisa Corrida</h1>
    </body>
    <table border="1">
        <tr>
            <th>Codigo</th>
            <th>Nome</th>
            <th>Max. Pessoas</th>
            <th>Horario Inicio</th>
            <th>Horario Fim</th>
            <th>Rua</th>
            <th>Bairro</th>
            <th>CEP</th>
            <th>Organizador</th>


            <th colspan="2">Ação</th>
        </tr>
        <c:forEach items="${corridas}" var="corrida">
            <tr>
                <td><c:out value="${corrida.id}" /> </td>
                <td><c:out value="${corrida.nomeCorrida}" /> </td>
                <td><c:out value="${corrida.maxPessoas}" /> </td>
                <td><c:out value="${corrida.horarioInicio}" /> </td>
                <td><c:out value="${corrida.horarioFinal}" /> </td>
                <td><c:out value="${corrida.rua}" /> </td>
                <td><c:out value="${corrida.bairro}" /> </td>
                <td><c:out value="${corrida.cep}" /> </td>
                <td><c:out value="${corrida.organizadoresId}" /> </td>
                <td><a href="ManterCorridaController?acao=prepararEditar&id=<c:out value="${corrida.id}"/>">Editar</a> </td>
                <td><a href="ManterCorridaController?acao=prepararExcluir&id=<c:out value="${corrida.id}"/>">Excluir</a> </td>
            </tr>
        </c:forEach>
    </table>

    <form action="ManterCorridaController?acao=prepararIncluir" method="post">
        <input type="submit" name="btnIncluir" value="Incluir">
    </form>
</html>
