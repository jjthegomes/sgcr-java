<%-- 
    Document   : manterLote
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
        <title>Manter Lote</title>
    </head>
    <body>

        <h1>Manter Lote - ${operacao}</h1>

        <form action="ManterLoteController?acao=confirmar${operacao}" method="post" name="frmManterLote"> 
            <!-- onsubmit="return validarFormulario(this)" --> 
            <table>
                <tr>
                    <td>Código</td> 
                    <td><input type="text" name="txtIdLote" value="${lote.id}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Tipo</td> 
                        <td><input type="text" name="txtTipoLote" value="${lote.tipo}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Preço</td> 
                        <td><input type="text" name="txtPrecoLote" value="${lote.preco}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Data Inicio</td> 
                        <td><input type="text" name="txtDataInicioLote" value="${lote.dataInicio}" <c:if test="${operacao =='Excluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Data Final</td> 
                        <td><input type="text" name="txtDataFinalLote" value="${lote.dataFinal}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Quantidade</td> 
                        <td><input type="text" name="txtQuantidadeLote" value="${lote.quantidade}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Corrida</td>
                        <td>
                           <select name="optCorrida" <c:if test="${operacao == 'Excluir'}">  </c:if>>
                            <option value="0" <c:if test="${lote.corrida.corridaId == null}"> selected</c:if>> </option>  
                            <c:forEach items="${corridas}" var="corrida">
                                <option value="${corrida.id}" <c:if test="${lote.corridaId == corrida.id}"> selected</c:if>>${corrida.nome}</option>  
                            </c:forEach>
                        </select>
                    </td>
                    <!-- ATENÇAO AO SELECT DAS CHAVES Estrangeira!! -->
                </tr>
                <tr>
                    <td><input type="submit" name="btnConfirmar" value="Confirmar"></td>
                </tr>
                <br>
                <tr>
                    <td><a href="index.jsp">Menu</a></td>
                </tr>
                <tr>
                    <td><a href="PesquisaLoteController">Voltar para pesquisa</a></td>
                </tr>
            </table>
        </form>
    </form>
</body>
</html>
