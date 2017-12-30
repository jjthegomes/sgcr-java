<%-- 
    Document   : finalizarInscricao.jsp
    Created on : 20/12/2017, 14:37:47
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <%@ include file = "layout/head.jsp" %>
        <title>Corridas</title>
    </head>
    <body>
        <%@ include file = "layout/menu.jsp" %>

        <div class="container corpo">
            <ul class="breadcrumb">
                <li><a href="PesquisaHomeController">Home</a></li>
                <li>${corrida.nome}</li>
                <li class="active">Finalizar Inscrição</li> 
            </ul>
            <div class="panel panel-success">
                <div class="panel-heading">Finalizar Inscrição</div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="panel panel-info radio">
                                <div class="panel-body">
                                    <b>Nome: </b> ${atleta.nome}
                                </div>
                            </div>
                            <div class="panel panel-info radio">
                                <div class="panel-body">
                                    <b>Nº de inscrição: </b> ${inscricao.id}
                                </div>
                            </div>
                            <div class="panel panel-info radio">
                                <div class="panel-body">
                                    <b>Corrida: </b> ${corrida.nome} - ${corrida.data} às ${corrida.horario}
                                </div>
                            </div>
                            <div class="panel panel-info radio">
                                <div class="panel-body">
                                    <b>Percurso: </b> ${percurso.descricao} - ${percurso.quilometragem}km
                                </div>
                            </div>
                            <div class="panel panel-info radio">
                                <div class="panel-body">
                                    <b>Kit: </b> ${kit.nome} - ${kit.descricao}
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="panel panel-info radio">
                                <div class="panel-body">
                                    <b>Total: </b> R$ ${lote.preco}
                                </div>
                            </div>
                            <div class="panel panel-info radio">
                                <div class="panel-body">
                                    <c:choose>
                                        <c:when test="${formaPagamento=='boleto'}">
                                            <i class="fa fa-barcode fa-lg"></i> Boleto: ${boleto.codigoBarra}
                                        </c:when>    
                                        <c:otherwise>
                                            <i class="fa fa-credit-card fa-lg"></i> Cartão de crédito. Pagamento aprovado!
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                            <c:choose>
                                <c:when test="${formaPagamento=='boleto'}">
                                    <button type="submit" class="btn btn-warning btn-block">Imprimir Boleto</button>
                                </c:when>    
                            </c:choose>
                            <a href="PesquisaHomeController" class="btn btn-success btn-block">Concluir</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@ include file = "layout/rodape.jsp" %>

    </body>
</html>