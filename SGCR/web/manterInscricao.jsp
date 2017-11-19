<%-- 
    Document   : manterInscricao
    Created on : Oct 17, 2017, 5:11:41 PM
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Inscrição</title>
    </head>
    <body>
        <h1>Manter Inscrição - ${operacao}</h1>
        
        <form action="ManterInscricaoController?acao=confirmar${operacao}" method="post" name="frmManterInscricao">
            <table>
                <tr>
                    <td>Código do Inscrição:</td> 
                    <td><input type="text" name="txtIdInscricao" value="${inscricao.id}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Data da Compra:</td> 
                    <td><input type="text" name="txtDataCompraInscricao" value="${inscricao.dataCompra}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
<!--                <tr>
                    <td>Número de Peito:</td> 
                    <td><input type="text" name="txtNumeroPeitoInscricao" value="${inscricao.numeroPeito}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>-->
<!--                <tr> 
                    <td>Pago:</td> 
                    <td>
                        <select name="optPago" <c:if test="${operacao == 'Excluir'}"> disabled</c:if>>
                            <option value="false" <c:if test="${inscricao.pago == false}"> selected</c:if>>Não</option>
                            <option value="true" <c:if test="${inscricao.pago == true}"> selected</c:if>>Sim</option>
                        </select>
                    </td>
                </tr>-->
<!--                <tr>
                    <td>Tempo Percorrido:</td> 
                    <td><input type="text" name="txtTempoPercorridoInscricao" value="${inscricao.tempoPercorrido}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>-->
                
                <!--FORMA DE PAGAMENTO-->
                
                <tr>
                    <td>Atleta:</td>
                    <td>
                        <select name="optAtleta" <c:if test="${operacao == 'Excluir'}"> disabled</c:if>>
                            <option value="0" <c:if test="${inscricao.atleta.id == null}"> selected</c:if>> Selecione um atleta</option>  
                            <c:forEach items="${atletas}" var="atleta">
                                <option value="${atleta.id}" <c:if test="${inscricao.atletaId == atleta.id}"> selected</c:if>>${atleta.nome}</option>  
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Corrida:</td>
                    <td>
                        <select name="optCorrida" <c:if test="${operacao == 'Excluir'}"> disabled</c:if>>
                            <option value="0" <c:if test="${inscricao.corrida.id == null}"> selected</c:if>> Selecione um corrida</option>  
                            <c:forEach items="${corridas}" var="corrida">
                                <option value="${corrida.id}" <c:if test="${inscricao.corridaId == corrida.id}"> selected</c:if>>${corrida.nome}</option>  
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Percurso:</td>
                    <td>
                        <select name="optPercurso" <c:if test="${operacao == 'Excluir'}"> disabled</c:if>>
                            <option value="0" <c:if test="${inscricao.percurso.id == null}"> selected</c:if>> Selecione um percurso</option>  
                            <c:forEach items="${percursos}" var="percurso">
                                <option value="${percurso.id}" <c:if test="${inscricao.percursoId == percurso.id}"> selected</c:if>>${percurso.corrida.nome} - ${percurso.quilometragem}km</option>  
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Kit:</td>
                    <td>
                        <select name="optKit" <c:if test="${operacao == 'Excluir'}"> disabled</c:if>>
                            <option value="0" <c:if test="${inscricao.kit.id == null}"> selected</c:if>> Selecione um kit</option>  
                            <c:forEach items="${kits}" var="kit">
                                <option value="${kit.id}" <c:if test="${inscricao.kitId == kit.id}"> selected</c:if>>${kit.nome}</option>  
                            </c:forEach>
                        </select>
                    </td>
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
                    <td><a href="PesquisaInscricaoController">Voltar para pesquisa</a></td>
                </tr>
            </table>
        </form>
    </body>
</html>
