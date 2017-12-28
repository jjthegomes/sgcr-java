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
        <%@ include file = "layout/head.jsp" %>
        <title>Pesquisa Kit</title>
    </head>
    <body>
        <%@ include file = "layout/menu.jsp" %>

        <div class="container-fluid corpo corpo-adm">
            <h2>Pesquisa Kit</h2>

            <table class="table table-hover table-responsive">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Período de retirada</th>
                        <th>Tipo Chip</th>
                        <th colspan="2" class="table-action">Ação</th> 
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${kits}" var="kit">
                        <tr>
                            <td><c:out value="${kit.nome}" /></td>
                            <td><c:out value="${kit.dataInicioRetirada}" /> - <c:out value="${kit.dataFinalRetirada}" /></td>
                            <td><c:out value="${kit.tipoChip}" /></td>
                            <td class="table-action">
                                <a href="ManterKitController?acao=prepararEditar&id=<c:out value="${kit.id}"/>" class="btn btn-primary btn-block btn-xs">
                                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Editar
                                </a> 
                            </td>
                            <td class="table-action">
                                <a href="ManterKitController?acao=prepararExcluir&id=<c:out value="${kit.id}"/>" class="btn btn-danger btn-block btn-xs">
                                    <i class="fa fa-trash" aria-hidden="true"></i> Excluir
                                </a> 
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <form action="ManterKitController?acao=prepararIncluir" method="post">
                <button type="submit" class="btn btn-success" name="btnIncluir" value="Incluir"><i class="fa fa-shopping-bag" aria-hidden="true"></i> Incluir Kit</button>
            </form>
        </div>

        <%@ include file = "layout/rodape.jsp" %>
    </body>
</html>
