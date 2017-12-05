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
        <%@ include file = "layout/head.jsp" %>
        <title>Pesquisa Produto Kit</title>
    </head>
    <body>
        <%@ include file = "layout/menuOrganizador.jsp" %>
        
        <h1>Pesquisas Produto Kit</h1>
        <table border="1">
            <tr>
                <th>Codigo</th>
                <th>Kit</th>
                <th>Nome Produto</th>
                <th>Descrição</th>
                <th>Valor</th>
                <th colspan="2">Ação</th>
            </tr>

            <c:forEach items="${produtos_kit}" var="produtoKit">
                <tr>
                    <td><c:out value="${produtoKit.id}" /></td>
                    <td><c:out value="${produtoKit.kit.nome}" /></td>
                    <td><c:out value="${produtoKit.produto.nome}" /></td>
                    <td><c:out value="${produtoKit.descricao}" /></td>
                    <td><c:out value="${produtoKit.valor}" /></td>                    
                    <td><a href="ManterProdutoKitController?acao=prepararEditar&id=<c:out value="${produtoKit.id}"/>">Editar</a> </td>
                    <td><a href="ManterProdutoKitController?acao=prepararExcluir&id=<c:out value="${produtoKit.id}"/>">Excluir</a> </td>
                </tr>
            </c:forEach> 
        </table>
        <form action="ManterProdutoKitController?acao=prepararIncluir" method="post">
            <input type="submit" name="btnIncluir" value="Incluir">
        </form>
        <br>
        <a href="index.jsp">Menu</a>]
        <%@ include file = "layout/rodape.jsp" %>
    </body>
</html>
