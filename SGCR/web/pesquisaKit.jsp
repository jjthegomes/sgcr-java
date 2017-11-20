<%-- 
    Document   : pesquisaKit
    Created on : 14/10/2017, 17:10:36
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;" charset=UTF-8">
        <title>Pesquisa Kit</title>
    </head>
    <body>
        <h1>Pesquisas Kit</h1>
        <table border="1">
            <tr>
                <th>Código</th>
                <th>Corrida</th>

                <th>Nome</th>
                <th>Imagem</th>
                <th>Tipo Chip</th>
                <th colspan="2">Ação</th>
            </tr>

            <c:forEach items="${kits}" var="kit">
                <tr>
                    <td><c:out value="${kit.id}" /></td>
                    <td><c:out value="${kit.corrida.nome}" /></td>
                    <td><c:out value="${kit.nome}" /></td>
                    <td><c:out value="${kit.imagem}" /></td>
                    <td><c:out value="${kit.tipoChip}" /></td>
                    <td><a href="ManterKitController?acao=prepararEditar&id=<c:out value="${kit.id}"/>&corridaId=<c:out value="${kit.corridaId}"/>">Editar</a> </td>
                    <td><a href="ManterKitController?acao=prepararExcluir&id=<c:out value="${kit.id}"/>&corridaId=<c:out value="${kit.corridaId}"/>">Excluir</a> </td>
                </tr>
            </c:forEach>
        </table>
        <form action="ManterKitController?acao=prepararIncluir" method="post">
            <input type="submit" name="btnIncluir" value="Incluir">
        </form>
        <br>
        <a href="index.jsp">Menu</a>
    </body>
</html>
