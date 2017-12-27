<%-- 
    Document   : manterProdutoKit
    Created on : 17/10/2017, 10:02:00
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>

        <%@ include file = "layout/head.jsp" %>
        <title>Manter ProdutoKit</title>

    </head>
    <body>

        <%@ include file = "layout/menu.jsp" %>

        <div class="container-fluid corpo corpo-adm">
            <ul class="breadcrumb">
                <li><a href="index.jsp">Home</a></li>
                <li class="active">${operacao} Produto Kit</li>
            </ul>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">${operacao} Produto Kit</div>
                        <div class="panel-body">
                            <form action="ManterProdutoKitController?acao=confirmar${operacao}" method="post" name="frmManterProdutoKit" >
                                <div class="col-md-6">
                                    <input type="hidden" class="form-control" id="codigo" name="hiddenIdProdutoKit" value="${produtoKit.id}" readonly />

                                    <div class="form-group">
                                        <label for="codigoCorrida">Corrida:</label>
                                        <select class="form-control" id="codigoCorrida" name="optCorrida" <c:if test="${operacao == 'Excluir'}">disabled</c:if>>
                                            <option value="0" <c:if test="${produtoKit.corrida.id == null}"> selected</c:if>> Selecione uma Corrida</option>  
                                            <c:forEach items="${corridas}" var="corrida">
                                                <option value="${corrida.id}" <c:if test="${produtoKit.corridaId == corrida.id}"> selected</c:if>>${corrida.nome}</option>  
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="codigoKit">Kit:</label>
                                        <select class="form-control" id="codigoKit" name="optKit" <c:if test="${operacao == 'Excluir'}">disabled</c:if>>
                                            <option value="0" <c:if test="${produtoKit.kit.id == null}"> selected</c:if>>Selecione um Kit </option>  
                                            <c:forEach items="${kits}" var="kit">
                                                <option value="${kit.id}" <c:if test="${produtoKit.kitId == kit.id}"> selected</c:if>>${kit.nome}</option>  
                                            </c:forEach>
                                        </select>
                                    </div>                                    
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="codigoPro">Produto:</label>
                                        <select class="form-control" id="codigoPro" name="optProduto" <c:if test="${operacao == 'Excluir'}">disabled</c:if>>
                                            <option value="0" <c:if test="${produtoKit.produto.id == null}"> selected</c:if>> Selecione um Produto</option>  
                                            <c:forEach items="${produtos}" var="produto">
                                                <option value="${produto.id}" <c:if test="${produtoKit.produtoId == produto.id}"> selected</c:if>>${produto.nome}</option>  
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="descricao">Descrição:</label>
                                        <input type="text" class="form-control" id="descricao" name="txtDescricao" value="${produtoKit.descricao}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        </div>
                                        <div class="form-group">
                                            <label for="valor">Valor:</label>
                                            <input type="text" class="form-control" id="valor" name="txtProdutoValor" value="${produtoKit.valor}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-6">
                                                <a href="PesquisaProdutoKitController" style="text-decoration: none" ><button type="button" class="btn btn-danger btn-block">Cancelar</button> </a>
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
