<%-- 
    Document   : pesquisaRelatorioAdministrador
    Created on : 03/04/2018, 07:38:52
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ include file = "layout/head.jsp" %>
        <title>Relatório</title>
    </head>
    <body>
        <%@ include file = "layout/menu.jsp" %>

        <div class="container-fluid corpo corpo-adm">
            <h2>Relatório</h2>

            <table class="table table-hover table-responsive">
                <thead>
                    <tr>
                        <th>Relatório</th>
                        <th class="table-action">Ação</th>
                    </tr>
                </thead>
                <tbody>
                   <tr>
                        <td>Lotes</td>
                        <td colspan="2" style='text-align: right' >
                            <form action="RelatorioController?acao=gerarRelatorioCorridasLote" method="post">
                                <button type="submit" class="btn btn-primary btn-xs" style="width: 100px;">
                                    <i class="fa fa-file-pdf-o fa-lg"></i> Gerar</button>
                            </form>
                        </td>
                    </tr>
                    
                     <tr>
                        <td>Pagamentos</td>
                        <td colspan="2" style='text-align: right' >
                            <form action="RelatorioController?acao=gerarRelatorioCorridaPagamentos" method="post">
                                <button type="submit" class="btn btn-primary btn-xs" style="width: 100px;">
                                    <i class="fa fa-file-pdf-o fa-lg"></i> Gerar</button>
                            </form>
                        </td>
                    </tr>


                    <tr>
                        <td>Atleta Corrida</td>
                        <td style='text-align: right'>
                            <a class="btn btn-primary btn-xs" href="PesquisaRelatorioController?acao=prepararRelatorioAtletasPorCorrida" style="width: 100px;">
                                <i class="fa fa-file-pdf-o fa-lg"></i> Gerar</a>
                        </td>
                    </tr>   
                    
                     <tr>
                        <td>Corrida Atletas Inadimplentes</td>
                        <td style='text-align: right'>
                            <a class="btn btn-primary btn-xs" href="PesquisaRelatorioController?acao=prepararRelatorioAtletasInadimplentesPorCorrida" style="width: 100px;">
                                <i class="fa fa-file-pdf-o fa-lg"></i> Gerar</a>
                        </td>
                    </tr>   
                     
                    <tr>
                        <td>Corrida Atleta Pagos</td>
                        <td style='text-align: right'>
                            <a class="btn btn-primary btn-xs" href="PesquisaRelatorioController?acao=prepararRelatorioAtletasPagosPorCorrida" style="width: 100px;">
                                <i class="fa fa-file-pdf-o fa-lg"></i> Gerar</a>
                        </td>
                    </tr>   
                    
                         <tr>
                   
                   <td>Corrida Atleta Pagos com Boleto</td>
                        <td style='text-align: right'>
                            <a class="btn btn-primary btn-xs" href="PesquisaRelatorioController?acao=prepararRelatorioAtletasPagosPorCorridaBoleto" style="width: 100px;">
                                <i class="fa fa-file-pdf-o fa-lg"></i> Gerar</a>
                        </td>
                    </tr>   
                    
                      <td>Corrida Atleta Pagos com Cartão</td>
                        <td style='text-align: right'>
                            <a class="btn btn-primary btn-xs" href="PesquisaRelatorioController?acao=prepararRelatorioAtletasPagosPorCorridaCartao" style="width: 100px;">
                                <i class="fa fa-file-pdf-o fa-lg"></i> Gerar</a>
                        </td>
                    </tr>   
                    
                    
                    
                </tbody>
            </table>            
        </div>
        <%@ include file = "layout/rodape.jsp" %>
    </body>
</html>
