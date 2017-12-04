<%-- 
    Document   : manterLote
    Created on : 17/10/2017, 10:26:14
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="pt-br">
    <head>

        <%@ include file = "layout/head.jsp" %>
        <title>Manter Lote - ${operacao}</title>
        
    </head>
    <body>
        
        <%@ include file = "layout/menuOrganizador.jsp" %>

        <div class="container corpo">
            <ul class="breadcrumb">
                <li><a href="index.jsp">Home</a></li>
                <li class="active"> ${operacao} Lote</li>
            </ul>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading"> ${operacao} Lote</div>
                        <div class="panel-body">
                            <form action="ManterLoteController?acao=confirmar${operacao}" method="post" name="frmManterLote"> 
                                <div class="form-group">
                                    <label for="idLote">Código:</label>
                                    <input type="text" class="form-control" id="codigo" name="txtIdLote" value="${lote.id}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if>>
                                    </div>
                                    <div class="form-group">                                   
                                        <select name="optCorrida" class="form-control" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        <option value="0" <c:if test="${lote.corrida.id== null}"> selected</c:if>>Selecione uma Corrida:</option>  
                                        <c:forEach items="${corridas}" var="corrida">
                                            <option value="${corrida.id}" <c:if test="${lote.corridaId == corrida.id}"> selected</c:if>>${corrida.nome}</option>  
                                        </c:forEach>
                                    </select>
                                </div>  

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="tipoLote">Tipo:</label>
                                        <input type="text" class="form-control" id="tipoLote" placeholder="" name="txtTipoLote" value="${lote.tipo}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        </div>
                                        <div class="form-group">
                                            <label for="quant">Quantidade:</label>
                                            <input type="text" class="form-control" id="quant" placeholder="" name="txtQuantidadeLote" value="${lote.quantidade}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        </div>
                                        <div class="form-group">
                                            <label for="preco">Preço:</label>
                                            <input type="text" class="form-control" id="preco" placeholder="R$" name="txtPrecoLote" value="${lote.preco}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="dtInicio">Data de Início:</label>
                                            <input type="text" class="form-control" id="dtInicio" placeholder="__/__/____" name="txtDataInicioLote" value="${lote.dataInicio}" <c:if test="${operacao =='Excluir'}"> readonly</c:if> >
                                        </div>
                                        <div class="form-group">
                                            <label for="dtTermino">Data de Término:</label>
                                            <input type="text" class="form-control" id="dtTermino" placeholder="__/__/____" name="txtDataFinalLote" value="${lote.dataFinal}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                    </div>
                                    <div class="form-group">
                                        <a href="PesquisaLoteController" style="text-decoration: none" ><button type="button" class="btn btn-danger">Cancelar</button> </a>
                                        <input type="submit" name="btnConfirmar" value="Confirmar" class="btn btn-success" >
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