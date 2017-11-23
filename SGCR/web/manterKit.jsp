<%-- 
    Document   : manterKit
    Created on : Oct 17, 2017, 9:30:45 AM
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="pragma" content="no-cache">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" type="text/css" href="public/bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" type="text/css" href="public/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="public/css/estilo.css">
        <title>Manter Kit</title>
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
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Organizador<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li class="dropdown-header">Nome | ORGANIZADOR</li>
                                <li class="active"><a href="#">Minha Conta</a></li>
                                <li><a href="#">Criar Evento</a></li>
                                <li><a href="#">Alterar Eventos</a></li>
                                <li><a href="#">Importar Dados</a></li>
                                <li><a href="#">Gerar Relatórios</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Sair</a></li>
                            </ul>           
                        </li>
                    </ul>
                </div><!--/.navbar-collapse -->
            </div>
        </nav>

        <div class="container corpo">
            <ul class="breadcrumb">
                <li><a href="index.jsp">Home</a></li>
                <li class="active">Manter Kit</li>
            </ul>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Manter Kit - ${operacao}</div>
                        <div class="panel-body">
                            <form action="ManterKitController?acao=confirmar${operacao}" method="post" name="frmManterKit">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="codigo">Código:</label>
                                        <input type="text" class="form-control" id="codigo" name="txtIdKit" value="${kit.id}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if> >
                                    </div>
                                </div>
                                <div class="col-md-6"> 
                                    <div class="form-group">
                                        <label for="nomeKit">Nome:</label>
                                        <input type="text" class="form-control" id="txtNomeKit" name="txtNomeKit" placeholder="Nome (Ex: VIP, Normal, Único)" value="${kit.nome}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if> />
                                    </div>            
                                    <div class="form-group">
                                        <label for="numQuantidadeKit">Quantidade</label>
                                        <input type="number" class="form-control" name="numQuantidadeKit" value="${kit.quantidade}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                    </div>
                                    <div class="form-group">
                                        <label for="numQuantidadeKit">Data de Retirada</label>
                                        <input type="text" class="form-control" name="txtDataRetiradaKit" value="${kit.dataRetirada}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                    </div>
                                </div>
                                
                                <div  class="col-md-6">
                                    <div class="form-group">
                                        <label for="fileImagemKit">Imagem </label>
                                        <input type="hidden" name="MAX_FILE_SIZE" value="4194304" />
                                        <!-- Nao permir valores maiores que 4194304 (4MB) -->
                                        <input type="txt" class="form-control" name="fileImagemKit" value="${kit.imagem}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                    </div> 
                                    <div class="form-group">
                                        <label for="fileImagemKit">Tipo do Chip</label>
                                        <select name="optTipoChip" class="form-control" <c:if test="${operacao == 'Excluir'}"> disabled</c:if>>
                                            <option value="Descartável" <c:if test="${kit.tipoChip == 'Descartável'}"> selected</c:if>>Descartável</option>
                                            <option value="Retornável" <c:if test="${kit.tipoChip == 'Retornável'}"> selected</c:if>>Retornável</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="fileImagemKit">Corrida </label>
                                        <select name="optCorrida" class="form-control" <c:if test="${operacao == 'Excluir'}"> disabled</c:if>>
                                            <option value="0" <c:if test="${kit.corrida.corridaId == null}"> selected</c:if>> Selecione uma corrida</option>  
                                            <c:forEach items="${corridas}" var="corrida">
                                                <option value="${corrida.id}" <c:if test="${kit.corridaId == corrida.id}"> selected</c:if>>${corrida.nome}</option>  
                                            </c:forEach>
                                        </select>
                                    </div>
                                    
                                    <div class="col-sm-6">
                                        <a href="PesquisaKitController" style="text-decoration: none;"><div class="btn btn-danger btn-block" >Voltar</div></a>
                                    </div>
                                    <div class="col-sm-6">
                                        <button type="submit" name="btnConfirmar" class="btn btn-success btn-block">Confirmar</button>
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
        <script type="text/javascript" src="public/bootstrap/js/bootstrap.js"></script>
    </body>
</html>
