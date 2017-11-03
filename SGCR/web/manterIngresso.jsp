<%-- 
    Document   : manterIngresso
    Created on : 17/10/2017, 10:26:14
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Ingresso</title>
    </head>
    <body>

        <h1>Manter Ingressos - ${operacao}</h1>

        <form action="ManterIngressoController?acao=confirmar${operacao}" method="post" name="frmManterIngresso"> 
            <!-- onsubmit="return validarFormulario(this)" --> 
            <table>
                <tr>
                    <td>Código do Ingresso</td> 
                    <td><input type="text" name="txtIdIngresso" value="${ingresso.id}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Tipo do Ingresso</td> 
                        <td><input type="text" name="txtTipoIngresso" value="${ingresso.tipo}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Preço do Ingresso</td> 
                        <td><input type="text" name="txtPrecoIngresso" value="${ingresso.preco}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Data Inicio do Ingresso</td> 
                        <td><input type="text" name="txtDataInicioIngresso" value="${ingresso.dataInicioIngresso}" <c:if test="${operacao =='Excluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Data Final do Ingresso</td> 
                        <td><input type="text" name="txtDataFinalIngresso" value="${ingresso.dataFinalIngresso}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Quantidade do Ingresso</td> 
                        <td><input type="text" name="txtQuantidadeIngresso" value="${ingresso.quantidade}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Corrida</td>
                        <td>
                            <select name="optCorrida" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                            <option value="0" <c:if test="${ingresso.corrida.id== null}"> selected</c:if>>Selecione uma Corrida </option>  
                            <c:forEach items="${corridas}" var="corrida">
                                <option value="${corrida.id}" <c:if test="${ingresso.corrida.id == corrida.id}"> selected </c:if>>${corrida.nomeCorrida}</option>  
                            </c:forEach>
                        </select>
                    </td>
                    <!-- ATENÇAO AO SELECT DAS CHAVES Estrangeira!! -->
                </tr>
                <tr>
                    <td><input type="submit" name="btnConfirmar" value="Confirmar"></td>
                </tr>
            </table>
        </form>
    </form>
</body>
</html>
