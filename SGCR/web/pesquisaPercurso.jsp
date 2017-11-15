<%-- 
    Document   : pesquisaPercurso
    Created on : Oct 15, 2017, 4:40:19 PM
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa Percurso</title>
    </head>
    <body>
        <h1>Pesquisa Percurso</h1>
        <table border="1">
            <tr>
                <th>Id Percurso</th>
                <th>Imagem Percurso</th>
                <th>Quilometragem</th>
                <th>Id Corrida</th>
                <th colspan="2">Ação</th>
            </tr>
            
            <c:forEach items="${percursos}" var="percurso">
                <tr>
                    <td><c:out value="${percurso.id}" /></td>
                    <td><c:out value="${percurso.imagemPercurso}" /></td>
                    <td><c:out value="${percurso.quilometragem}" /></td>
                    <td><c:out value="${percurso.corridasId}" /></td>
                    <td><a href="ManterPercursoController?acao=prepararEditar&id=<c:out value="${percurso.id}"/>">Editar</a> </td>
                    <td><a href="ManterPercursoController?acao=prepararExcluir&id=<c:out value="${percurso.id}"/>">Excluir</a> </td>
                </tr>
            </c:forEach>
        </table>
        <form action="ManterPercursoController?acao=prepararIncluir" method="post">
            <input type="submit" name="btnIncluir" value="Incluir">
        </form>
        <br>
        <tr>
            <td><a href="index.jsp">Menu</a></td>
        </tr>
    </body>
</html>
