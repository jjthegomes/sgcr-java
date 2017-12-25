<%-- 
    Document   : pesquisaAdministrador
    Created on : 10/10/2017, 08:49:47
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
    <head>

        <%@ include file = "layout/head.jsp" %>
        <title>Pesquisa de Administrador</title>

    </head>
    <body>

        <%@ include file = "layout/menu.jsp" %>

        <div class="container-fluid corpo corpo-adm">
            <h2>Pesquisa Administrador</h2>
            <table class="table table-hover table-responsive">
                <thead>
                    <tr>
                        <th>Codigo</th>
                        <th>Nome</th>
                        <th>Email</th>
                        <th colspan="2" class="table-action">Ação</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${administradores}" var="administrador">
                        <tr>
                            <td><c:out value="${administrador.id}" /> </td>
                            <td><c:out value="${administrador.nome}" /> </td>
                            <td><c:out value="${administrador.email}" /> </td>
                            <td class="table-action"><a href="ManterAdministradorController?acao=prepararEditar&id=<c:out value="${administrador.id}"/>" class="btn-primary btn-block btn-xs"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Editar</a> </td>
                            <td class="table-action"><a href="ManterAdministradorController?acao=prepararExcluir&id=<c:out value="${administrador.id}"/>" class="btn-danger btn-block btn-xs"><i class="fa fa-trash" aria-hidden="true"></i> Excluir</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>            

            <form action="ManterAdministradorController?acao=prepararIncluir" method="post">
                <button type="submit" class="btn btn-success" name="btnIncluir" value="Incluir"><i class="fa fa-user-plus" aria-hidden="true"></i> Incluir Administrador</button>
                <!--<a href="index.jsp" class="btn btn-primary">Menu</a>-->
            </form>
        </div>
        <%@ include file = "layout/rodape.jsp" %>
    </body>

</html>
