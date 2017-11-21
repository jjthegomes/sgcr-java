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
        <meta http-equiv="Content-Type" content="text/html;" charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Inscrição</title>
        <meta http-equiv="pragma" content="no-cache">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" type="text/css" href="public/bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" type="text/css" href="public/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="public/css/estilo.css">
        <title>Manter Inscrição</title>
    </head>
    <body>

        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Sistema de Corrida</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Nome do Atleta<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Minha Conta</a></li>
                                <li><a href="#">Meus Eventos</a></li>
                                <li><a href="#">Alterar Dados</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-right">
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit">
                                        <i class="fa fa-search" aria-hidden="true"></i>
                                    </button>
                                </div>
                                <input type="text" class="form-control" placeholder="Busca" size="40">
                            </div>
                        </div>
                    </form>
                </div><!--/.navbar-collapse -->
            </div>
        </nav>

        <div class="container corpo">
            <ul class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li class="active">${corrida.nome}</li> 
            </ul>
            <div class="panel panel-primary">
                <div class="panel-heading">Inscrição</div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="panel panel-info">
                                <div class="panel-heading">Informações da Corrida</div>
                                <div class="panel-body">
                                    <h4>${corrida.nome} - ${corrida.cidade}, ${corrida.estado}</h4>
                                    <h4>${corrida.data}, ${corrida.horario}</h4>
                                    <br>
                                    <h3>Descrição:</h3>
                                    <p>${corrida.descricao}</p>
<!--                                    <h3>Tipo de Chip:</h3>
                                    <p>Retornável</p>-->
<!--                                    <h3>Data de retirada do kit:</h3> 
                                    <p>00 de Mês de 0000</p>-->
                                    <h3>Local:</h3>
                                    <p>${corrida.logradouro}, bairro ${corrida.bairro}</p>
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
                                                <input type="radio" name="optradio" value="${lote.id}" 
                                                   <c:if test="${inscricao.loteId == lote.id}"> selected</c:if>>
                                            Lote ${lote.tipo}: R$ ${lote.preco} até dia ${lote.dataFinal}
                                            </div>
                                        </label>
                                    </div>
                                </c:forEach>
<!--                                    <div class="panel panel-danger radio disabled">
                                        <div class="panel-heading">Encerrado</div>
                                        <label>
                                            <div class="panel-body disabled">
                                                <input type="radio" name="optradio" disabled>1º Lote: R$ 50,00 até dia 00/00/0000
                                            </div>
                                        </label>
                                    </div>-->

<!--                                    <div class="panel panel-success radio">
                                        <div class="panel-heading">Disponível</div>
                                        <label>
                                            <div class="panel-body">
                                                <input type="radio" name="optradio">3º Lote: R$ 150,00 até dia 00/00/0000
                                            </div>
                                        </label>
                                    </div>-->
                                </div>
                            </div>

                            <ul class="pager">
                                <li><a href="#" class="btn-lg">&laquo; Voltar</a></li>
                                <li><a href="#" class="btn-lg">Inscrever</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<!--<h1>Manter Inscrição - ${operacao}</h1>-->

        <form action="ManterInscricaoController?acao=confirmar${operacao}&corridaId=${corridaId}" method="post" name="frmManterInscricao">
            <table>
                <tr>
                    <td>Código do Inscrição:</td> 
                    <td><input type="text" name="txtIdInscricao" value="${inscricao.id}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Data da Compra:</td> 
                        <td><input type="text" name="txtDataCompraInscricao" value="${inscricao.dataCompra}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>
                    <!--                <tr>
                                        <td>Número de Peito:</td> 
                                        <td><input type="text" name="txtNumeroPeitoInscricao" value="${inscricao.numeroPeito}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                                    </tr>-->
                    <!--                <tr> 
                                        <td>Pago:</td> 
                                        <td>
                                            <select name="optPago" <c:if test="${operacao == 'Excluir'}"> disabled</c:if>>
                                                <option value="false" <c:if test="${inscricao.pago == false}"> selected</c:if>>Não</option>
                                                <option value="true" <c:if test="${inscricao.pago == true}"> selected</c:if>>Sim</option>
                                            </select>
                                        </td>
                                    </tr>-->
                    <!--                <tr>
                                        <td>Tempo Percorrido:</td> 
                                        <td><input type="text" name="txtTempoPercorridoInscricao" value="${inscricao.tempoPercorrido}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                                    </tr>-->

                    <!--FORMA DE PAGAMENTO-->

                    <tr>
                        <td>Atleta:</td>
                        <td>
                            <select name="optAtleta" <c:if test="${operacao == 'Excluir'}"> disabled</c:if>>
                            <option value="0" <c:if test="${inscricao.atleta.id == null}"> selected</c:if>> Selecione um atleta</option>  
                            <c:forEach items="${atletas}" var="atleta">
                                <option value="${atleta.id}" <c:if test="${inscricao.atletaId == atleta.id}"> selected</c:if>>${atleta.nome}</option>  
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Percurso:</td>
                    <td>
                        <select name="optPercurso" <c:if test="${operacao == 'Excluir'}"> disabled</c:if>>
                            <option value="0" <c:if test="${inscricao.percurso.id == null}"> selected</c:if>> Selecione um percurso</option>  
                            <c:forEach items="${percursos}" var="percurso">
                                <option value="${percurso.id}" <c:if test="${inscricao.percursoId == percurso.id}"> selected</c:if>>${percurso.corrida.nome} - ${percurso.quilometragem}km</option>  
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Kit:</td>
                    <td>
                        <select name="optKit" <c:if test="${operacao == 'Excluir'}"> disabled</c:if>>
                            <option value="0" <c:if test="${inscricao.kit.id == null}"> selected</c:if>> Selecione um kit</option>  
                            <c:forEach items="${kits}" var="kit">
                                <option value="${kit.id}" <c:if test="${inscricao.kitId == kit.id}"> selected</c:if>>${kit.nome}</option>  
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" name="btnConfirmar" value="Confirmar"/>
                    </td>
                </tr>
                <br>
                <tr>
                    <td><a href="index.jsp">Menu</a></td>
                </tr>
                <tr>
                    <td><a href="PesquisaInscricaoController">Voltar para pesquisa</a></td>
                </tr>
            </table>
        </form>
                            
        <!-- Bootstrap JS and jQuery -->
        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
        <script type="text/javascript" src="public/bootstrap/js/jquery-3.2.1.js"></script>
        <script type="text/javascript" src="public/bootstrap/js/bootstrap.js"></script>
    </body>
</html>
