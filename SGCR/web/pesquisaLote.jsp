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
        <title>Pesquisa de Lote</title>
    </head>
    <body>
        <h1>Pesquisa Lote</h1>
    
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
        <c:forEach items="${lotes}" var="lote">
            <tr>
                <td><c:out value="${lote.id}" /> </td>
                <td><c:out value="${lote.tipo}" /> </td>
                <td><c:out value="${lote.preco}" /> </td>
                <td><c:out value="${lote.dataInicio}" /> </td>
                <td><c:out value="${lote.dataFinal}" /> </td>
                <td><c:out value="${lote.quantidade}" /> </td>
                <td><c:out value="${lote.corridasId}" /> </td>                
                <td><a href="ManterLoteController?acao=prepararEditar&id=<c:out value="${lote.id}"/>">Editar</a> </td>
                <td><a href="ManterLoteController?acao=prepararExcluir&id=<c:out value="${lote.id}"/>">Excluir</a> </td>
            </tr>
        </c:forEach>
    </table>

    <form action="ManterLoteController?acao=prepararIncluir" method="post">
        <input type="submit" name="btnIncluir" value="Incluir">
    </form>
    <br>
        <tr>
            <td><a href="index.jsp">Menu</a></td>
        </tr>
    </body>
</html>
