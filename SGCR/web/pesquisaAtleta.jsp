<%-- 
    Document   : pesquisaAdministrador
    Created on : 10/10/2017, 08:49:47
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa de Atleta</title>
    </head>
    <body>
        <h1>Pesquisa Atleta</h1>
    </body>
    <table border="1">
        <tr>
            <th>Codigo</th>
            <th>Nome</th>
            <th>E-mail</th>
            <th>Data Nascimento</th>        
            <th>Tamanho Camisa</th>
            <th>Celular</th>
            <th colspan="2">Ação</th>
        </tr>
        <c:forEach items="${atletas}" var="atleta">
            <tr>
                <td><c:out value="${atleta.id}" /> </td>
                <td><c:out value="${atleta.nome}" /> </td>
                <td><c:out value="${atleta.email}" /> </td>        
                <td><c:out value="${atleta.dataNascimento}" /> </td>
                <td> <c:out value="${atleta.tamanhoCamisa}" /> </td>
                <td> <c:out value="${atleta.celular}" /> </td>

                <td><a href="ManterAtletaController?acao=prepararEditar&id=<c:out value="${atleta.id}"/>">Editar</a> </td>
                <td><a href="ManterAtletaController?acao=prepararExcluir&id=<c:out value="${atleta.id}"/>">Excluir</a> </td>
            </tr>
        </c:forEach>
    </table>

    <form action="ManterAtletaController?acao=prepararIncluir" method="post">
        <input type="submit" name="btnIncluir" value="Incluir">
    </form>
    <br>
    <tr>
        <td><a href="index.jsp">Menu</a></td>
    </tr>
</html>
