<%-- 
    Document   : manterKit
    Created on : Oct 17, 2017, 9:30:45 AM
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Kit</title>
    </head>
    <body>
        <h1>Manter Kit - ${operacao}</h1>
        
        <form action="ManterKitController?acao=confirmar${operacao}" method="post" name="frmManterKit">
            <table>
                <tr>
                    <td>Código do kit:</td> 
                    <td><input type="text" name="txtIdKit" value="${kit.id}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Nome do kit:</td> 
                    <td><input type="text" name="txtNomeKit" value="${kit.nome}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Imagem do kit:</td>  
                    <td><input type="file" name="fileImagemKit" value="${kit.imagemKit}" accept="image/*" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr> 
                    <td>Tipo do Chip:</td> 
                    <td>
                        <select name="optTipoChip" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                            <option value="Descartável" <c:if test="${kit.tipoChip == 'Descartável'}"> selected</c:if>>Descartável</option>
                            <option value="Retornável" <c:if test="${kit.tipoChip == 'Retornável'}"> selected</c:if>>Retornável</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Corrida:</td>
                    <td>
                        <select name="optCorrida" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                            <option value="0" <c:if test="${kit.corrida.id == null}"> selected</c:if>> </option>  
                            <c:forEach items="${corridas}" var="corrida">
                                <option value="${corrida.id}" <c:if test="${kit.corrida.id == corrida.id}"> selected</c:if>>${corrida.nomeCorrida}</option>  
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" name="btnConfirmar" value="Confirmar"/>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
