<%-- 
    Document   : manterRetirarKit
    Created on : 04/12/2017, 23:30:39
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html><html>
    <head>
        <%@ include file = "layout/head.jsp" %>
        <title>Gerenciar Retirar Kit</title>
    </head>
    <body>

        <%@ include file = "layout/menu.jsp" %>

        <div class="container-fluid corpo corpo-adm">
            <ul class="breadcrumb">
                <li><a href="PesquisaHomeController">Dashboard</a></li>
                <li><a href="ManterRetirarKitController?acao=escolherCorrida">Manter Retirada Kit</a></li>
                <li class="active">${corrida.nome}</li> 
            </ul>
            <h2>Manter Retirada Kit - ${corrida.nome}</h2>

            <table class="table table-hover table-responsive">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Email</th>
                        <th>CPF</th>
                        <th>Nome Kit</th>
                        <th class="table-action">Ação</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${inscricoes}" var="inscricao">
                        <tr <c:if test="${inscricao.pago == false}"> class="danger" </c:if>>
                            <td class="hidden" name="txtId"><c:out value="${inscricao.id}" /></td>
                            <td><c:out value="${inscricao.atleta.nome}" /></td>
                            <td><c:out value="${inscricao.atleta.email}" /></td>
                            <td><c:out value="${inscricao.atleta.cpf}" /></td>
                            <td><c:out value="${inscricao.kit.nome}" /></td>
                            <td class="table-action"><a style="text-decoration: none" href="ManterRetirarKitController?acao=confirmarRetirarKit&id=<c:out value="${inscricao.id}"/>">
                                    <button class="btn btn-success btn-xs">Retirar Kit</button> 
                                </a></td>                      
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!--            <form action="ManterRetirarKitController?acao=escolherCorrida" method="post">
                            <button type="submit" name="btnIncluir" class="btn btn-success">Manter Retirar Kit</button>
                        </form>-->
        </div>

        <%@ include file = "layout/rodape.jsp" %>
    </body>
</html>
