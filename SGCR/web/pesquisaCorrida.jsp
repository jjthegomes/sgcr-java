<%-- 
    Document   : pesquisaAdministrador
    Created on : 12/10/2017, 00:55:23
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <%@ include file = "layout/head.jsp" %>
        <title>Pesquisa de Corrida</title>
    </head>
    <body>
        <%@ include file = "layout/menuOrganizador.jsp" %>

        <div class="container-fluid corpo corpo-adm">
            <h2>Pesquisa Corrida</h2>
            <table class="table table-hover table-responsive">
                <thead>
                    <tr>
                        <th>Codigo</th>
                        <th>Organizador</th>
                        <th>Nome</th>
                        <th>Horario</th>
                        <th>Data</th>
                        <th>Logradouro</th>
                        <th>Bairro</th>

                        <th colspan="2" class="table-action">Ação</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${corridas}" var="corrida">
                        <tr>
                            <td><c:out value="${corrida.id}" /> </td>
                            <td><c:out value="${corrida.organizador.nome}" /> </td>
                            <td><c:out value="${corrida.nome}" /> </td>
                            <td><c:out value="${corrida.horario}" /> </td>
                            <td><c:out value="${corrida.data}" /> </td>
                            <td><c:out value="${corrida.logradouro}" /> </td>
                            <td><c:out value="${corrida.bairro}" /> </td>
                            <td class="table-action"><a href="ManterCorridaController?acao=prepararEditar&id=<c:out value="${corrida.id}"/>" class="btn-primary btn-block btn-xs"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>  Editar</a> </td>
                            <td class="table-action"><a href="ManterCorridaController?acao=prepararExcluir&id=<c:out value="${corrida.id}"/>" class="btn-danger btn-block btn-xs"><i class="fa fa-trash" aria-hidden="true"></i> Excluir</a> </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <form action="ManterCorridaController?acao=prepararIncluir" method="post">
                <button type="submit" class="btn btn-success" name="btnIncluir" value="Incluir"><i class="fa fa-map-marker" aria-hidden="true"></i> Incluir Corrida</button>
            </form>
        </div>
        <%@ include file = "layout/rodape.jsp" %>
    </body>
</html>
