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
        <meta http-equiv="pragma" content="no-cache">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" type="text/css" href="public/bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" type="text/css" href="public/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="public/css/estilo.css">
        <title>Inscrição</title>
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
                </div><!--/.navbar-collapse -->
            </div>
        </nav>
        
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
                            
                                <div class="col-sm-6">
                                    <a href="PesquisaInscricaoController" style="text-decoration: none;"><div class="btn btn-danger btn-block" >Voltar</div></a>
                                </div>
                                <div class="col-sm-6">
                                    <button type="submit" name="btnConfirmar" class="btn btn-success btn-block">Confirmar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <!-- Bootstrap JS and jQuery -->
        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
        <script type="text/javascript" src="public/bootstrap/js/jquery-3.2.1.js"></script>
        <script type="text/javascript" src="public/bootstrap/js/bootstrap.js"></script>
    </body>
</html>
