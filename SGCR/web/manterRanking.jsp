<%-- 
    Document   : manterRanking
    Created on : 17/10/2017, 09:31:01
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>

        <%@ include file = "layout/head.jsp" %>
        <title>Manter Ranking</title>

    </head>

    <body>

        <%@ include file = "layout/menu.jsp" %>

        <div class="container-fluid corpo corpo-adm">
            <ul class="breadcrumb">
                <li><a href="index.jsp">Home</a></li>
                <li class="active">${operacao} Ranking</li>
            </ul>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">${operacao} Ranking</div>
                        <div class="panel-body">
                            <form action="ManterRankingController?acao=confirmar${operacao}" method="post" name="frmManterRanking">
                                <div class="col-md-6">
                                    <input type="hidden" class="form-control" id="codigo" name="hiddenIdRanking" value="${ranking.id}" readonly />

                                    <div class="form-group">
                                        <label for="nome">Nome:</label>
                                        <input type="text" required id="nome" class="form-control" name="txtNomeRanking" value="${ranking.nome}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        </div>
                                        <div class="form-group">
                                            <label for="FaixaEtaria">Intervalo de Faixa Etária:</label>
                                            <input type="text" required class="form-control" id="FaixaEtaria" name="txtIntervaloFaixaEtaria" value="${ranking.intervaloFaixaEtaria}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        </div>
                                        <div class="form-group">
                                            <label for="IdadeInicial">Idade Inicial:</label>
                                            <input type="text" class="form-control" id="IdadeInicial" name="txtIdadeInicial" value="${ranking.idadeInicial}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-6">
                                                <a href="PesquisaRankingController" style="text-decoration: none" ><button type="button" class="btn btn-danger btn-block">Cancelar</button> </a>
                                            </div>
                                            <div class="col-md-6">
                                                <input type="submit" name="btnConfirmar" value="Confirmar" class="btn btn-success btn-block" >
                                            </div>
                                        </div>     
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <%@ include file = "layout/rodape.jsp" %>
    </body>
</html>
