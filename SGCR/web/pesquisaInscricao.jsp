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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa Inscrição</title>
    </head>
    <body>
        <h1>Pesquisa Inscrição</h1>
        <table border="1">
            <tr>
                <th>Id Inscrição</th>
                <th>Data da Compra</th>
                <th>Nº de Peito</th>
                <th>Tempo Percorrido</th>
                <th>Forma de Pagamento</th>
                <th>Pago</th>
                <th>Percurso</th>
                <th>Id Atleta</th>
                <th>Id Kit</th>
                <th colspan="2">Ação</th>
            </tr>
            
            <c:forEach items="${inscricoes}" var="inscricao">
                <tr>
                    <td><c:out value="${inscricao.id}" /></td>
                    <td><c:out value="${inscricao.dataCompra}" /></td>
                    <td><c:out value="${inscricao.numeroPeito}" /></td>
                    <td><c:out value="${inscricao.tempoPercorrido}" /></td>
                    <td><c:out value="${inscricao.formaPagamento}" /></td>
                    <td><c:out value="${inscricao.pago}" /></td>
                    <td><c:out value="${inscricao.percursosId}" /></td>
                    <td><c:out value="${inscricao.atletasId}" /></td>
                    <td><c:out value="${inscricao.kitsId}" /></td>
                    <td><a href="ManterInscricaoController?acao=prepararEditar&id=<c:out value="${inscricao.id}"/>">Editar</a> </td>
                    <td><a href="ManterInscricaoController?acao=prepararExcluir&id=<c:out value="${inscricao.id}"/>">Excluir</a> </td>
                </tr>
            </c:forEach>
        </table>
        <form action="ManterInscricaoController?acao=prepararIncluir" method="post">
            <input type="submit" name="btnIncluir" value="Incluir">
        </form>
    </body>
</html>
