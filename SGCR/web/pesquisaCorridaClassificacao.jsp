<%-- 
    Document   : manterRanking
    Created on : 17/10/2017, 09:31:01
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>

        <%@ include file = "layout/head.jsp" %>
        <title>Classificação</title>

    </head>

    <body>

        <%@ include file = "layout/menu.jsp" %>
        <div class="container-fluid corpo corpo-adm">
            
            
            <ul class="breadcrumb">
                <li><a href="PesquisaHomeController">Home</a></li>
                <li><a href="PesquisaRankingController?acao=visualizarClassificacao">Classificação</a></li>
                <li class="active">${corrida.nome}</li>
            </ul>
            
            <ul class="nav nav-tabs">
                <c:forEach items="${percursos}" var="percurso">
             
                    <li><a type="button" href="PesquisaRankingController?acao=visualizarClassificacao&corridaId=<c:out value="${corrida.id}"/>&percursoId=<c:out value="${percurso.id}"/>">
                          Percurso ${percurso.quilometragem}km 
     
                           </a></li>
                </c:forEach>
            </ul>
           
            <div class="tab-content">
                
                <div class="tab-pane active">
                <div class="panel-body">
                <table class="table table-hover table-responsive">
                    <thead>
                <tr>
                    <th>Colocação</th>
                    <th>Nome</th>
                    <th>Largada</th>
                    <th>Chegada</th> 
                    <th>Tempo Final</th> 
                </tr>
                </thead>
                <tbody>
                <script>
                    var i = 1; 
                </script>
                    <c:forEach items="${inscricoes}" var="inscricao">
                        
                        <tr>                   
                            <td><script>document.write(i++);</script></td>
                            <td><c:out value="${inscricao.atleta.nome}" /></td>
                            <td id="largada"><c:out value="${inscricao.tempoLargada}" /></td>
                            <td id="chegada"><c:out value="${inscricao.tempoChegada}" /></td>
                            <td><c:out value="${inscricao.tempoFinal}" /></td>
                        </tr>
                    </c:forEach>
                </tbody>
                    </table>
                    </div>
                </div>   
            </div>
            
            <%@ include file = "layout/rodape.jsp" %>
        </div>
    </body>
</html>
