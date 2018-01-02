<%-- 
    Document   : manterPagamento
    Created on : 04/12/2017, 15:57:28
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html><html>
    <head>
    <head>
        <%@ include file = "layout/head.jsp" %>
        <title>Pesquisa de Pagamento</title>
    </head>
    <body>
        <%@ include file = "layout/menu.jsp" %>
        <div class="container-fluid corpo corpo-adm">
            <h2>Pesquisa Pagamento</h2>
            <table class="table table-hover table-responsive">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Email</th>
                        <th>CPF</th>
                        <th>Valor</th>
                    </tr>
                </thead>
                <tbody>

                <form action="ManterPagamentoController?acao=prepararPagamento&id=<c:out value="${inscricao.id}"/>&corridaId=<c:out value="${inscricao.lote.corridaId}"/>" method="post">
                    <c:forEach items="${inscricoes}" var="inscricao">
                        <tr <c:if test="${inscricao.pago == false}"> class="danger" </c:if>>
                            <td><c:out value="${inscricao.atleta.nome}" /></td>
                            <td><c:out value="${inscricao.atleta.email}" /></td>
                            <td><c:out value="${inscricao.atleta.cpf}" /></td>
                            <td><c:out value="${inscricao.lote.preco}" /></td>

                        </tr>
                    </c:forEach>
                </form>

                </tbody>
            </table>
            <form action="ManterPagamentoController?acao=escolherCorrida" method="post">
                <button type="submit" class="btn btn-success" name="btnIncluir" value="Incluir"><i class="fa fa-credit-card" aria-hidden="true"></i> Manter Pagamento</button>
            </form>
            <br>
        </div>
        <%@ include file = "layout/rodape.jsp" %>
    </body>
</html>
