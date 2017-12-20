<%-- 
    Document   : pesquisaInscricao
    Created on : Oct 15, 2017, 4:54:51 PM
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file = "layout/head.jsp" %>
        <title>Pesquisa Inscrição</title>
    </head>
    <body>
        <%@ include file = "layout/menuAdministrador.jsp" %>

        <div class="container-fluid corpo corpo-adm">

            <h2>Pesquisa Inscrição</h2>
            <table class="table table-hover table-responsive">
                <thead>
                    <tr>
                        <th>Atleta</th>
                        <th>Número de Peito</th>
                        <th>Data da Compra</th>
                        <th>Percurso</th>
                        <th>Kit</th>
                        <th colspan="2">Ação</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${inscricoes}" var="inscricao">
                        <tr>
                            <td><c:out value="${inscricao.atleta.nome}" /></td>
                            <td><c:out value="${inscricao.numeroPeito}" /></td>
                            <td><c:out value="${inscricao.dataCompra}" /></td>
                            <td><c:out value="${inscricao.percurso.quilometragem}km" /></td>
                            <td><c:out value="${inscricao.kit.nome}" /></td>
                            <td><a href="ManterInscricaoController?acao=prepararEditar&id=<c:out value="${inscricao.id}"/>&corridaId=<c:out value="${inscricao.kit.corridaId}"/>">Editar</a> </td>
                            <td><a href="ManterInscricaoController?acao=prepararExcluir&id=<c:out value="${inscricao.id}"/>&corridaId=<c:out value="${inscricao.kit.corridaId}"/>">Excluir</a> </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <form action="ManterInscricaoController?acao=escolherCorrida" method="post">
                <!--<button type="submit" class="btn btn-success" name="btnIncluir" value="Incluir"><i class="fa fa-user-plus" aria-hidden="true"></i> Incluir Inscrição</button>-->
            </form>
        </div>
        <%@ include file = "layout/rodape.jsp" %>
    </body>
</html>
