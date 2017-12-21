<%-- 
    Document   : dashboard
    Created on : 15/12/2017, 10:31:07
    Author     : rafael
--%>

<%-- 
    Document   : escolherCorridaInscricao
    Created on : 12/10/2017, 00:55:23
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <%@ include file = "layout/head.jsp" %>
        <title>Dashboard</title>
    </head>
    <body>
        <%@ include file = "layout/menuAdministrador.jsp" %>

        <div class="corpo container-fluid corpo-adm">
<!--            <div class="row">
                <div class="col-md-6 col-lg-4">                      
                    <div class="panel panel-info mouse-up" >
                        <div class="panel-heading"><i class="fa fa-bell-o" aria-hidden="true"></i> Nova Corrida</div>
                        <div class="panel-body corrida-info">
                            <div class="corrida-info-conteudo">
                                <p><span>Uma nova corrida foi cadastrada</span></p>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vel turpis tempus risus consequat iaculis</p>
                            </div>
                            <p><b>...</b></p>
                        </div>
                        <div class="panel-footer">
                            <a style="text-decoration: none" href="#">
                                <button class="btn btn-block btn-success"> Visualizar </button> 
                            </a>   
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-8">                      
                    <div class="panel panel-warning mouse-up" >
                        <div class="panel-heading"><i class="fa fa-bell-o" aria-hidden="true"></i> Tarefas pendentes</div>
                        <div class="panel-body corrida-info">
                            <div class="corrida-info-conteudo">
                                <p><span>Criar opções interessantes para o administrador fazer</span></p>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vel turpis tempus risus consequat iaculis</p>
                            </div>
                            <p><b>...</b></p>
                        </div>
                        <div class="panel-footer">
                            <div class="row">
                                <div class="col-md-6">
                                    <a style="text-decoration: none" href="#">
                                        <button class="btn btn-block btn-success"> Continuar </button> 
                                    </a>   
                                </div>
                                <div class="col-md-6">
                                    <a style="text-decoration: none" href="#">
                                        <button class="btn btn-block btn-danger"> Cancelar </button> 
                                    </a>   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>-->
        </div>

        <script type="text/javascript" src="public/js/myscript.js"></script>
        <%@ include file = "layout/rodape.jsp" %>

    </body>
</html>

