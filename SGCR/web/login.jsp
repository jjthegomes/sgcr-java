<%-- 
    Document   : login
    Created on : 21/12/2017, 08:23:53
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <%@ include file = "layout/head.jsp" %>

        <title>Login</title>

    </head>
    <body>
        <nav class="navbar navbar-default navbar-fixed-top navbar-inverse" style="background-color: #2e353d">
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
                        <a href="login.jsp" style="text-decoration: none" ><button type="button" class="btn btn-primary">Login</button> </a>
                    </form>
                </div><!--/.navbar-collapse -->
            </div>
        </nav>
        
        <div class="container corpo">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Login</div>
                        <div class="panel-body">
                            <form>
                                <div class="form-group">
                                    <label for="email">Email:</label>
                                    <input type="email" class="form-control" id="email">
                                </div>
                                <div class="form-group">
                                    <label for="senha">Senha:</label>
                                    <input type="password" class="form-control" id="senha">
                                </div>
                                <div class="form-group">
                                    <div class="radio-inline">
                                        <label><input type="radio" name="optradio">Administrador</label>
                                    </div>
                                    <div class="radio-inline">
                                        <label><input type="radio" name="optradio">Organizador</label>
                                    </div>
                                    <div class="radio-inline">
                                        <label><input type="radio" name="optradio" checked="checked">Atleta</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2">
                                        <button type="submit" class="btn btn-info btn-block">Entrar</button>
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
