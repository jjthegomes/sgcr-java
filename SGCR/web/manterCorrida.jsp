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
                    <td>Codigo da Corrida</td> 
                    <td><input type="text" name="txtIdCorrida" value="${corrida.idCorrida}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Nome da Corrida</td> 
                    <td><input type="text" name="txtNomeCorrida" value="${corrida.nomeCorrida}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Max Pessoas</td> 
                    <td><input type="number" name="txtMaxPessoasCorrida" value="${corrida.maxPessoasCorrida}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>

                <tr>
                    <td>Horario Inicio da Corrida</td> 
                    <td><input type="text" name="txtHorarioInicioCorrida" value="${corrida.horarioFinaloCorrida}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>   
                <tr>
                    <td>Horario Final da Corrida</td> 
                    <td><input type="text" name="txtHorarioFinalCorrida" value="${corrida.horarioInicioCorrida}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>   
                <tr>
                    <td>Banner da Corrida</td> 
                    <td><input type="text" name="txtBannerCorrida" value="${corrida.bannerCorrida}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Rua do Corrida</td> 
                    <td><input type="text" name="txtRuaCorrida" value="${corrida.ruaCorrida}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>CEP da Corrida</td> 
                    <td><input type="text" name="txtCepCorrida" value="${corrida.cepCorrida}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Cidade do Corrida</td> 
                    <td><input type="text" name="txtCidadeCorrida" value="${corrida.cidadeCorrida}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Estado do Corrida</td> 
                    <td><input type="text" name="txtEstadoCorrida" value="${corrida.estadoCorrida}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>                               
                <tr>
                    <td>Bairro do Corrida</td> 
                    <td><input type="text" name="txtBairroCorrida" value="${corrida.bairroCorrida}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Descricao da Corrida</td> 
                    <td><input type="text" name="txtDescricaoCorrida" value="${corrida.descricaoCorrida}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Regulamento da Corrida</td> 
                    <td><input type="text" name="txtRegulamentoCorrida" value="${corrida.regulamentoCorrida}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Organizador</td>
                    <td>
                        <select name="optOrganizador" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                            <option value="0" <c:if test="${corrida.organizador.id== null}"> selected</c:if>> </option>  
                            <c:forEach items="${organizadores}" var="organizador">
                                <option value="${organizador.id}" <c:if test="${corrida.organizador.id == organizador.id}"> selected</c:if>>${organizador.nome}</option>  
                            </c:forEach>
                        </select>
                    </td>
                    <!-- ATENÇAO AO SELECT DAS CHAVES PRIMARIAS!! -->
                </tr>

                <tr>
                    <td><input type="submit" name="btnConfirmar" value="Confirmar"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
