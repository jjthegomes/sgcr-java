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
            <h2>Relatório</h2>

            <table class="table table-hover table-responsive">
                <thead>
                    <tr>
                        <th>Relatório</th>
                        <th class="table-action">Ação</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Organizadores</td>
                        <td colspan="2" style='text-align: right' >
                            <form action="RelatorioController?acao=gerarRelatorioOrganizadores" method="post">
                                <button type="submit" class="btn btn-primary btn-xs" style="width: 100px;">Gerar</button>
                            </form>
                        </td>
                    </tr>

                    <tr>
                        <td>Corridas por Organizadores</td>
                        <td style='text-align: right'>
                            <a class="btn btn-primary btn-xs" href="RelatorioController?acao=prepararRelatorioCorridasPorOrganizadores">Gerar</a>
                        </td>
                    </tr>

                </tbody>
            </table>            
        </div>
        <%@ include file = "layout/rodape.jsp" %>
    </body>
</html>
