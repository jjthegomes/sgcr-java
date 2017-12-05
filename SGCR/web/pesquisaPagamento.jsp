<%-- 
    Document   : manterPagamento
    Created on : 04/12/2017, 15:57:28
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html><html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Pesquisa Pagamento</title>
        <meta http-equiv="pragma" content="no-cache">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" type="text/css" href="public/bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" type="text/css" href="public/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="public/css/estilo.css">
    </head>
    <body>
        <div class="container">
            <h2>Pesquisa Pagamento</h2>

            <table class="table">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Email</th>
                        <th>CPF</th>
                        <th>Valor</th>
                    </tr>
                </thead>
                <tbody>
                <form action="ManterPagamentoController?acao=prepararPagamento&id=<c:out value="${inscricao.id}"/>&corridaId=<c:out value="${inscricao.lote.corridaId}"/>" method="post">
                    <c:forEach items="${inscricoes}" var="inscricao">
                        <tr <c:if test="${inscricao.pago == false}"> class="danger" </c:if>>
                            <td><c:out value="${inscricao.atleta.nome}" /></td>
                            <td><c:out value="${inscricao.atleta.email}" /></td>
                            <td><c:out value="${inscricao.atleta.cpf}" /></td>
                            <td><c:out value="${inscricao.lote.preco}" /></td>
                        </tr>
                    </c:forEach>
                </form>

                </tbody>
            </table>

            <form action="ManterPagamentoController?acao=escolherCorrida" method="post">
                <button type="submit" name="btnIncluir">Manter Pagamento</button>
            </form>
            <a href="index.jsp">Menu</a>
        </div>

        <!-- Bootstrap JS and jQuery -->
        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
        <script type="text/javascript" src="public/bootstrap/js/jquery-3.2.1.js"></script>
        <script type="text/javascript" src="public/bootstrap/js/bootstrap.js"></script>
    </body>
</html>
