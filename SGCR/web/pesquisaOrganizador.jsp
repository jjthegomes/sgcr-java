<%-- 
    Document   : PesquisaOrganizador
    Created on : Oct 15, 2017, 3:08:36 PM
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file = "layout/head.jsp" %>
        <title>Pesquisa de Organizador</title>
    </head>
    <body>
        <%@ include file = "layout/menuAdministrador.jsp" %>
        
        <h1>Pesquisa Organizador</h1>
        <table border="1">
            <tr>
                <th>Código</th>
                <th>Nome</th>
                <th>E-mail</th>
                <th>Sexo</th>
                <th>Data Nascimento</th>
                <th>CPF</th>
                
                <th colspan="2">Ação</th>
            </tr>
            <c:forEach items="${organizadores}" var="organizador">
                <tr>
                    <td><c:out value="${organizador.id}" /> </td>
                    <td><c:out value="${organizador.nome}" /> </td>
                    <td><c:out value="${organizador.email}" /> </td>
                    <td><c:out value="${organizador.sexo}" /> </td>
                    <td><c:out value="${organizador.dataNascimento}" /> </td>
                    <td><c:out value="${organizador.cpf}" /> </td>                   
                    <td><a href="ManterOrganizadorController?acao=prepararEditar&id=<c:out value="${organizador.id}"/>">Editar</a> </td>
                    <td><a href="ManterOrganizadorController?acao=prepararExcluir&id=<c:out value="${organizador.id}"/>">Excluir</a> </td>
                </tr>
            </c:forEach>
        </table>

        <form action="ManterOrganizadorController?acao=prepararIncluir" method="post">
            <input type="submit" name="btnIncluir" value="Incluir">
        </form>
        <br>
        <a href="index.jsp">Menu</a>
        <%@ include file = "layout/rodape.jsp" %>
    </body>
</html>
