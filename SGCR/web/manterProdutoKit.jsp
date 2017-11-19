<%-- 
    Document   : manterProdutoKit
    Created on : 17/10/2017, 10:02:00
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Produto Kit</title>
    </head>
    <body>
        <h1>Manter Produto Kit - ${operacao}</h1>

        <form action="ManterProdutoKitController?acao=confirmar${operacao}" method="post" name="frmManterProdutoKit" >
            <table>
                <tr>
                    <td>Código</td> 
                    <td><input type="text" name="txtIdProduto" value="${produtoKit.id}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Descrição</td> 
                    <td><input type="text" name="txtDescricao" value="${produtoKit.descricao}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Valor:</td> 
                    <td><input type="text" name="txtProdutoValor" value="${produtoKit.valor}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Kits:</td>
                    <td>
                        <select name="optKit" <c:if test="${operacao == 'Excluir'}">readonly</c:if>>
                            <option value="0" <c:if test="${produtoKit.kit.id == null}"> selected</c:if>> </option>  
                            <c:forEach items="${kits}" var="kit">
                                <option value="${kit.id}" <c:if test="${produtoKit.kitId == kit.id}"> selected</c:if>>${kit.nome}</option>  
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Produtos:</td>
                    <td>
                        <select name="optProduto" <c:if test="${operacao == 'Excluir'}">readonly</c:if>>
                            <option value="0" <c:if test="${produtoKit.produto.id == null}"> selected</c:if>> </option>  
                            <c:forEach items="${produtos}" var="produto">
                                <option value="${produto.id}" <c:if test="${produtoKit.produtoId == produto.id}"> selected</c:if>>${produto.nome}</option>  
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Corridas:</td>
                    <td>
                        <select name="optCorrida" <c:if test="${operacao == 'Excluir'}">readonly</c:if>>
                            <option value="0" <c:if test="${produtoKit.corrida.id == null}"> selected</c:if>> </option>  
                            <c:forEach items="${corridass}" var="corrida">
                                <option value="${corrida.id}" <c:if test="${produtoKit.corridaId == corrida.id}"> selected</c:if>>${corrida.nome}</option>  
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
