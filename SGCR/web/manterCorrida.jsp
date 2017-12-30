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
        <%@ include file = "layout/menu.jsp" %>

        <div class="container-fluid corpo corpo-adm">
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
                                <div class="col-md-4">
                                    <input type="hidden" class="form-control" id="codigo" name="hiddenIdCorrida" value="${corrida.id}" readonly />
                                    <input type="hidden" class="form-control" id="edicao" name="hiddenEdicao" value="${corrida.edicao}" readonly />
                                    <div class="form-group">
                                        <label for="nomeCorrida">Nome:</label>
                                        <input type="text" class="form-control" id="nomeCorrida" name="txtNomeCorrida" value="${corrida.nome}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if> />
                                        </div>
                                        <div class="form-group">
                                            <label for="descricao">Descrição:</label>
                                            <input type="text" class="form-control" id="descricao" name="txtDescricaoCorrida" value="${corrida.descricao}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if> >            
                                        </div>
                                        <div class="form-group ">
                                            <label for="numeroDePessoas">Numero Máximo de Pessoas:</label>
                                            <input type="text" class="form-control" id="numeroDePessoas" name="txtMaxPessoaCorrida" value="${corrida.maxPessoa}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        </div>                                  
                                        <div class="form-group">
                                            <label for="dtCorrida">Data da Corrida:</label>
                                            <input type="text" class="form-control" id="dtCorrida" name="txtDataCorrida" onkeypress="mascaraData(this, event)" value="${corrida.data}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if> placeholder="__/__/____">
                                        </div>
                                        <div class="form-group">
                                            <label for="horario">Horário:</label>
                                            <input type="text" class="form-control" id="horario"name="txtHorarioCorrida" value="${corrida.horario}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if> placeholder="hh:mm:ss">            
                                        </div> 
                                        <div class="form-group">
                                            <label for="cep">CEP:</label>
                                            <input type="text" class="form-control" id="cep" name="txtCepCorrida" value="${corrida.cep}" onblur="pesquisacep(this.value);" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        </div> 
                                    </div>

                                    <div class="col-md-4" style>                                       
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
                                        <div class="form-group">
                                            <label for="numero">Número:</label>
                                            <input type="text" class="form-control" id="numero" name="txtNumeroCorrida" value="${corrida.numero}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        </div> 
                                        <div><input name="ibge" type="hidden" id="ibge" size="8"/><br/></div>

                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                           <!-- <label  for="regulamento">Regulamento: </label>-->
                                            <!-- <input type="hidden" name="MAX_FILE_SIZE" value="4194304" /> 
                                             <input type="file"> -->
                                            <!-- Nao permir valores maiores que 4194304 (4MB) -->
                                            <input type="hidden" class="form-control" id="regulamento" name="txtRegulamentoCorrida" value="4194304 value="${corrida.regulamento}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        </div>
                                        <div class="form-group">
                                            <!--<label for="banner">Banner: </label>-->
                                            <!-- <input type="hidden" name="MAX_FILE_SIZE" value="4194304" />
                                            <input type="file" > -->
                                            <!-- Nao permir valores maiores que 4194304 (4MB) -->

                                            <input type="hidden" class="form-control" id="banner" name="txtBannerCorrida" value="${corrida.banner}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if> > 
                                        </div>
                                        <div class="form-group">
                                            <label for="optStatus">Status:</label> 
                                            <div class="radio-inline">
                                                <label><input type="radio" id="ativo" name="optStatus" value="true" <c:if test="${operacao == 'Excluir'}"> readonly</c:if> 
                                                          <c:if test="${corrida.ativo == 'true'}"> checked</c:if>>Ativo</label>
                                            </div>
                                            <div class="radio-inline">
                                                <label><input type="radio" id="desativado" name="optStatus" value="false" <c:if test="${operacao == 'Excluir'}"> readonly</c:if> 
                                                          <c:if test="${corrida.ativo == 'false'}">checked</c:if>>Desativado</label>
                                            </div>                                                
                                        </div>
                                        <div class="form-group">
                                            <a href="PesquisaCorridaController" style="text-decoration: none" ><button type="button" class="btn btn-danger">Cancelar</button> </a>
                                            <input type="submit" name="btnConfirmar" value="Confirmar" class="btn btn-success" >
                                            <input type="button" onclick="confimarSalvarCorrida()" name="btnConfirmar" value="Teste" class="btn btn-success" >
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    
                 <div class="col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">Inportar Kit</div>
                            <div class="panel-body">
                                <div class="col-md-12">
                                    <div class="form-group">                                   
                                        <select id="kit" name="optKit" class="form-control" <c:if test="${operacao == 'Excluir'}">readonly</c:if>>
                                            <option value="0" <c:if test="${kit.id== null}"> selected</c:if>>Selecione uma Corrida:</option>  
                                            <c:forEach items="${kits}" var="kit">
                                                <option value="${kit.id}">${kit.nome}</option>  
                                            </c:forEach>
                                            <option value="0">Kit 1</option>
                                            <option value="0" >Kit 2</option>
                                            
                                        </select>
                                    </div>
                                    <div  class="col-md-12">    
                                        <div class="form-group">
                                            <label for="nomeKit">Nome:</label>
                                            <input type="text" class="form-control" id="nomeKit" name="nomeKit" placeholder="Nome" />
                                        </div>            
                                    </div>
                                    <div  class="col-md-12">    
                                        <div class="form-group">
                                            <label for="produtosKit">Produtos:</label>
                                            <input type="text" class="form-control" id="produtosKit" name="produtosKit" placeholder="Produtos"/>
                                        </div>            
                                    </div>
                                    <div  class="col-md-12">    
                                        <div class="form-group">
                                            <label for="valorKit">Preço:</label>
                                            <input type="text" class="form-control" id="precoKit" name="precoKit" placeholder="Preço"/>
                                        </div>            
                                    </div>
                                    <div class="col-sm-12">
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <button onclick="limparImportarKit()" class="btn btn-danger btn-block" >Cancelar</button>
                                                </div>
                                                <div class="col-sm-6">
                                                    <button type="submit" name="btnConfirmar" class="btn btn-success btn-block">Confirmar</button>
                                                </div>
                                            </div>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <div class="col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">${operacao} Kit </div>
                        <div class="panel-body">
                            <form action="ManterKitController?acao=confirmar${operacao}" method="post" name="frmManterKit">
                                <div class="col-md-12">
                                    <input type="hidden" class="form-control" id="codigo" name="hiddenIdKit" value="${kit.id}" readonly />
                                    <div  class="col-md-12">    
                                        <div class="form-group">
                                            <label for="nomeKit">Nome:</label>
                                            <input type="text" class="form-control" id="txtNomeKit" name="txtNomeKit" placeholder="Nome (Ex: VIP, Normal, Único)" value="${kit.nome}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if> />
                                            </div>            
                                        </div>
                                        <div  class="col-md-12">  
                                            <div class="form-group">
                                                <label for="fileImagemKit">Imagem</label>
                                                <input type="hidden" name="MAX_FILE_SIZE" value="4194304" />
                                                <!-- Nao permir valores maiores que 4194304 (4MB) -->
                                                <input type="text" class="form-control" name="fileImagemKit" value="${kit.imagem}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                            </div>
                                        </div>
                                        <div  class="col-md-12">  
                                            <div class="form-group">
                                                <label for="optTipoChip">Tipo do Chip</label>
                                                <select name="optTipoChip" class="form-control" <c:if test="${operacao == 'Excluir'}"> disabled</c:if>>
                                                <option value="Descartável" <c:if test="${kit.tipoChip == 'Descartável'}"> selected</c:if>>Descartável</option>
                                                <option value="Retornável" <c:if test="${kit.tipoChip == 'Retornável'}"> selected</c:if>>Retornável</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="txtDataRetiradaKit">Data Início Retirada</label>
                                                        <input type="text" maxlength="10" class="form-control" name="txtDataInicioRetiradaKit" onkeypress="mascaraData(this, event)" value="${kit.dataInicioRetirada}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="txtDataRetiradaKit">Data Final Retirada</label>
                                                        <input type="text" maxlength="10" class="form-control" name="txtDataFinalRetiradaKit" onkeypress="mascaraData(this, event)" value="${kit.dataFinalRetirada}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="txtPrecoKit">Preço:</label>
                                                        <input type="text" maxlength="10" class="form-control" name="txtPrecoKit" placeholder="R$" value="${kit.preco}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <a href="PesquisaKitController" class="btn btn-danger btn-block" >Cancelar</a>
                                                </div>
                                                <div class="col-sm-6">
                                                    <button type="submit" name="btnConfirmar" class="btn btn-success btn-block">Confirmar</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </form>                             
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading"> ${operacao} Lote</div>
                        <div class="panel-body">
                            <form action="ManterLoteController?acao=confirmar${operacao}" method="post" name="frmManterLote"> 
                                <input type="hidden" class="form-control" id="codigo" name="hiddenIdLote" value="${lote.id}" readonly />
                                
                                <div class="form-group">
                                    <div class="form-group">                                   
                                        <select name="optCorrida" class="form-control" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        <option value="0" <c:if test="${lote.corrida.id== null}"> selected</c:if>>Selecione uma Corrida:</option>  
                                        <c:forEach items="${corridas}" var="corrida">
                                            <option value="${corrida.id}" <c:if test="${lote.corridaId == corrida.id}"> selected</c:if>>${corrida.nome}</option>  
                                        </c:forEach>
                                    </select>
                                </div>  

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="tipoLote">Tipo:</label>
                                        <input type="text" class="form-control" id="tipoLote" placeholder="" name="txtTipoLote" value="${lote.tipo}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        </div>
                                        <div class="form-group">
                                            <label for="preco">Preço:</label>
                                            <input type="text" class="form-control" id="preco" placeholder="R$" name="txtPrecoLote" value="${lote.preco}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="dtInicio">Data de Início:</label>
                                            <input type="text" class="form-control" id="dtInicio" placeholder="__/__/____" onkeypress="mascaraData(this, event)" name="txtDataInicioLote" value="${lote.dataInicio}" <c:if test="${operacao =='Excluir'}"> readonly</c:if> >
                                        </div>
                                        <div class="form-group">
                                            <label for="dtTermino">Data de Término:</label>
                                            <input type="text" class="form-control" id="dtTermino" placeholder="__/__/____" onkeypress="mascaraData(this, event)" name="txtDataFinalLote" value="${lote.dataFinal}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                        </div>
                                        <div class="form-group">
                                            <a href="PesquisaLoteController" style="text-decoration: none" ><button type="button" class="btn btn-danger">Cancelar</button> </a>
                                            <input type="submit" name="btnConfirmar" value="Confirmar" class="btn btn-success" >
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Importar Percurso</div>
                        <div class="panel-body">
                            <div class="form-group">                                   
                                <select id="percurso" name="optKit" class="form-control" <c:if test="${operacao == 'Excluir'}">readonly</c:if>>
                                    <option value="0" <c:if test="${percusso.id== null}"> selected</c:if>>Selecione um Percurso:</option>  
                                    <c:forEach items="${percursos}" var="percurso">
                                        <option value="${percurso.id}">${percurso.id}</option>  
                                    </c:forEach>
                                    <option value="0">Percurso 1</option>
                                    <option value="0">Percurso 2</option>
                                </select>
                            </div>
                                    <div  class="col-md-12">    
                                        <div class="form-group">
                                            <label for="quilometragem">Quilometragem:</label>
                                            <input type="text" class="form-control" id="quilometragem" name="quilometragem" placeholder="Quilometragem" />
                                        </div>            
                                    </div>
                                    <div  class="col-md-12">    
                                        <div class="form-group">
                                            <label for="descricao">Descrição:</label>
                                            <input type="text" class="form-control" id="descricao" name="descricao" placeholder="Descrição"/>
                                        </div>            
                                    </div>
                                    <div class="col-sm-12">
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <button onclick="limparImportarKit()" class="btn btn-danger btn-block" >Cancelar</button>
                                                </div>
                                                <div class="col-sm-6">
                                                    <button type="submit" name="btnConfirmar" class="btn btn-success btn-block">Confirmar</button>
                                                </div>
                                            </div>
                                        </div>
                        </div>
                        
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">${operacao} Percurso</div>
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
