<%-- 
    Document   : manterPercurso
    Created on : Oct 17, 2017, 10:06:38 AM
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Percurso</title>
    </head>
    <body>
        <h1>Manter Percurso - ${operacao}</h1>
        
        <form action="ManterPercursoController?acao=confirmar${operacao}" method="post" name="frmManterPercurso">
            <table>
                <tr>
                    <td>Corrida:</td>
                    <td>
                        <select name="optCorrida" <c:if test="${operacao == 'Excluir'}"> disabled</c:if>>
                            <option value="0" <c:if test="${percurso.corrida.corridaId == null}"> selected</c:if>> Selecione uma corrida</option>  
                            <c:forEach items="${corridas}" var="corrida">
                                <option value="${corrida.id}" <c:if test="${percurso.corridaId == corrida.id}"> selected</c:if>>${corrida.nome}</option>  
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Código do Percurso:</td> 
                    <td><input type="text" name="txtIdPercurso" value="${percurso.id}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Imagem do Percurso:</td>  
                    <td><input type="text" name="fileImagemPercurso" value="${percurso.imagem}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Quilometragem:</td> 
                    <td><input type="number" name="numQuilometragemPercurso" value="${percurso.quilometragem}" step=".1" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                
                <tr>
                    <td>
                        <input type="submit" name="btnConfirmar" value="Confirmar"/>
                    </td>
                </tr>
                <br>
                <tr>
                    <td><a href="index.jsp">Menu</a></td>
                </tr>
                <tr>
                    <td><a href="PesquisaPercursoController">Voltar para pesquisa</a></td>
                </tr>
            </table>
        </form>
    </body>
</html>
