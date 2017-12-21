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
        <%@ include file = "layout/menu.jsp" %>

        <div class="container-fluid corpo corpo-adm">
            <h2>Pesquisas Produto Kit</h2>
            <table class="table table-hover table-responsive">
                <thead>
                    <tr>
                        <th>Codigo</th>
                        <th>Kit</th>
                        <th>Nome Produto</th>
                        <th>Descrição</th>
                        <th>Valor</th>
                        <th colspan="2" class="table-action">Ação</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${produtos_kit}" var="produtoKit">
                        <tr>
                            <td><c:out value="${produtoKit.id}" /></td>
                            <td><c:out value="${produtoKit.kit.nome}" /></td>
                            <td><c:out value="${produtoKit.produto.nome}" /></td>
                            <td><c:out value="${produtoKit.descricao}" /></td>
                            <td><c:out value="${produtoKit.valor}" /></td>                    
                            <td class="table-action"><a href="ManterProdutoKitController?acao=prepararEditar&id=<c:out value="${produtoKit.id}"/>" class="btn-primary btn-block btn-xs"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Editar</a> </td>
                            <td class="table-action"><a href="ManterProdutoKitController?acao=prepararExcluir&id=<c:out value="${produtoKit.id}"/>" class="btn-danger btn-block btn-xs"><i class="fa fa-trash" aria-hidden="true"></i> Excluir</a></td>
                        </tr>
                    </c:forEach> 
                </tbody>
            </table>
            <form action="ManterProdutoKitController?acao=prepararIncluir" method="post">
                <button type="submit" class="btn btn-success" name="btnIncluir" value="Incluir"><i class="fa fa-cubes" aria-hidden="true"></i> Incluir Produto Kit</button>
            </form>
            <br>

        </div>
        <%@ include file = "layout/rodape.jsp" %>
    </body>
</html>
