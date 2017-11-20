<%-- 
    Document   : manterAtleta
    Created on : 17/10/2017, 09:35:09
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Atleta</title>
    </head>
    <body>
        <h1>Manter Atleta - ${operacao}</h1>

        <form action="ManterAtletaController?acao=confirmar${operacao}" method="post" name="frmManterAtleta">
            <!-- onsubmit="return validarFormulario(this)" --> 
            <table>    
                <tr>
                    <td>Código:</td> 
                    <td><input type="text" name="txtIdAtleta" value="${atleta.id}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Nome Completo:</td> 
                        <td><input type="text" name="txtNomeAtleta" value="${atleta.nome}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Apelido:</td> 
                        <td><input type="text" name="txtApelidoAtleta" value="${atleta.apelido}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>
                    <!-- ALTERAR PARA SELECT DIA MES ANO -->
                    <tr>
                        <td>Data de Nascimento:</td> 
                        <td><input type="text" name="txtDataNascimentoAtleta" value="${atleta.dataNascimento}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>CPF:</td> 
                        <td><input type="text" name="txtCpfAtleta" value="${atleta.cpf}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Tamanho da Camisa:</td> 
                        <td>
                            <select name="optTamanhoCamisa" <c:if test="${operacao == 'Excluir'}"> disabled </c:if>>
                            <option value="P" <c:if test="${atleta.tamanhoCamisa == 'P'}"> selected</c:if>>P</option>
                            <option value="M" <c:if test="${atleta.tamanhoCamisa == 'M'}"> selected</c:if>>M</option>
                            <option value="G" <c:if test="${atleta.tamanhoCamisa == 'G'}"> selected</c:if>>G</option>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td>Sexo:</td> 
                        <td><input type="radio" name="txtSexoAtleta" value="M" <c:if test="${operacao == 'Excluir'}"> readonly</c:if> 
                               <c:if test="${atleta.sexo == 'M'}"> checked</c:if>>Masculino</td>
                        <td><input type="radio" name="txtSexoAtleta" value="F"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if> 
                               <c:if test="${atleta.sexo == 'F'}"> checked</c:if>>Feminino</td>
                    </tr>
                    
                    <tr>
                        <td>Email:</td> 
                        <td><input type="text" name="txtEmailAtleta" value="${atleta.email}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>                                                           
                    <tr>
                        <td>Senha:</td> 
                        <td><input type="password" name="txtSenhaAtleta" value="${atleta.senha}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>

                    <tr>
                        <td>CEP:</td> 
                        <td><input type="text" name="txtCepAtleta" value="${atleta.cep}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Estado</td> 
                        <td><input type="text" name="txtEstadoAtleta" value="${atleta.estado}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Cidade:</td> 
                        <td><input type="text" name="txtCidadeAtleta" value="${atleta.cidade}" <c:if test="${operacao =='Excluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Bairro:</td> 
                        <td><input type="text" name="txtBairroAtleta" value="${atleta.bairro}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Logradouro:</td> 
                        <td><input type="text" name="txtLogradouroAtleta" value="${atleta.logradouro}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Numero:</td> 
                        <td><input type="text" name="txtNumeroAtleta" value="${atleta.numero}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Complemento</td> 
                        <td><input type="text" name="txtComplementodAtleta" value="${atleta.complemento}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Telefone:</td> 
                        <td><input type="text" name="txtTelefoneAtleta" value="${atleta.telefone}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Celular:</td> 
                        <td><input type="text" name="txtCelularAtleta" value="${atleta.celular}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>

                <tr>
                    <td><input type="submit" name="btnConfirmar" value="Confirmar"></td>
                </tr>
                <br>
                <tr>
                    <td><a href="index.jsp">Menu</a></td>
                </tr>
                <tr>
                    <td><a href="PesquisaAtletaController">Voltar para pesquisa</a></td>
                </tr>
            </table>
        </form>
    </body>
</html>
