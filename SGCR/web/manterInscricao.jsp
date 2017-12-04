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
                    <li><a href="#">Home</a></li>
                    <li class="active">${corrida.nome}</li> 
                </ul>
                <div class="form-group">
                    <label for="txtIdInscricao">Código da Inscrição:</label>
                    <input type="text" class="form-control" name="txtIdInscricao" value="${inscricao.id}" required <c:if test="${operacao != 'Incluir'}"> readonly</c:if>>
                    </div>
                    <div class="form-group">
                        <label for="atleta">Atleta:</label>
                        <select name="optAtleta" class="form-control" required <c:if test="${operacao == 'Excluir'}"> disabled</c:if>>
                        <option value="0" <c:if test="${inscricao.atleta.id == null}"> selected</c:if>> Selecione um atleta</option>  
                        <c:forEach items="${atletas}" var="atleta">
                            <option value="${atleta.id}" <c:if test="${inscricao.atletaId == atleta.id}"> selected</c:if>>${atleta.nome}</option>  
                        </c:forEach>
                    </select>
                </div>                       
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
                                            <select name="optPercurso" class="form-control" required <c:if test="${operacao == 'Excluir'}"> disabled</c:if>>
                                                <option value="0" <c:if test="${inscricao.percurso.id == null}"> selected</c:if>> Selecione um percurso</option>  
                                                <c:forEach items="${percursos}" var="percurso">
                                                    <option value="${percurso.id}" <c:if test="${inscricao.percursoId == percurso.id}"> selected</c:if>>${percurso.corrida.nome} - ${percurso.quilometragem}km</option>  
                                                </c:forEach>
                                            </select>
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

                <h4>Forma de Pagamento</h4>
                <div class="panel-group" id="accordion">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div style="cursor: pointer" data-toggle="collapse" data-parent="#accordion" href="#collapse1" <c:if test="${operacao != 'Excluir'}"> onclick="pagamento('cartaoCredito')"</c:if>>
                                Cartão de Crédito
                            </div>
                        </div>
                        <div id="collapse1" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-10 col-md-offset-1">
                                        <div class="form-group col-md-12">
                                            <label for="idCartaoCredito">Código do Cartão:</label>
                                            <input type="text" class="form-control pagamentoCartaoCredito" name="idCartaoCredito" required <c:if test="${operacao != 'Incluir'}"> readonly</c:if>>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="nCartao">Número do Cartão:</label>
                                            <input type="text" class="form-control pagamentoCartaoCredito" name="numeroCartaoCredito" placeholder="xxxx xxxx xxxx xxxx" id="nCartao" maxlength="16" <c:if test="${operacao == 'Excluir'}"> disabled</c:if>>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="nomeTitularCartao">Nome impresso no cartão:</label>
                                            <input type="text" class="form-control pagamentoCartaoCredito" name="nomeTitularCartaoCredito" placeholder="Nome" id="nomeTitularCartao" <c:if test="${operacao == 'Excluir'}"> disabled</c:if>>
                                        </div>
                                        <div class="form-group  col-md-3">
                                            <label for="cSeguranca">Código de Segurança:</label>
                                            <input type="text" class="form-control pagamentoCartaoCredito" name="codigoSegurancaCartaoCredito" placeholder="000" id="cSeguranca" maxlength="3" <c:if test="${operacao == 'Excluir'}"> disabled</c:if>>
                                        </div>
                                        <div class="form-group col-md-9">
                                            <label for="dtValidade">Data de Validade:</label>
                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <select class="form-control pagamentoCartaoCredito" id="mesValidade" name="mesValidadeCartaoCredito" <c:if test="${operacao == 'Excluir'}"> disabled</c:if>>
                                                        <option hidden>Mês</option>
                                                        <option value="1">01</option>
                                                        <option value="2">02</option>
                                                        <option value="3">03</option>
                                                        <option value="4">04</option>
                                                        <option value="5">05</option>
                                                        <option value="6">06</option>
                                                        <option value="7">07</option>
                                                        <option value="8">08</option>
                                                        <option value="9">09</option>
                                                        <option value="10">10</option>
                                                        <option value="11">11</option>
                                                        <option value="12">12</option>
                                                    </select>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <select class="form-control pagamentoCartaoCredito" id="anoValidade" name="anoValidadeCartaoCredito" <c:if test="${operacao == 'Excluir'}"> disabled</c:if>>
                                                        <option hidden>Ano</option>
                                                        <c:forEach items="${anos}" var="ano">  
                                                            <option value="${ano}">${ano}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <c:if test="${operacao != 'Excluir'}">
                                        <div class="form-group col-md-6 col-md-offset-3">
                                            <button type="submit" class="btn btn-success btn-block pagamentoCartaoCredito" name="formaPagamento" value="cartaoCredito">Pagar Com Cartão</button>
                                        </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div style="cursor: pointer" data-toggle="collapse" data-parent="#accordion" href="#collapse2" <c:if test="${operacao != 'Excluir'}"> onclick="pagamento('boleto')"</c:if>> 
                                Boleto
                            </div>
                        </div>
                        <div id="collapse2" class="panel-collapse collapse">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-10 col-md-offset-1">
                                        <div class="form-group col-md-12">
                                            <label for="idCartaoCredito">Código do Boleto:</label>
                                            <input type="text" class="form-control pagamentoBoleto" name="idBoleto" required <c:if test="${operacao != 'Incluir'}"> readonly</c:if> />
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="nomeTitularBoleto">Nome do Titular:</label>
                                            <input type="text" class="form-control pagamentoBoleto" name="nomeTitularBoleto" id="nomeTitularBoleto" <c:if test="${operacao == 'Excluir'}"> disabled</c:if>>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="cpfTitularBoleto">CPF do Titular:</label>
                                            <input type="text" class="form-control pagamentoBoleto" name="cpfTitularBoleto" id="cpfTitularBoleto" <c:if test="${operacao == 'Excluir'}"> disabled</c:if>>
                                        </div>
                                        <c:if test="${operacao != 'Excluir'}">
                                        <div class="form-group col-md-6 col-md-offset-3">
                                            <button type="submit" class="btn btn-success btn-block pagamentoBoleto" name="formaPagamento" value="boleto">Pagar Com Boleto</button>
                                        </div>
                                        </c:if>
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
