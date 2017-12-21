<%-- 
    Document   : pesquisaIngresso
    Created on : 12/10/2017, 00:57:43
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <%@ include file = "layout/head.jsp" %>
        <title>Pesquisa de Lote</title>
    </head>
    <body>
        <%@ include file = "layout/menu.jsp" %>
        <div class="container-fluid corpo corpo-adm">

            <h1>Pesquisa Lote</h1>
            <table class="table table-hover table-responsive">
                <thead>
                    <tr>
                        <th>Codigo</th>
                        <th>Corrida</th>           
                        <th>Tipo</th>
                        <th>Preço</th>
                        <th>Data Inicio</th>
                        <th>Data Final</th>
                        <th>Quantidade</th>

                        <th colspan="2" class="table-action">Ação</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${lotes}" var="lote">
                        <tr>
                            <td><c:out value="${lote.id}" /> </td>
                            <td><c:out value="${lote.corrida.nome}" /> </td>                
                            <td><c:out value="${lote.tipo}" /> </td>
                            <td><c:out value="${lote.preco}" /> </td>
                            <td><c:out value="${lote.dataInicio}" /> </td>
                            <td><c:out value="${lote.dataFinal}" /> </td>
                            <td><c:out value="${lote.quantidade}" /> </td>
                            <td class="table-action"><a href="ManterLoteController?acao=prepararEditar&id=<c:out value="${lote.id}"/>" class="btn-primary btn-block btn-xs"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>  Editar</a> </td>
                            <td class="table-action"><a href="ManterLoteController?acao=prepararExcluir&id=<c:out value="${lote.id}"/>" class="btn-danger btn-block btn-xs"><i class="fa fa-trash" aria-hidden="true"></i> Excluir</a> </td>
                        </tr>
                    </c:forEach>
            </table>

            <form action="ManterLoteController?acao=prepararIncluir" method="post">
                <button type="submit" class="btn btn-success" name="btnIncluir" value="Incluir"><i class="fa fa-ticket" aria-hidden="true"></i> Incluir Lote</button>
            </form>
          
            <%@ include file = "layout/rodape.jsp" %>
    </body>
</html>
