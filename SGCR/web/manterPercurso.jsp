<%-- 
    Document   : manterPercurso
    Created on : Oct 17, 2017, 10:06:38 AM
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
    <head>

        <%@ include file = "layout/head.jsp" %>
        <title>Manter Percurso</title>

    </head>
    <body>

        <%@ include file = "layout/menu.jsp" %>

        <div class="container-fluid corpo corpo-adm">
            <ul class="breadcrumb">
                <li><a href="index.jsp">Home</a></li>
                <li class="active">Manter Percurso</li>
            </ul>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Manter Percurso - ${operacao}</div>
                        <div class="panel-body">
                            <form action="ManterPercursoController?acao=confirmar${operacao}" method="post" name="frmManterPercurso">                               
                                <div class="col-md-6"> 
                                    <input type="hidden" class="form-control" id="codigo" name="hiddenIdPercurso" value="${percurso.id}" readonly />

                                    <div class="form-group">
                                        <label for="numQuilometragemPercurso">Quilometragem:</label>
                                        <input type="number" class="form-control" name="numQuilometragemPercurso" value="${percurso.quilometragem}" step=".1" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        </div>

                                        <div class="form-group">
                                            <label for="fileImagemPercurso">Imagem:</label>
                                            <input type="hidden" name="MAX_FILE_SIZE" value="4194304" />
                                            <!-- Nao permir valores maiores que 4194304 (4MB) -->
                                            <input type="text" class="form-control" name="fileImagemPercurso" value="${percurso.imagem}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        </div> 
                                    </div>
                                    <div class="col-md-6"> 

                                        <div class="form-group">
                                            <label for="descricaoPercurso">Descrição:</label>                                         
                                            <input type="text" class="form-control" name="descricaoPercurso" value="${percurso.descricao}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        </div> 

                                        <div class="form-group">
                                            <div class="col-sm-6">
                                                <a href="PesquisaPercursoController" style="text-decoration: none;"><div class="btn btn-danger btn-block" >Cancelar</div></a>
                                            </div>

                                            <div class="col-sm-6">
                                                <button type="submit" name="btnConfirmar" class="btn btn-success btn-block">Confirmar</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        <%@ include file = "layout/rodape.jsp" %>                            

    </body>
</html>
