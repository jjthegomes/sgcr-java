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
        <title>Pesquisa de Administrador</title>
    </head>
    <body>
        <h1>Pesquisa Administrador</h1>
    </body>
    <table border="1">
        <tr>
            <th>Codigo</th>
            <th>Email</th>
            <th>Senha</th>
            <th colspan="2">Ação</th>
        </tr>
        <c:forEach items="${administradores}" var="administrador">
            <tr>
                <td><c:out value="${administrador.id}" /> </td>
                <td><c:out value="${administrador.email}" /> </td>
                <td><c:out value="${administrador.senha}" /> </td>
                <td><a href="ManterAdministradorController?acao=prepararEditar&id=<c:out value="${administrador.id}"/>">Editar</a> </td>
                <td><a href="ManterAdministradorController?acao=prepararExcluir&id=<c:out value="${administrador.id}"/>">Excluir</a> </td>
            </tr>
        </c:forEach>
        </table>
    
    <form action="ManterAdministradorController?acao=prepararIncluir" method="post">
        <input type="submit" name="btnIncluir" value="Incluir">
    </form>
    </html>
