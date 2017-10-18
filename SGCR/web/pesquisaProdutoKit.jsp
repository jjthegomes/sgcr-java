<%-- 
    Document   : pesquisaProdutoKit
    Created on : 15/10/2017, 11:20:22
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa Produto Kit</title>
    </head>
    <body>
        <h1>Pesquisas Produto Kit</h1>
        <table border="1">
            <tr>
                <th>Id Produto</th>
                <th>Nome Produto</th>
                <th>Valor</th>
                <th>Id Kit</th>
                <th colspan="2">Ação</th>
            </tr>
            
            <c:forEach items="${produtos_kit}" var="produtoKit">
                <tr>
                    <td><c:out value="${produtoKit.id}" /></td>
                    <td><c:out value="${produtoKit.nome}" /></td>
                    <td><c:out value="${produtoKit.valor}" /></td>
                     <td><c:out value="${produtoKit.kitsId}" /></td>
                    <td><a href="ManterProdutoKitController?acao=prepararEditar&id=<c:out value="${produtoKit.id}"/>">Editar</a> </td>
                    <td><a href="ManterProdutoKitController?acao=prepararExcluir&id=<c:out value="${produtoKit.id}"/>">Excluir</a> </td>
                </tr>
            </c:forEach>                    
        </table>
        <form action="ManterProdutoKitController?acao=prepararIncluir" method="post">
            <input type="submit" name="btnIncluir" value="Incluir">
        </form>
    </body>
</html>
