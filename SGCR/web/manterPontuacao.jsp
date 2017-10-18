<%-- 
    Document   : manterPontuacao
    Created on : 17/10/2017, 10:18:46
    Author     : ariel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Pontuação</title>
    </head>
    <body>
        <h1>Manter Pontuação - ${operacao}</h1>

        <form action="ManterPontuacaoController?acao=confirmar${operacao}" method="post" name="frmManterPontuacao" >
            <table>
                <tr>
                    <td>Código do Pontuação:</td> 
                    <td><input type="text" name="txtIdPontuacao" value="${pontuacao.id}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Pontuação</td> 
                    <td><input type="text" name="txtPontuacao" value="${pontuacao.pontuacao}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Corridas:</td>
                    <td>
                        <select name="optPontuacao" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                            <option value="0" <c:if test="${pontuacao.corrida.id == null}"> selected</c:if>> </option>  
                            <c:forEach items="${pontuacoes}" var="pontuacao">
                                <option value="${pontuacao.id}" <c:if test="${pontuacao.corrida.id == pontucao.id}"> selected</c:if>>${pontuacao.id}</option>  
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
