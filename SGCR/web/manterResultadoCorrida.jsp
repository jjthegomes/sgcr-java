<%-- 
    Document   : inscluirResultadoCorrida
    Created on : 04/12/2017, 21:47:27
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file = "layout/head.jsp" %>
        <title>Incluir Resultado Prova</title>
    </head>
    <body>
        <%@ include file = "layout/menuOrganizador.jsp" %>
        <div class="container">
            <h2>Manter Resultado</h2>
            <h3>${corrida.nome}</h3>

            <table class="table table-bordered table-responsive table-hover">
                <thead>
                    <tr>
                        <th>Código</th>
                        <th>Nome</th>
                        <th>Email</th>
                        <th>CPF</th>
                        <th>Tempo Largada</th>
                        <th>Tempo Chegada</th>
                    </tr>
                </thead>
                <tbody>
                <form action="ManterResultadoCorridaController?acao=confirmarIncluir&corridaId=${corrida.id}" method="post">
                    <c:forEach items="${inscricoes}" var="inscricao">
                        <tr <c:if test="${inscricao.tempoChegada == ''}"> class="danger" </c:if>>
                            <td><c:out value="${inscricao.id}" /></td>    
                            <td><c:out value="${inscricao.atleta.nome}" /></td>
                            <td><c:out value="${inscricao.atleta.email}" /></td>
                            <td><c:out value="${inscricao.atleta.cpf}" /></td>
                            <td>
                                <label class="sr-only" for="tempoLargada">Tempo</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-clock-o" aria-hidden="true"></i></div>
                                    <input type="text" class="form-control" id="tempoLargada" name="tempoLargada${inscricao.id}" placeholder="00:00:00" maxlength="8" size="2"
                                           <c:if test="${inscricao.tempoLargada != '00:00:00'}">value='${inscricao.tempoLargada}'</c:if> 
                                               />
                                    </div>
                                </td>
                                <td>
                                    <label class="sr-only" for="tempoChegada">Tempo</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-clock-o" aria-hidden="true"></i></div>
                                        <input type="text" class="form-control" id="tempoChegada" name="tempoChegada${inscricao.id}" placeholder="00:00:00" maxlength="8" size="2"
                                           <c:if test="${inscricao.tempoChegada != '00:00:00'}">value='${inscricao.tempoChegada}'</c:if> 
                                               />
                                    </div>
                                </td>
                            </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="6">

                            <div class="col-md-4 col-md-offset-4">
                                <button type="submit" class="btn btn-success btn-block" name="btnIncluir" value="Incluir">Confirmar</button>
                            </div>
                        </td>
                    </tr>

                </form>
                </tbody>
            </table>

            <form action="ManterResultadoCorridaController?acao=escolherCorrida" method="post">
                <button type="submit" class="btn btn-success" name="btnIncluir" value="Incluir">Manter Resultado Corrida</button>
                <a href="index.jsp" class="btn btn-primary">Menu</a>
            </form>
        </div>
        <%@ include file = "layout/rodape.jsp" %>
    </body>
</html>
