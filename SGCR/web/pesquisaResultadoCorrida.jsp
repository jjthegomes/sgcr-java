<%-- 
    Document   : pesquisaResultadoCorrida
    Created on : 05/12/2017, 00:40:20
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <%@ include file = "layout/head.jsp" %>
        <title>Pesquisa Resultado Corridas</title>
    </head>
    <body>
        
        <%@ include file = "layout/menu.jsp" %>
        <div class="container">
            <h2>Pesquisa Resultado Corridas</h2>

            <table class="table">
                <thead>
                    <tr>
                        <th>Código</th>
                        <th>Nome</th>
                        <th>Email</th>
                        <th>CPF</th>
                        <th>Tempo Largada</th>
                        <th>Tempo Chegada</th>
                    </tr>
                </thead>
                <tbody>
                <form action="ManterResultadoCorridaController?acao=prepararIncluir&id=<c:out value='${inscricao.id}'/>&corridaId=<c:out value='${inscricao.lote.corridaId}'/>" method="post">
                    <c:forEach items="${inscricoes}" var="inscricao">
                        <tr <c:if test="${inscricao.tempoChegada == '00:00:00'}"> class="danger" </c:if>>
                            <td><c:out value="${inscricao.id}" /></td>    
                            <td><c:out value="${inscricao.atleta.nome}" /></td>
                            <td><c:out value="${inscricao.atleta.email}" /></td>
                            <td><c:out value="${inscricao.atleta.cpf}" /></td>
                            <td><c:out value="${inscricao.tempoLargada}" /></td>
                            <td><c:out value="${inscricao.tempoChegada}" /></td>
                        </tr>
                    </c:forEach>
                </form>

                </tbody>
            </table>

            <form action="ManterResultadoCorridaController?acao=escolherCorrida" method="post">
                <button type="submit" class="btn btn-success" name="btnIncluir" value="Incluir">Manter Resultado Corrida</button>
            <a href="index.jsp" class="btn btn-primary">Menu</a>
            </form>
        </div>
        <%@ include file = "layout/rodape.jsp" %>
    </body>
</html>
