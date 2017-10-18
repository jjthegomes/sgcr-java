<%-- 
    Document   : manterRanking
    Created on : 17/10/2017, 09:31:01
    Author     : ariel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Ranking</title>
    </head>
    <body>
        <h1>Manter Ranking - ${operacao}</h1>

        <form action="ManterRankingController?acao=confirmar${operacao}" method="post" name="frmManterRanking" >
            <table>
                <tr>
                    <td>Código do Ranking:</td> 
                    <td><input type="text" name="txtIdRanking" value="${ranking.id}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Nome do Ranking:</td> 
                    <td><input type="text" name="txtNomeRanking" value="${ranking.nomeRanking}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Intervalo Faixa Etaria:</td> 
                    <td><input type="text" name="txtTotalPeriodos" value="${ranking.intervaloFaixaEtaria}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Administrador:</td>
                    <td>
                        <select name="optAdministrador" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                            <option value="0" <c:if test="${ranking.administrador.id == null}"> selected</c:if>> </option>  
                            <c:forEach items="${administradores}" var="administrador">
                                <option value="${administrador.id}" <c:if test="${ranking.administrador.id == administrador.id}"> selected</c:if>>${administrador.id}</option>  
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" name="btnConfirmar" value="Confirmar"></td>
                </tr>
            </table>
        </form>       
    </body>
</html>
