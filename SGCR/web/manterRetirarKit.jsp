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
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Gerenciar Retirar Kit</title>
        <meta http-equiv="pragma" content="no-cache">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" type="text/css" href="public/bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" type="text/css" href="public/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="public/css/estilo.css">
    </head>
    <body>
        <div class="container">
            <h1>Manter Retirar Kit</h1>

            <table class="table">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Email</th>
                        <th>CPF</th>
                        <th>Nome Kit</th>
                        <th>Ação</th>
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
                            <td><a style="text-decoration: none" href="ManterRetirarKitController?acao=confirmarRetirarKit&id=<c:out value="${inscricao.id}"/>">
                            <button class="btn btn-success">Retirar Kit</button> 
                                </a></td>                      
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <form action="ManterRetirarKitController?acao=escolherCorrida" method="post">
                <button type="submit" name="btnIncluir">Manter Retirar Kit</button>
            </form>
            <a href="index.jsp">Menu</a>
        </div>

        <!-- Bootstrap JS and jQuery -->
        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
        <script type="text/javascript" src="public/bootstrap/js/jquery-3.2.1.js"></script>
        <script type="text/javascript" src="public/bootstrap/js/bootstrap.js"></script>
    </body>
</html>
