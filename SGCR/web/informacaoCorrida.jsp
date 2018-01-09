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
                                                                    <img src="imagesUpload/kit/kit-3.png" class="img-kit-inscricao">
                                                                </div>
                                                                <input type="radio" class="option-input radio" onchange="atualizaPrecoKit(${kit.preco}, '${kit.nome}')" name="optKit" required value="${kit.id}" <c:if test="${inscricao.kitId == kit.id}"> checked</c:if>/>
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
                                                                <input type="radio" class="option-input radio" name="optPercurso" required value="${percurso.id}" <c:if test="${inscricao.percursoId == percurso.id}"> checked</c:if>/>
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
                                            
                                            <div class="panel panel-success radio " id="lote${lote.id}">
                                                <div class="panel-heading">Disponível</div>
                                                <label>
                                                    <div class="panel-body">
                                                        <input type="radio" onchange="atualizaPrecoLote(${lote.preco}, '${lote.tipo}')" name="optLote" required value="${lote.id}" <c:if test="${inscricao.loteId == lote.id}"> checked</c:if>/>
                                                        Lote ${lote.tipo}: R$ ${lote.precoFormatado} até dia ${lote.dataFinal}
                                                        <input type="hidden" id="dtFinal${lote.id}" value="${lote.dataFinal}"/>
                                                    </div>
                                                </label>
                                            </div>
                                                        
                                                    <script>
                                              
                                               
                                               var datalote =  document.getElementById("dtFinal${lote.id}").value;
                                               var partesData= datalote.split("/");
                                               var finalLote =  new Date(partesData[2], partesData[1]-1, partesData[0]);
                                               

                                                if( finalLote < new Date()){
                                                    //alert(finalLote);
                                                    var lote = document.getElementById("lote${lote.id}");
                                                    lote.className = "panel-danger";
                                                    console.log(finalLote < new Date());
                                                }else{
                                                    var lote = document.getElementById("lote${lote.id}");
                                                    lote.className = "panel-success";
                                                //console.log(dataAtualFormatada());
                                                console.log(finalLote);
                                                
                                                }
                                                console.log("lote"+${lote.id});
                                            </script>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="panel panel-success">
                                    <div class="panel-heading"><i class="fa fa-money"></i> Total</div>
                                    <div class="panel-body preco-total">
                                        <div id="divPrecoTotal">
                                            <div id="tabelaPreco" style="display: none">
                                                <table class="table table-hover table-striped table-responsive table-condensed">
                                                    <thead>
                                                        <tr>
                                                            <th>Item</th>
                                                            <th>Preço</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody style="text-align: left">
                                                        <tr id="infoLote" style="display: none">
                                                            <td id="nomeLote"></td>
                                                            <td id="precoLote"></td>
                                                        <tr>
                                                        <tr id="infoKit" style="display: none">
                                                            <td id="nomeKit"></td>
                                                            <td id="precoKit"></td>
                                                        <tr>
                                                    </tbody>
                                                    <tfoot>
                                                        <tr id="infoTotal">
                                                            <th>Total</th>
                                                            <th id="precoTotal"></th>
                                                        </tr>
                                                    </tfoot>
                                                </table>
                                            </div>

                                            <p id="infoVazio">
                                                Nenhum item selecionado!
                                            </p>
                                        </div>
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
