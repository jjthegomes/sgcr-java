<%-- 
    Document   : menu
    Created on : 04/12/2017, 17:18:40
    Author     : rafael
--%>

<!--USUÁRIO DESLOGADO-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav class="navbar navbar-default navbar-fixed-top navbar-inverse" style="background-color: #2e353d">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/SGCR">Sistema de Corrida</a>
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
                    <a href="login.jsp" style="text-decoration: none" ><button type="button" class="btn btn-primary">Login</button> </a>
                    <a href="cadastro.jsp" style="text-decoration: none" ><button type="button" class="btn btn-primary">Cadastrar</button> </a>

                </div>
            </form>
        </div><!--/.navbar-collapse -->
    </div>
</nav>