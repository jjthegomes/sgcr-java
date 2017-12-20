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
        <div class="container-fluid corpo corpo-adm">
            <h1>Pesquisa Produto</h1>
            <table class="table table-hover table-responsive">
                <thead>
                    <tr>
                        <th>Código</th>
                        <th>Administrador</th>
                        <th>Nome</th>
                        <th colspan="2" class="table-action">Ação</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${produtos}" var="produto">
                        <tr>
                            <td><c:out value="${produto.id}" /></td>
                            <td><c:out value="${produto.administrador.nome}" /></td>
                            <td><c:out value="${produto.nome}" /></td>                    
                            <td class="table-action"><a href="ManterProdutoController?acao=prepararEditar&id=<c:out value="${produto.id}"/>" class="btn-primary btn-block btn-xs"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>  Editar</a> </td>
                            <td class="table-action"><a href="ManterProdutoController?acao=prepararExcluir&id=<c:out value="${produto.id}"/>" class="btn-danger btn-block btn-xs"><i class="fa fa-trash" aria-hidden="true"></i> Excluir</a> </td>
                        </tr>
                    </c:forEach> 
                </tbody>
            </table>
            <form action="ManterProdutoController?acao=prepararIncluir" method="post">
                <button type="submit" class="btn btn-success" name="btnIncluir" value="Incluir"><i class="fa fa-cube" aria-hidden="true"></i> Incluir Produto</button>
            </form>
        </div>
        <%@ include file = "layout/rodape.jsp" %>
    </body>
</html>
