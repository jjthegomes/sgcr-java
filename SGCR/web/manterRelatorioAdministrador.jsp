<%-- 
    Document   : manterRelatorioAdministrador
    Created on : 27/03/2018, 08:31:45
    Author     : ariel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>

        <%@ include file = "layout/head.jsp" %>
        <title>Manter Ranking</title>

    </head>

    <body>

        <%@ include file = "layout/menu.jsp" %>

        <div class="container-fluid corpo corpo-adm">
            <h2>Corridas Por Organizador</h2>

            <form action="RelatorioController?acao=gerarRelatorioCorridasPorOrganizador" method="post">
                <select class="form-control pagamentoCartaoCredito"  name="organizadorId" required <c:if test="${operacao == 'Excluir'}"> disabled</c:if>>
                        <option hidden option="">Organizador</option>
                    <c:forEach items="${organizadores}" var="organizador">  
                        <option value="${organizador.id}">${organizador.nome}</option>
                    </c:forEach>
                </select>

                <button type="submit" class="btn btn-success">Gerar</button>
            </form>
        </div>
        <%@ include file = "layout/rodape.jsp" %>
    </body>
</html>
