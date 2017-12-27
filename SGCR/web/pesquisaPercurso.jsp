<%-- 
    Document   : pesquisaPercurso
    Created on : Oct 15, 2017, 4:40:19 PM
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <%@ include file = "layout/head.jsp" %>
        <title>Pesquisa Percurso</title>
    </head>
    <body>
        <%@ include file = "layout/menu.jsp" %>

        <div class="container-fluid corpo corpo-adm">

            <h2>Pesquisa Percurso</h2>
            <table class="table table-hover table-responsive">
                <thead>
                    <tr>
                        <th>Código</th>
                        <th>Imagem</th>
                        <th>Descrição</th>
                        <th>Quilometragem</th>
                        <th colspan="2" class="table-action">Ação</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${percursos}" var="percurso">
                        <tr>
                            <td><c:out value="${percurso.id}" /></td>
                            <td><c:out value="${percurso.imagem}" /></td>
                            <td><c:out value="${percurso.descricao}" /></td>
                            <td><c:out value="${percurso.quilometragem}" /></td>
                            <td class="table-action"><a href="ManterPercursoController?acao=prepararEditar&id=<c:out value="${percurso.id}"/>" class="btn-primary btn-block btn-xs"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Editar</a> </td>
                            <td class="table-action"><a href="ManterPercursoController?acao=prepararExcluir&id=<c:out value="${percurso.id}"/>" class="btn-danger btn-block btn-xs"><i class="fa fa-trash" aria-hidden="true"></i> Excluir</a> </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <form action="ManterPercursoController?acao=prepararIncluir" method="post">
                <button type="submit" class="btn btn-success" name="btnIncluir" value="Incluir"><i class="fa fa-map" aria-hidden="true"></i> Incluir Percurso</button>
            </form>
            <br>
        </div>
        <%@ include file = "layout/rodape.jsp" %>
    </body>
</html>
