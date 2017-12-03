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
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Manter Lote - ${operacao}</title>
        <meta http-equiv="pragma" content="no-cache">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" type="text/css" href="public/bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" type="text/css" href="public/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="public/css/estilo.css">
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
                    <a class="navbar-brand" href="index.jsp">Sistema de Corrida</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">

                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Nome Organizador<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li class="dropdown-header">Organizador</li>
                                <li><a href="#">Editar Dados</a></li>
                                <li><a href="#">Criar Corrida</a></li>
                                <li><a href="#">Editar Corridas</a></li>
                                <li><a href="#">Importar Dados</a></li>
                                <li><a href="#">Gerar Relatórios</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Sair</a></li>
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
                <li><a href="index.jsp">Home</a></li>
                <li class="active"> ${operacao} Ingresso</li>
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
                                        <label for="tipoIngresso">Tipo:</label>
                                        <input type="text" class="form-control" id="tipoIngresso" placeholder="" name="txtTipoLote" value="${lote.tipo}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
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

        <!-- Bootstrap JS and jQuery -->
        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
        <script type="text/javascript" src="public/bootstrap/js/jquery-3.2.1.js"></script>
        <script type="text/javascript" src="publicbootstrap/js/bootstrap.js"></script>
    </body>
</html>