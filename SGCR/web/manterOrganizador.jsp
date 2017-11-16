<%-- 
    Document   : manterOrganizador
    Created on : Oct 17, 2017, 10:14:45 AM
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Organizador</title>
    </head>
    <body>
        <h1>Manter Organizador - ${operacao}</h1>
        
        <form action="ManterOrganizadorController?acao=confirmar${operacao}" method="post" name="frmManterOrganizador">
            <table>
                <tr>
                    <td>Codigo do Organizador:</td> 
                    <td><input type="text" name="txtIdOrganizador" value="${organizador.id}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Nome do Organizador:</td> 
                    <td><input type="text" name="txtNomeOrganizador" value="${organizador.nome}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                
                <!-- Alterar o tipo da data posteriormente para selects -->
                <tr>
                    <td>Data de Nascimento:</td> 
                    <td><input type="text" name="txtDataNascimentoOrganizador" value="${organizador.dataNascimento}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr> 
                    <td>Sexo:</td> 
                    <td>
                        <select name="optSexo" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                            <option value="M" <c:if test="${organizador.sexo == 'M'}"> selected</c:if>>Masculino</option>
                            <option value="F" <c:if test="${organizador.sexo == 'F'}"> selected</c:if>>Feminino</option>
                            <option value="O" <c:if test="${organizador.sexo == 'O'}"> selected</c:if>>Outro</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>CPF:</td> 
                    <td><input type="text" name="txtCpfOrganizador" value="${organizador.cpf}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>CEP:</td> 
                    <td><input type="text" name="txtCepOrganizador" value="${organizador.cep}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Rua:</td> 
                    <td><input type="text" name="txtRuaOrganizador" value="${organizador.rua}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Bairro:</td> 
                    <td><input type="text" name="txtBairroOrganizador" value="${organizador.bairro}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Complemento:</td> 
                    <td><input type="text" name="txtComplementoOrganizador" value="${organizador.complemento}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Numero:</td> 
                    <td><input type="text" name="txtNumeroOrganizador" value="${organizador.numero}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Cidade:</td> 
                    <td><input type="text" name="txtCidadeOrganizador" value="${organizador.cidade}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Estado:</td> 
                    <td><input type="text" name="txtEstadoOrganizador" value="${organizador.estado}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Telefone:</td> 
                    <td><input type="text" name="txtTelefoneOrganizador" value="${organizador.telefone}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Celular:</td> 
                    <td><input type="text" name="txtCelularOrganizador" value="${organizador.celular}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
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
                    <td><a href="PesquisaOrganizadorController">Voltar para pesquisa</a></td>
                </tr>
            </table>
        </form>
    </body>
</html>
