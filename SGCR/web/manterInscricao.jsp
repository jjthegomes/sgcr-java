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

        <script>
            var precoTotal = 0;
            var precoLote = 0;
            var precoKit = 0;
            function atualizaPrecoLote(preco, nome) {
                precoLote = preco;
                precoTotal = parseFloat(precoLote) + parseFloat(precoKit);
                var mostraPrecoLote = document.getElementById("precoLote");
                var mostraNomeLote = document.getElementById("nomeLote");
                var mostraPrecoTotal = document.getElementById("precoTotal");
                var divPrecoTotal = document.getElementById("divPrecoTotal");

                divPrecoTotal.style.opacity = "1";
                divPrecoTotal.style.border = "none";
                divPrecoTotal.style.padding = "0px";

                mostraPrecoLote.innerHTML = "R$ " + precoLote;
                mostraNomeLote.innerHTML = nome;
                mostraPrecoTotal.innerHTML = "R$ " + precoTotal;

                document.getElementById("infoLote").style.display = "table-row";
                document.getElementById("tabelaPreco").style.display = "block";
                document.getElementById("infoVazio").style.display = "none";
            }

            function atualizaPrecoKit(preco, nome) {
                precoKit = preco;
                precoTotal = parseFloat(precoLote) + parseFloat(precoKit);
                var mostraPrecoKit = document.getElementById("precoKit");
                var mostraNomeKit = document.getElementById("nomeKit");
                var mostraPrecoTotal = document.getElementById("precoTotal");
                var divPrecoTotal = document.getElementById("divPrecoTotal");

                divPrecoTotal.style.opacity = "1";
                divPrecoTotal.style.border = "none";
                divPrecoTotal.style.padding = "0px";

                mostraPrecoKit.innerHTML = "R$ " + precoKit;
                mostraNomeKit.innerHTML = nome;
                mostraPrecoTotal.innerHTML = "R$ " + precoTotal;

                document.getElementById("infoKit").style.display = "table-row";
                document.getElementById("tabelaPreco").style.display = "block";
                document.getElementById("infoVazio").style.display = "none";
            }
        </script>

        <%@ include file = "layout/menu.jsp" %>

        <form action="ManterInscricaoController?acao=confirmar${operacao}&corridaId=${corridaId}" method="post" name="frmManterInscricao">
            <div class="container corpo">
                <ul class="breadcrumb">
                    <li><a href="PesquisaHomeController">Home</a></li>
                    <li class="active">${corrida.nome}</li> 
                </ul>
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
                                                <div class="panel-body">
                                                    <c:forEach items="${kits}" var="kit">  
                                                        <div class="panel panel-success radio col-md-12">
                                                            <label>
                                                                <div class="panel-body">
                                                                    <input type="radio" onchange="atualizaPrecoKit(${kit.preco}, '${kit.nome}')" name="optKit" required value="${kit.id}" <c:if test="${inscricao.kitId == kit.id}"> checked</c:if>/>
                                                                    <p><b>${kit.nome} - R$ ${kit.preco}</b></p>
                                                                    ${kit.descricao}
                                                                </div>
                                                            </label>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                            
                                        <div class="form-group col-md-6">
                                            <div class="panel panel-default">
                                                <div class="panel-heading"><i class="fa fa-map"></i> Percurso</div>
                                                <div class="panel-body">
                                                    <c:forEach items="${percursos}" var="percurso">  
                                                        <div class="panel panel-success radio">
                                                            <label>
                                                                <div class="panel-body">
                                                                    <input type="radio" name="optPercurso" required value="${percurso.id}" <c:if test="${inscricao.percursoId == percurso.id}"> checked</c:if>/>
                                                                    <p><b>${percurso.quilometragem}km</b></p>
                                                                    ${percurso.descricao}
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
                            <div class="col-md-4">
                                <div class="panel panel-default">
                                    <div class="panel-heading"><i class="fa fa-ticket"></i> Lote</div>
                                    <div class="panel-body">
                                        <c:forEach items="${lotes}" var="lote">  
                                            <div class="panel panel-success radio">
                                                <div class="panel-heading">Disponível</div>
                                                <label>
                                                    <div class="panel-body">
                                                        <input type="radio" onchange="atualizaPrecoLote(${lote.preco}, '${lote.tipo}')" name="optLote" required value="${lote.id}" <c:if test="${inscricao.loteId == lote.id}"> checked</c:if>/>
                                                        Lote ${lote.tipo}: R$ ${lote.preco} até dia ${lote.dataFinal}
                                                    </div>
                                                </label>
                                            </div>
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

                <div class="panel-group">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div>
                                Forma de Pagamento
                            </div>
                        </div>
                        <div class="panel-body">
                            <ul class="nav nav-tabs">
                                <li <c:if test="${operacao != 'Excluir'}"> onclick="pagamento('cartaoCredito')"</c:if>><a data-toggle="tab" href="#cartaoCredito"><i class="fa fa-credit-card"></i> Cartão de crédito</a></li>
                                <li <c:if test="${operacao != 'Excluir'}"> onclick="pagamento('boleto')"</c:if>><a data-toggle="tab" href="#boleto"><i class="fa fa-barcode fa-lg"></i> Boleto</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div id="cartaoCredito" class="tab-pane fade">
                                        <div class="row">
                                            <div class="col-md-10 col-md-offset-1">
                                                <div class="form-group col-md-12">
                                                    <h3><i class="fa fa-credit-card"></i> Cartão de crédito</h3>
                                                </div>                                            
                                                <input type="hidden" class="form-control pagamentoCartaoCredito" name="hiddenIdCartaoCredito" readonly />

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
                                <div id="boleto" class="tab-pane fade">
                                    <div class="row">
                                        <div class="col-md-10 col-md-offset-1">
                                            <div class="form-group col-md-12">
                                                <h3><i class="fa fa-barcode"></i> Boleto</h3>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <p><i class="fa fa-print"></i> Imprima o boleto e pague no banco</p>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <p><i class="fa fa-calendar-o"></i> O prazo de validade do boleto é de 1 dia útil</p>
                                            </div>
                                            <input type="hidden" class="form-control pagamentoBoleto" name="hiddenIdBoleto" readonly />

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
