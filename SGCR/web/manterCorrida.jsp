<%-- 
    Document   : manterCorrida
    Created on : 17/10/2017, 09:54:57
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Corrida</title>
    </head>
    <body>
        <h1>Manter Corrida - ${operacao}</h1>

        <form action="ManterCorridaController?acao=confirmar${operacao}" method="post" name="frmManterCorrida"> 
            <!-- onsubmit="return validarFormulario(this)" --> 
            <table>
                <tr>
                    <td>Codigo</td> 
                        <td><input type="text" name="txtIdCorrida" value="${corrida.id}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Nome</td> 
                        <td><input type="text" name="txtNomeCorrida" value="${corrida.nome}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Descricao</td> 
                        <td><input type="text" name="txtDescricaoCorrida" value="${corrida.descricao}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Max Pessoas</td> 
                        <td><input type="number" name="txtMaxPessoaCorrida" value="${corrida.maxPessoas}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Data</td> 
                        <td><input type="text" name="txtData" value="${corrida.data}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>

                    <tr>
                        <td>Horario</td> 
                        <td><input type="text" name="txtHorario" value="${corrida.horario}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>   

                    <tr>
                        <td>CEP</td> 
                        <td><input type="text" name="txtCepCorrida" value="${corrida.cep}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>

                    <tr>
                        <td>Estado</td> 
                        <td><input type="text" name="txtEstadoCorrida" value="${corrida.estado}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>      

                    <tr>
                        <td>Cidade</td> 
                        <td><input type="text" name="txtCidadeCorrida" value="${corrida.cidade}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>

                    <tr>
                        <td>Logradouro</td> 
                        <td><input type="text" name="txtRuaCorrida" value="${corrida.logradouro}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>

                    <tr>
                        <td>Bairro</td> 
                        <td><input type="text" name="txtBairroCorrida" value="${corrida.bairro}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>

                    <tr>
                        <td>Regulamento</td> 
                        <td><input type="text" name="txtRegulamentoCorrida" value="${corrida.regulamento}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>

                    <tr>
                        <td>Banner</td> 
                        <td><input type="text" name="txtBannerCorrida" value="${corrida.banner}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>
                    
                    <tr>
                        <td>Organizador</td>
                        <td>
                            <select name="optOrganizador" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                            <option value="0" <c:if test="${corrida.organizador.id== null}"> selected</c:if>>Selecione um Organizador</option>  
                            <c:forEach items="${organizadores}" var="organizador">
                                <option value="${organizador.id}" <c:if test="${corrida.organizadorId == organizador.id}"> selected</c:if>>${organizador.nome}</option>  
                            </c:forEach>
                        </select>
                    </td>
                    <!-- ATENÇAO AO SELECT DAS CHAVES PRIMARIAS!! -->
                </tr>

                <tr>
                    <td><input type="submit" name="btnConfirmar" value="Confirmar"></td>
                </tr>
                <br>
                <tr>
                    <td><a href="index.jsp">Menu</a></td>
                </tr>
                <tr>
                    <td><a href="PesquisaCorridaController">Voltar para pesquisa</a></td>
                </tr>
            </table>
        </form>
    </body>
</html>
