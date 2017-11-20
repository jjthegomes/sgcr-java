<%-- 
    Document   : manterProduto
    Created on : 18/11/2017, 17:19:03
    Author     : ariel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Produto</title>
    </head>
    <body>
        <h1>Manter Produto - ${operacao}</h1>

        <form action="ManterProdutoController?acao=confirmar${operacao}" method="post" name="frmManterProduto" >
            <table>
                <tr>
                    <td>Código</td> 
                    <td><input type="text" name="txtIdProduto" value="${produto.id}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Nome</td> 
                        <td><input type="text" name="txtNome" value="${produto.nome}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Administrador:</td>
                        <td>
                            <select name="optAdministrador" <c:if test="${operacao == 'Excluir'}"> disabled</c:if>>
                            <option value="0" <c:if test="${produto.administrador.id == null}"> selected</c:if>> </option>  
                            <c:forEach items="${administradores}" var="administrador">
                                <option value="${administrador.id}" <c:if test="${produto.administradorId == administrador.id}"> selected</c:if>>${administrador.nome}</option>  
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" name="btnConfirmar" value="Confirmar"></td>
                </tr>
                <br>
                <tr>
                    <td><a href="index.jsp">Menu</a></td>
                </tr>
                <tr>
                    <td><a href="PesquisaOrganizadorController">Voltar para pesquisa</a></td>
                </tr>
            </table>
        </form>       
    </body>
</html>
