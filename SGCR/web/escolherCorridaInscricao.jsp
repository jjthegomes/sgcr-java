<%-- 
    Document   : pesquisaAdministrador
    Created on : 12/10/2017, 00:55:23
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;" charset=UTF-8">
<!--        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Inscrição</title>
        <meta http-equiv="pragma" content="no-cache">
         Bootstrap CSS 
        <link rel="stylesheet" type="text/css" href="public/bootstrap/css/bootstrap.min.css">
         Font Awesome 
        <link rel="stylesheet" type="text/css" href="public/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="public/css/estilo.css">-->
        <title>Corridas</title>
    </head>
    <body>
    
        <h1>Corridas</h1>
    
    <table border="1">
        <tr>
            <th>Codigo</th>
            <th>Nome</th>
            <th>Max. Pessoas</th>
            <th>Horario</th>
            <th>Data</th>
            <th>Rua</th>
            <th>Bairro</th>
            <th>CEP</th>
            <th>Organizador</th>
            <th>Ação</th>
        </tr>
        <c:forEach items="${corridas}" var="corrida">
            <tr>
                <td><c:out value="${corrida.id}" /> </td>
                <td><c:out value="${corrida.nome}" /> </td>
                <td><c:out value="${corrida.maxPessoa}" /> </td>
                <td><c:out value="${corrida.horario}" /> </td>
                <td><c:out value="${corrida.data}" /> </td>
                <td><c:out value="${corrida.logradouro}" /> </td>
                <td><c:out value="${corrida.bairro}" /> </td>
                <td><c:out value="${corrida.cep}" /> </td>
                <td><c:out value="${corrida.organizadorId}" /> </td>
                <td><a href="ManterInscricaoController?acao=prepararIncluir&corridaId=<c:out value="${corrida.id}"/>">Inscrever</a> </td>
            </tr>
        </c:forEach>
    </table>
    <br>
    <a href="index.jsp">Menu</a>

    <!-- Bootstrap JS and jQuery -->
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
<!--    <script type="text/javascript" src="public/bootstrap/js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="public/bootstrap/js/bootstrap.js"></script>-->
    </body>
</html>
