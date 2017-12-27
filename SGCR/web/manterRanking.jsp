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
                                        <div class="form-group">
                                        <label for="codigo">Administrador:</label>
                                            <select  class="form-control" name="optAdministrador" <c:if test="${operacao == 'Excluir'}"> disabled</c:if>>
                                                <option value="0" <c:if test="${ranking.administrador.id == null}"> selected</c:if>> </option>  
                                                <c:forEach items="${administradores}" var="administrador">
                                                <option value="${administrador.id}" <c:if test="${ranking.administradorId == administrador.id}"> selected</c:if>>${administrador.nome}</option>  
                                                </c:forEach>
                                            </select>
                                        </div>                                       
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="nome">Nome:</label>
                                            <input type="text" id="nome" class="form-control" name="txtNomeRanking" value="${ranking.nome}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        </div>
                                        <div class="form-group">
                                            <label for="FaixaEtaria">Intervalo de Faixa Etaria:</label>
                                            <input type="text" class="form-control" name="txtIntervaloFaixaEtaria" value="${ranking.intervaloFaixaEtaria}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
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
