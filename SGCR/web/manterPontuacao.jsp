<%-- 
    Document   : manterPontuacao
    Created on : 17/10/2017, 10:18:46
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        
        <%@ include file = "layout/head.jsp" %>
        <title>Manter Pontuação</title>
        
    </head>
    <body>
        
        <%@ include file = "layout/menuAdministrador.jsp" %>
        
        <div class="container corpo">
            <ul class="breadcrumb">
                <li><a href="index.jsp">Home</a></li>
                <li class="active">${operacao} Pontuação</li>
            </ul>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-success">
                        <div class="panel-heading">${operacao} Pontuação</div>
                        <div class="panel-body">
                            <p><button class="btn btn-basic btn-info" >Digite suas informações abaixo:</button></p>
                            <form action="ManterPontuacaoController?acao=confirmar${operacao}" method="post" name="frmManterPontuacao" >
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="codigoRank">Ranking:</label>
                                            <select class="form-control" name="optRanking" <c:if test="${operacao == 'Excluir'}">readonly</c:if>>
                                                <option value="0" <c:if test="${pontuacao.ranking.id == null}">selected</c:if>> </option>  
                                                <c:forEach items="${rankings}" var="ranking">
                                                    <option value="${ranking.id}" <c:if test="${pontuacao.rankingId == ranking.id}"> selected</c:if>>${ranking.nome}</option>  
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="codigo">Código:</label>
                                            <input type="text" id="codigo" class="form-control" name="txtIdPontuacao" value="${pontuacao.id}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if>>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="pontuacao">Pontuação</label>
                                            <td><input type="text" class="form-control" id="pontuaca" name="txtPontuacao" value="${pontuacao.pontuacao}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-6">
                                                <a href="index.jsp" style="text-decoration: none" ><button type="button" class="btn btn-danger btn-block">Cancelar</button> </a>
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
