<%-- 
    Document   : pesquisaRetirarKit
    Created on : 04/12/2017, 23:46:46
    Author     : RAJ
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html><html>
    <head>
        <%@ include file = "layout/head.jsp" %>
        <title>Pesquisa Retirar Kit</title>
    </head>
    <body>
        <%@ include file = "layout/menu.jsp" %>
        
        <div class="container">
            <h2>Pesquisa Retirar Kit</h2>

            <table class="table">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Email</th>
                        <th>CPF</th>
                        <th>Nome Kit</th>
                    </tr>
                </thead>
                <tbody>
                <form action="ManterRetirarKitController?acao=prepararRetirarKit&id=<c:out value="${inscricao.id}"/>&corridaId=<c:out value="${inscricao.lote.corridaId}"/>" method="post">
                    <c:forEach items="${inscricoes}" var="inscricao">
                        <tr <c:if test="${inscricao.pago == false}"> class="danger" </c:if>>
                            <td><c:out value="${inscricao.atleta.nome}" /></td>
                            <td><c:out value="${inscricao.atleta.email}" /></td>
                            <td><c:out value="${inscricao.atleta.cpf}" /></td>
                            <td><c:out value="${inscricao.kit.nome}" /></td>               
                        </tr>
                    </c:forEach>
                </form>

                </tbody>
            </table>

            <form action="ManterRetirarKitController?acao=escolherCorrida" method="post">
                <button type="submit" name="btnIncluir">Manter Retirar Kit</button>
            </form>
            <a href="index.jsp">Menu</a>
        </div>

        <%@ include file = "layout/rodape.jsp" %>
    </body>
</html>