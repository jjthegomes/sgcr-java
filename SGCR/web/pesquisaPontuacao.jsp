<%-- 
    Document   : pesquisaPontuacao
    Created on : 15/10/2017, 02:11:50
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    
     <head>
        <%@ include file = "layout/head.jsp" %>
        <title>Pesquisa de Pontuação</title>
    </head>
    <body>
        <%@ include file = "layout/menuOrganizador.jsp" %>

        <div class="container-fluid corpo corpo-adm">
            <h2>Pesquisa Pontuação</h2>
            <table class="table table-hover table-responsive">
                <thead>
                    <tr>
                         <th>Id Pontuação</th>
                <th>Ranking</th>
                <th>Pontuação</th>


                        <th colspan="2" class="table-action">Ação</th>
                    </tr>
                </thead>
                <tbody>
                   
            <c:forEach items="${pontuacoes}" var="pontuacao">
                <tr>
                    <td><c:out value="${pontuacao.id}" /></td>
                    <td><c:out value="${pontuacao.ranking.nome}" /></td>
                    <td><c:out value="${pontuacao.pontuacao}" /></td>
                    <td><a href="ManterPontuacaoController?acao=prepararEditar&id=<c:out value="${pontuacao.id}"/>">Editar</a> </td>
                    <td><a href="ManterPontuacaoController?acao=prepararExcluir&id=<c:out value="${pontuacao.id}"/>">Excluir</a> </td>
                </tr>
            </c:forEach>  
                </tbody>
        </table>
        <form action="ManterPontuacaoController?acao=prepararIncluir" method="post">
            <input type="submit" name="btnIncluir" value="Incluir">
        </form>
        <br>
        <%@ include file = "layout/rodape.jsp" %>
    </body>
</html>
