<%-- 
    Document   : manterInscricao
    Created on : Oct 17, 2017, 5:11:41 PM
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="modelo.Corrida"%>

<!DOCTYPE html>
<html>
    <head>
        <%@ include file = "layout/head.jsp" %>
        <title>Inscrição</title>
    </head>
    <body>

        <%@ include file = "layout/menuAtleta.jsp" %>

        <form action="ManterInscricaoController?acao=confirmar${operacao}&corridaId=${corridaId}" method="post" name="frmManterInscricao">
            <div class="container corpo">
                <ul class="breadcrumb">
                    <li><a href="PesquisaHomeController">Home</a></li>
                    <li class="active">${corrida.nome}</li> 
                </ul>                      
                <div class="panel panel-primary">
                    <div class="panel-heading">Inscrição</div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="panel panel-info">
                                    <div class="panel-heading">Informações da Corrida</div>
                                    <div class="panel-body">
                                        <div class="col-md-12">
                                            <h4>${corrida.nome} - ${corrida.cidade}, ${corrida.estado}</h4>
                                            <h4>${corrida.data}, ${corrida.horario}</h4>
                                            <h3>Descrição:</h3>
                                            <p>${corrida.descricao}</p>
                                            <h3>Local:</h3>
                                            <p>${corrida.logradouro}, bairro ${corrida.bairro}</p>
                                            <br/>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="percurso">Percurso:</label>
                                            <div name="optPercurso" class="form-control" required <c:if test="${operacao == 'Excluir'}"> disabled</c:if>>
                                                <option value="0" <c:if test="${inscricao.percurso.id == null}"> selected</c:if>> Selecione um percurso</option>  
                                                <c:forEach items="${percursos}" var="percurso">
                                                    <option value="${percurso.id}" <c:if test="${inscricao.percursoId == percurso.id}"> selected</c:if>>${percurso.corrida.nome} - ${percurso.quilometragem}km</option>  
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="kit">Kit:</label>
                                            <select name="optKit" class="form-control" required <c:if test="${operacao == 'Excluir'}"> disabled</c:if>>
                                                <option value="0" <c:if test="${inscricao.kit.id == null}"> selected</c:if>> Selecione um kit</option>  
                                                <c:forEach items="${kits}" var="kit">
                                                    <option value="${kit.id}" <c:if test="${inscricao.kitId == kit.id}"> selected</c:if>>${kit.nome}</option>  
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="panel panel-default">
                                    <div class="panel-heading">Lote</div>
                                    <div class="panel-body">
                                        <c:forEach items="${lotes}" var="lote">  
                                            <div class="panel panel-success radio">
                                                <div class="panel-heading">Disponível</div>
                                                <label>
                                                    <div class="panel-body">
                                                        <input type="radio" name="optLote" required value="${lote.id}" <c:if test="${inscricao.loteId == lote.id}"> checked</c:if>/>
                                                        Lote ${lote.tipo}: R$ ${lote.preco} até dia ${lote.dataFinal}
                                                    </div>
                                                </label>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
