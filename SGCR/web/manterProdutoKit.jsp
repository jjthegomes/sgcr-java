<%-- 
    Document   : manterProdutoKit
    Created on : 17/10/2017, 10:02:00
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
        <title>Manter ProdutoKit</title>
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
                                <li class="dropdown-header">Organizador</li>
                                <li><a href="#">Minha Conta</a></li>
                                <li><a href="#">Criar Corrida</a></li>
                                <li><a href="#">Alterar Corrida</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Sair</a></li>
                            </ul>
                        </li>
                    </ul>
                </div><!--/.navbar-collapse -->
            </div>
        </nav>

        <div class="container corpo">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-success">
                        <div class="panel-heading">Produto kit - ${operacao}</div>
                        <div class="panel-body">
                            <p><button class="btn btn-basic btn-info" >Digite suas informações abaixo:</button></p>
                            <form action="ManterProdutoKitController?acao=confirmar${operacao}" method="post" name="frmManterProdutoKit" >
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="codigocorrida">Corrida:</label>
                                        <select class="form-control" id="codigocorrida" name="optCorrida" <c:if test="${operacao == 'Excluir'}">disabled</c:if>>
                                            <option value="0" <c:if test="${produtoKit.corrida.id == null}"> selected</c:if>> </option>  
                                            <c:forEach items="${corridas}" var="corrida">
                                                <option value="${corrida.id}" <c:if test="${produtoKit.corridaId == corrida.id}"> selected</c:if>>${corrida.nome}</option>  
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="codigoKit">Kit:</label>
                                        <select class="form-control" id="codigoKit" name="optKit" <c:if test="${operacao == 'Excluir'}">disabled</c:if>>
                                            <option value="0" <c:if test="${produtoKit.kit.id == null}"> selected</c:if>> </option>  
                                            <c:forEach items="${kits}" var="kit">
                                                <option value="${kit.id}" <c:if test="${produtoKit.kitId == kit.id}"> selected</c:if>>${kit.nome}</option>  
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="codigoPro">Produto:</label>
                                        <select class="form-control" id="codigoPro" name="optProduto" <c:if test="${operacao == 'Excluir'}">disabled</c:if>>
                                            <option value="0" <c:if test="${produtoKit.produto.id == null}"> selected</c:if>> </option>  
                                            <c:forEach items="${produtos}" var="produto">
                                                <option value="${produto.id}" <c:if test="${produtoKit.produtoId == produto.id}"> selected</c:if>>${produto.nome}</option>  
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="codigo">Código:</label>
                                        <input type="text" class="form-control" id="codigo" name="txtIdProduto" value="${produtoKit.id}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if>>
                                        </div>
                                        <div class="form-group">
                                            <label for="descricao">Descrição</label>
                                            <input type="text" class="form-control" id="descricao" name="txtDescricao" value="${produtoKit.descricao}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        </div>
                                        <div class="form-group">
                                            <label for="valor">Valor:</label>
                                            <input type="text" class="form-control" id="valor" name="txtProdutoValor" value="${produtoKit.valor}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        </div>
                                        <div class="form-group">
                                            <a href="index.jsp" style="text-decoration: none" ><button type="button" class="btn btn-danger">Cancelar</button> </a>
                                            <input type="submit" name="btnConfirmar" value="Confirmar" class="btn btn-success" >

                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <h1>Manter Produto Kit - ${operacao}</h1>

        <form action="ManterProdutoKitController?acao=confirmar${operacao}" method="post" name="frmManterProdutoKit" >
            <table>
                <tr>
                    <td>Corrida:</td>
                    <td>
                        <select name="optCorrida" <c:if test="${operacao == 'Excluir'}">disabled</c:if>>
                            <option value="0" <c:if test="${produtoKit.corrida.id == null}"> selected</c:if>> </option>  
                            <c:forEach items="${corridas}" var="corrida">
                                <option value="${corrida.id}" <c:if test="${produtoKit.corridaId == corrida.id}"> selected</c:if>>${corrida.nome}</option>  
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Kit:</td>
                    <td>
                        <select name="optKit" <c:if test="${operacao == 'Excluir'}">disabled</c:if>>
                            <option value="0" <c:if test="${produtoKit.kit.id == null}"> selected</c:if>> </option>  
                            <c:forEach items="${kits}" var="kit">
                                <option value="${kit.id}" <c:if test="${produtoKit.kitId == kit.id}"> selected</c:if>>${kit.nome}</option>  
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Produto:</td>
                    <td>
                        <select name="optProduto" <c:if test="${operacao == 'Excluir'}">disabled</c:if>>
                            <option value="0" <c:if test="${produtoKit.produto.id == null}"> selected</c:if>> </option>  
                            <c:forEach items="${produtos}" var="produto">
                                <option value="${produto.id}" <c:if test="${produtoKit.produtoId == produto.id}"> selected</c:if>>${produto.nome}</option>  
                            </c:forEach>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>Código</td> 
                    <td><input type="text" name="txtIdProduto" value="${produtoKit.id}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Descrição</td> 
                        <td><input type="text" name="txtDescricao" value="${produtoKit.descricao}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Valor:</td> 
                        <td><input type="text" name="txtProdutoValor" value="${produtoKit.valor}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>

                <tr>
                    <td><input type="submit" name="btnConfirmar" value="Confirmar"></td>
                </tr>
                <br>
                <tr>
                    <td><a href="index.jsp">Menu</a></td>
                </tr>
                <tr>
                    <td><a href="PesquisaOrganizadorController">Voltar para pesquisa</a></td>
                </tr>
            </table>
        </form>       
    </body>
</html>
