<%-- 
    Document   : manterProduto
    Created on : 18/11/2017, 17:19:03
    Author     : ariel
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
        <title>Manter Produto</title>
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
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Administrador<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li class="dropdown-header">Administrador</li>
                                <li><a href="#">Minha Conta</a></li>
                                <li><a href="#">Criar Ranking</a></li>
                                <li><a href="#">Alterar Ranking</a></li>
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
                <li class="active">${operacao} Produto</li>
            </ul>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-success">
                        <div class="panel-heading">${operacao} Produto</div>
                        <div class="panel-body">
                            <p><label class="label label-primary" >Digite suas informações abaixo:</label></p>
                            <form action="ManterProdutoController?acao=confirmar${operacao}" method="post" name="frmManterProduto" >
                                    <div class="col-md-6">
                                        <div class="form-group">
                                        <label for="codigoAdm">Administrador:</label>
                                        <select class="form-control" id="codigoAdm" name="optAdministrador" <c:if test="${operacao == 'Excluir'}"> disabled</c:if>>
                                            <option value="0" <c:if test="${produto.administrador.id == null}"> selected</c:if>> </option>  
                                            <c:forEach items="${administradores}" var="administrador">
                                                <option value="${administrador.id}" <c:if test="${produto.administradorId == administrador.id}"> selected</c:if>>${administrador.nome}</option>  
                                            </c:forEach>
                                        </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="codigo">Código:</label>
                                            <input type="text" id="codigo" class="form-control" name="txtIdProduto" value="${produto.id}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if>>
                                        </div>
                                        
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="nome">Nome</label>
                                            <input type="text" id="nome" class="form-control" name="txtNome" value="${produto.nome}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-6">
                                                <a href="index.jsp" style="text-decoration: none" ><button type="button" class="btn btn-danger btn-block">Cancelar</button> </a>
                                            </div>
                                            <div class="col-md-6">
                                                <input type="submit" name="btnConfirmar" value="Confirmar" class="btn btn-success btn-block" >
                                            </div>
                                        </div>
                                    </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
     <script type="text/javascript" src="public/bootstrap/js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="public/bootstrap/js/bootstrap.js"></script>
    </body>
</html>
