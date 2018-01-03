<%-- 
    Document   : manterPagamento
    Created on : 04/12/2017, 15:57:28
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file = "layout/head.jsp" %>
        <title>Gerenciar Pagamento</title>
    </head>
    <body>
        <%@ include file = "layout/menu.jsp" %>

        <div class="container-fluid corpo corpo-adm">
            <ul class="breadcrumb">
                <li><a href="dashboard.jsp">Dashboard</a></li>
                <li><a href="ManterPagamentoController?acao=escolherCorrida">Manter Pagamento</a></li>
                <li class="active">${corrida.nome}</li> 
            </ul>
            <center> <h2>Manter Pagamento</h2></center>

            <table class="table table-hover table-responsive">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Email</th>
                        <th>CPF</th>
                        <th class="table-action">Ação</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${inscricoes}" var="inscricao">
                        <tr <c:if test="${inscricao.pago == false}"> class="danger" </c:if>>
                            <td><c:out value="${inscricao.atleta.nome}" /></td>
                            <td><c:out value="${inscricao.atleta.email}" /></td>
                            <td><c:out value="${inscricao.atleta.cpf}" /></td>
                            <td class="table-action">
                                <a class="btn btn-success btn-xs" href="ManterPagamentoController?acao=confirmarPagamento&id=<c:out value="${inscricao.id}"/>">
                                    Pagar 
                                </a>
                            </td>                      
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!--            <form action="ManterPagamentoController?acao=escolherCorrida" method="post">
                            <button type="submit" name="btnIncluir">Manter Pagamento</button>
                        </form>-->
        </div>

        <%@ include file = "layout/rodape.jsp" %>
    </body>
</html>
