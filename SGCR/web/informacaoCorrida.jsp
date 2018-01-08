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
        <%@ include file = "layout/head.jsp" %>
        <script src="public/js/inscricao.js"></script>
        <title>Informação</title>
    </head>
    <body>

        <%@ include file = "layout/menu.jsp" %>

        <form action="ManterInscricaoController?acao=confirmar${operacao}&corridaId=${corridaId}" method="post" name="frmManterInscricao">
            <div class="container corpo">
                <ul class="breadcrumb">
                    <li><a href="PesquisaHomeController">Home</a></li>
                    <li class="active">${corrida.nome}</li> 
                </ul>
              
                <c:choose>
                    <c:when test="${mensagemAlerta!=null}">
                        <div class="alert alert-warning alert-dismissable fade in">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <i class="fa fa-warning"></i> ${mensagemAlerta}
                        </div>
                    </c:when>    
                </c:choose>

                <input type="hidden" class="form-control" name="hiddenIdInscricao" value="${inscricao.id}" readonly>

                <div class="panel panel-primary">
                    <div class="panel-heading">Inscrição</div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="panel panel-info">
                                    <div class="panel-heading">Informações da Corrida</div>
                                    <div class="panel-body">
                                        <div class="col-md-12 info-corrida">
                                            <div class="row">
                                                <h3 class="col-md-12"> ${corrida.nome}</h3>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <p class="col-md-12"><i class="fa fa-map-marker fa-2x"></i>${corrida.cidade}, ${corrida.estado}, ${corrida.logradouro}, bairro ${corrida.bairro}</p>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <p class="col-md-12"><i class="fa fa-calendar-o fa-2x"></i>${corrida.data} às ${corrida.horario}</p>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <p class="col-md-12"><i class="fa fa-fa fa-2x"></i>${corrida.descricao}</p>
                                            </div>
                                            <hr>
                                        </div>

                                        <div class="form-group col-md-6">
                                            <div class="panel panel-default">
                                                <div class="panel-heading"><i class="fa fa-shopping-bag"></i> Kit</div>
                                                <!--<div class="panel-body"> -->
                                                <c:forEach items="${kits}" var="kit">  
                                                    <div class="panel panel-default radio col-md-12 panel-config">
                                                        <label class="label-kit-inscricao">
                                                            <div class="panel-body">
                                                                <div class="div-img-inscricao">
                                                                    <img src="${kit.imagem}" class="img-kit-inscricao">
                                                                </div>                                     
                                                                <p><b>${kit.nome} - R$ ${kit.precoFormatado}</b></p>
                                                                ${kit.descricao}
                                                            </div>
                                                        </label>
                                                    </div>
                                                </c:forEach>
                                                <!--</div>-->
                                            </div>
                                        </div>

                                        <div class="form-group col-md-6">
                                            <div class="panel panel-default">
                                                <div class="panel-heading"><i class="fa fa-map"></i> Percurso</div>
                                                <!--<div class="panel-body">-->
                                                <c:forEach items="${percursos}" var="percurso">  
                                                    <div class="panel panel-default radio col-md-12 panel-config">
                                                        <label>
                                                            <div class="panel-body">
                                                                <p><b>${percurso.quilometragemFormatada}km</b></p>
                                                                ${percurso.descricao}
                                                            </div>
                                                        </label>
                                                    </div>
                                                </c:forEach>
                                                <!--</div>-->
                                            </div>
                                        </div>
                                    </div> 
                                </div>
                            </div>
                                            
                            <div class="col-md-4">
                                <div class="panel panel-default">
                                    <div class="panel-heading"><i class="fa fa-ticket"></i> Lote</div>
                                    <div class="panel-body">
                                        
                                        <c:forEach items="${lotes}" var="lote"> 
                                            
                                            <div class="panel panel-success radio" id="lote${lote.id}">
                                                <div class="panel-heading ">Disponível</div>
                                                <label>
                                                    <div class="panel">
                                                        <br>
                                                        Lote ${lote.tipo}: R$ ${lote.precoFormatado} até dia ${lote.dataFinal}
                                                       
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
                <c:if test="${operacao == 'Excluir'}">
                    <div class="form-group col-md-6 col-md-offset-3">
                        <button type="submit" class="btn btn-success btn-block" value="Confirmar">Confirmar</button>
                    </div>
                </c:if>
            </div>
        </form>

        <%@ include file = "layout/rodape.jsp" %>

        <script type="text/javascript" src="public/js/myscript.js"></script>
    </body>
</html>
