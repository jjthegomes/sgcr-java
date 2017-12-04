<%-- 
    Document   : pesquisaProduto
    Created on : 18/11/2017, 17:59:08
    Author     : ariel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file = "layout/head.jsp" %>
        <title>Pesquisa Produto</title>
    </head>
    <body>
        <%@ include file = "layout/menuAdministrador.jsp" %>
        
        <h1>Pesquisa Produto</h1>
        <table border="1">
            <tr>
                <th>Código</th>
                <th>Administrador</th>
                <th>Nome</th>
                <th colspan="2">Ação</th>
            </tr>

            <c:forEach items="${produtos}" var="produto">
                <tr>
                    <td><c:out value="${produto.id}" /></td>
                    <td><c:out value="${produto.administrador.nome}" /></td>
                    <td><c:out value="${produto.nome}" /></td>                    
                    <td><a href="ManterProdutoController?acao=prepararEditar&id=<c:out value="${produto.id}"/>">Editar</a> </td>
                    <td><a href="ManterProdutoController?acao=prepararExcluir&id=<c:out value="${produto.id}"/>">Excluir</a> </td>
                </tr>
            </c:forEach> 
        </table>
        <form action="ManterProdutoController?acao=prepararIncluir" method="post">
            <input type="submit" name="btnIncluir" value="Incluir">
        </form>
        <br>
        <a href="index.jsp">Menu</a>
        <%@ include file = "layout/rodape.jsp" %>
    </body>
</html>
