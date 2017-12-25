<%-- 
    Document   : manterProduto
    Created on : 18/11/2017, 17:19:03
    Author     : ariel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        
        <%@ include file = "layout/head.jsp" %>
        <title>Manter Produto</title>
        
    </head>
    <body>
        
        <%@ include file = "layout/menu.jsp" %>
        
        <div class="container-fluid corpo corpo-adm">
            <ul class="breadcrumb">
                <li><a href="index.jsp">Home</a></li>
                <li class="active">${operacao} Produto</li>
            </ul>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">${operacao} Produto</div>
                        <div class="panel-body">
                            <form action="ManterProdutoController?acao=confirmar${operacao}" method="post" name="frmManterProduto" >
                                    <div class="col-md-6">
                                        <div class="form-group">
                                        <label for="codigoAdm">Administrador:</label>
                                        <select class="form-control" id="codigoAdm" name="optAdministrador" <c:if test="${operacao == 'Excluir'}"> disabled</c:if>>
                                            <option value="0" <c:if test="${produto.administrador.id == null}"> selected</c:if>> </option>  
                                            <c:forEach items="${administradores}" var="administrador">
                                                <option value="${administrador.id}" <c:if test="${produto.administradorId == administrador.id}"> selected</c:if>>${administrador.nome}</option>  
                                            </c:forEach>
                                        </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="codigo">Código:</label>
                                            <input type="text" id="codigo" class="form-control" name="txtIdProduto" value="${produto.id}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if>>
                                        </div>
                                        
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="nome">Nome</label>
                                            <input type="text" id="nome" class="form-control" name="txtNome" value="${produto.nome}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-6">
                                                <a href="PesquisaProdutoController" style="text-decoration: none" ><button type="button" class="btn btn-danger btn-block">Cancelar</button> </a>
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
