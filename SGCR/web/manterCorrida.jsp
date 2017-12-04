<%-- 
    Document   : manterCorrida
    Created on : 17/10/2017, 09:54:57
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        
        <%@ include file = "layout/head.jsp" %>
        <title>Manter Corrida - ${operacao}</title>
        <script type="text/javascript" src="public/js/myscript.js"></script>

    </head>
    <body>
        <%@ include file = "layout/menuOrganizador.jsp" %>

        <div class="container corpo">
            <ul class="breadcrumb">
                <li><a href="index.jsp">Home</a></li>
                <li class="active">${operacao} Corrida</li>
            </ul>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">${operacao} Corrida</div>
                        <div class="panel-body">
                            <form action="ManterCorridaController?acao=confirmar${operacao}" method="post" name="frmManterCorrida"> 

                                <div class="form-group">
                                    <label for="idCorrida">Código:</label>
                                    <input type="text" class="form-control" id="codigo" name="txtIdCorrida" value="${corrida.id}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if> placeholder="Código">
                                    </div>
                                    <div class="form-group">                                   
                                        <select name="optOrganizador" class="form-control" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        <option value="0" <c:if test="${corrida.organizador.id== null}"> selected</c:if>>Selecione um Organizador</option>  
                                        <c:forEach items="${organizadores}" var="organizador">
                                            <option value="${organizador.id}" <c:if test="${corrida.organizadorId == organizador.id}"> selected</c:if>>${organizador.nome}</option>  
                                        </c:forEach>
                                    </select>
                                </div>           
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="nomeCorrida">Nome:</label>
                                        <input type="text" class="form-control" id="nomeCorrida" name="txtNomeCorrida" value="${corrida.nome}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if> placeholder="Título do evento">
                                        </div>
                                        <div class="form-group">
                                            <label for="descricao">Descrição:</label>
                                            <input type="text" class="form-control" id="descricao" name="txtDescricaoCorrida" value="${corrida.descricao}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if> placeholder="Descrição da corrida">            
                                        </div>
                                        <div class="form-group ">
                                            <label for="numeroDePessoas">Numero Máximo de Pessoas:</label>
                                            <input type="text" class="form-control" id="numeroDePessoas" name="txtMaxPessoaCorrida" value="${corrida.maxPessoa}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        </div>                                  
                                        <div class="form-group">
                                            <label for="dtCorrida">Data da Corrida:</label>
                                            <input type="text" class="form-control" id="dtCorrida" name="txtDataCorrida" value="${corrida.data}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if> placeholder="__/__/____">
                                        </div>
                                        <div class="form-group">
                                            <label for="horario">Horário</label>
                                            <input type="text" class="form-control" id="horario"name="txtHorarioCorrida" value="${corrida.horario}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if> placeholder="hh:mm:ss">            
                                        </div> 
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="cep">CEP:</label>
                                            <input type="text" class="form-control" id="cep" name="txtCepCorrida" value="${corrida.cep}" onblur="pesquisacep(this.value);" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        </div>                                   
                                        <div class="form-group">
                                            <label for="estado">Estado:</label>
                                            <input type="text" class="form-control" id="estado" name="txtEstadoCorrida" value="${corrida.estado}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        </div>
                                        <div class="form-group">
                                            <label for="cidade">Cidade:</label>
                                            <input type="text" class="form-control" id="cidade" name="txtCidadeCorrida" value="${corrida.cidade}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        </div>  
                                        <div class="form-group">
                                            <label for="logradouro">Logradouro:</label>
                                            <input type="text" class="form-control" id="logradouro" name="txtRuaCorrida" value="${corrida.logradouro}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        </div>
                                        <div class="form-group">
                                            <label for="bairro">Bairro:</label>
                                            <input type="text" class="form-control" id="bairro" name="txtBairroCorrida" value="${corrida.bairro}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        </div>
                                        <div><input name="ibge" type="hidden" id="ibge" size="8"/><br/></div>

                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="regulamento">Regulamento: </label>
                                            <!-- <input type="hidden" name="MAX_FILE_SIZE" value="4194304" /> 
                                             <input type="file"> -->
                                            <!-- Nao permir valores maiores que 4194304 (4MB) -->
                                            <input type="text" class="form-control" id="regulamento" name="txtRegulamentoCorrida" value="${corrida.regulamento}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        </div>
                                        <div class="form-group">
                                            <label for="banner">Banner: </label>
                                            <!-- <input type="hidden" name="MAX_FILE_SIZE" value="4194304" />
                                            <input type="file" > -->
                                            <!-- Nao permir valores maiores que 4194304 (4MB) -->

                                            <input type="text" class="form-control" id="banner" name="txtBannerCorrida" value="${corrida.banner}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if> > 
                                    </div>
                                    <div class="form-group">
                                        <a href="PesquisaCorridaController" style="text-decoration: none" ><button type="button" class="btn btn-danger">Cancelar</button> </a>
                                        <input type="submit" name="btnConfirmar" value="Confirmar" class="btn btn-success" >
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
