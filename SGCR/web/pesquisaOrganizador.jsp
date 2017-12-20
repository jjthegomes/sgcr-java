<%-- 
    Document   : PesquisaOrganizador
    Created on : Oct 15, 2017, 3:08:36 PM
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file = "layout/head.jsp" %>
        <title>Pesquisa de Organizador</title>
    </head>
    <body>
        <%@ include file = "layout/menuAdministrador.jsp" %>

        <div class="container-fluid corpo corpo-adm">
            <h2>Pesquisa Organizador</h2>
            <table class="table table-hover table-responsive">
                <thead>
                    <tr>
                        <th>Código</th>
                        <th>Nome</th>
                        <th>E-mail</th>
                        <th>Sexo</th>
                        <th>Data Nascimento</th>
                        <th>CPF</th>
                        <th colspan="2" class="table-action">Ação</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${organizadores}" var="organizador">
                        <tr>
                            <td><c:out value="${organizador.id}" /> </td>
                            <td><c:out value="${organizador.nome}" /> </td>
                            <td><c:out value="${organizador.email}" /> </td>
                            <td><c:out value="${organizador.sexo}" /> </td>
                            <td><c:out value="${organizador.dataNascimento}" /> </td>
                            <td><c:out value="${organizador.cpf}" /> </td>                   
                            <td class="table-action"><a href="ManterOrganizadorController?acao=prepararEditar&id=<c:out value="${organizador.id}"/>"  class="btn-primary btn-block btn-xs"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Editar</a> </td>
                            <td class="table-action"><a href="ManterOrganizadorController?acao=prepararExcluir&id=<c:out value="${organizador.id}"/>" class="btn-danger btn-block btn-xs"><i class="fa fa-trash" aria-hidden="true"></i> Excluir</a> </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <form action="ManterOrganizadorController?acao=prepararIncluir" method="post">
                <button type="submit" class="btn btn-success" name="btnIncluir" value="Incluir"><i class="fa fa-user-plus" aria-hidden="true"></i> Incluir Organizador</button>
            </form>
        </div>
        <%@ include file = "layout/rodape.jsp" %>
    </body>
</html>
