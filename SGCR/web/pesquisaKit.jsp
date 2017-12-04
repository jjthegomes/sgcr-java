<%-- 
    Document   : pesquisaKit
    Created on : 14/10/2017, 17:10:36
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Pesquisa Kit</title>
        <meta http-equiv="pragma" content="no-cache">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" type="text/css" href="public/bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" type="text/css" href="public/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="public/css/estilo.css">
    </head>
    <body>
        <div class="container">
          <h2>Pesquisa Kit</h2>
          
          <table class="table">
            <thead>
              <tr>
                <th>Código</th>
                <th>Corrida</th>
                <th>Nome</th>
                <th>Data da retirada</th>
                <th>Imagem</th>
                <th>Tipo Chip</th>
                <!-- <th colspan="2" style="text-align: center">Ação</th> -->
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${kits}" var="kit">
                <tr <c:if test="${kit.id == '1'}">class="danger"</c:if>>
                    <td><c:out value="${kit.id}" /></td>
                    <td><c:out value="${kit.corrida.nome}" /></td>
                    <td><c:out value="${kit.nome}" /></td>
                    <td><c:out value="${kit.dataRetirada}" /></td>
                    <td><c:out value="${kit.imagem}" /></td>
                    <td><c:out value="${kit.tipoChip}" /></td>
                    <td><a href="ManterKitController?acao=prepararEditar&id=<c:out value="${kit.id}"/>&corridaId=<c:out value="${kit.corridaId}"/>">Editar</a> </td>
                    <td><a href="ManterKitController?acao=prepararExcluir&id=<c:out value="${kit.id}"/>&corridaId=<c:out value="${kit.corridaId}"/>">Excluir</a> </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
          <form action="ManterKitController?acao=prepararIncluir" method="post">
            <button type="submit" class="btn btn-success" name="btnIncluir" value="Incluir">Incluir</button>
            <a href="index.jsp">Menu</a>
          </form>
        </div>

        <!-- Bootstrap JS and jQuery -->
        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
        <script type="text/javascript" src="public/bootstrap/js/jquery-3.2.1.js"></script>
        <script type="text/javascript" src="public/bootstrap/js/bootstrap.js"></script>
    </body>
</html>
