<%-- 
    Document   : manterAdministrador
    Created on : 17/10/2017, 09:29:26
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Administrador</title>
    </head>
    <body>
        <h1>Manter Administrador - ${operacao}</h1>

         <form action="ManterAdministradorController?acao=confirmar${operacao}" method="post" name="frmManterAdministrador"> 
        <!-- onsubmit="return validarFormulario(this)" --> 
            <table>
                <tr>
                    <td>Código do Adm</td> 
                    <td><input type="text" name="txtIdAdministrador" value="${administrador.id}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Nome do Adm</td> 
                    <td><input type="text" name="txtNomeAdministrador" value="${administrador.nome}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Email do Adm</td> 
                    <td><input type="text" name="txtEmailAdministrador" value="${administrador.email}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Senha de Adm</td> 
                    <td><input type="password" name="txtSenhaAdministrador" value="${administrador.senha}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>              
                <tr>
                    <td><input type="submit" name="btnConfirmar" value="Confirmar"></td>
                </tr>
                <br>
                <tr>
                    <td><a href="index.jsp">Menu</a></td>
                </tr>
                <tr>
                    <td><a href="PesquisaAdministradorController">Voltar para pesquisa</a></td>
                </tr>
            </table>
        </form>
    </form>
    </body>
</html>
