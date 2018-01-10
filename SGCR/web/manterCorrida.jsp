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
        <script type="text/javascript" src="public/js/corrida.js"></script>

    </head>
    <body>
        <%@ include file = "layout/menu.jsp" %>

        <div class="container-fluid corpo corpo-adm">
            <ul class="breadcrumb">
                <li><a href="PesquisaCorridaController">Home</a></li>
                <li class="active">${operacao} Corrida</li>
                <li class="active">${corrida.nome}</li>
            </ul>
            <div class="row">
                <div class="col-md-12">
                    <c:choose>
                        <c:when test="${operacao=='Excluir'}">
                            <div class="alert alert-danger alert-dismissable fade in">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong><i class="fa fa-exclamation-circle"></i></strong> Ao excluir essa corrida você não poderá reverter essa ação.
                            </div>
                        </c:when>    
                    </c:choose>
                    <c:choose>
                        <c:when test="${mensagemErro!=null}">
                            <div class="alert alert-danger alert-dismissable fade in">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>Ops!</strong> ${mensagemErro} ${operacao}.
                            </div>
                        </c:when>    
                    </c:choose>
                    <div class="panel panel-primary">
                        <div class="panel-heading">${operacao} Corrida <span id="mostraNomeCorrida">Corrida da Felicidade de São João dos Nevez</span></div>

                        <ul class="nav nav-tabs">
                            <li <c:if test="${operacao != 'Excluir'}"> onclick="pagamento('corrida')"</c:if>><a data-toggle="tab" href="#corrida"><i class="fa fa-map-marker"></i> Corrida</a></li>
                            <li class="active" <c:if test="${operacao != 'Excluir'}"> onclick="pagamento('kit')"</c:if>><a data-toggle="tab" href="#kit"><i class="fa fa-shopping-bag"></i> Kits</a></li>
                            <li <c:if test="${operacao != 'Excluir'}"> onclick="pagamento('percurso')"</c:if>><a data-toggle="tab" href="#percurso"><i class="fa fa-map"></i> Percursos</a></li>
                            <li <c:if test="${operacao != 'Excluir'}"> onclick="pagamento('lote')"</c:if>><a data-toggle="tab" href="#lote"><i class="fa fa-ticket"></i> Lotes</a></li>    
                            </ul>
                        <c:choose>
                            <c:when test="${operacao=='Incluir'}">
                                <form action="ManterCorridaController?acao=confirmar${operacao}" method="post" name="frmManterCorrida" enctype="multipart/form-data">
                                </c:when>    
                            </c:choose>
                            <div class="tab-content">

                                <div id="corrida" class="tab-pane fade">
                                    <div class="panel-body">
                                        <c:choose>
                                            <c:when test="${operacao=='Editar'}">
                                                <form action="ManterCorridaController?acao=confirmar${operacao}" method="post" name="frmManterCorrida">
                                                </c:when>    
                                            </c:choose>
                                            <div class="col-md-4">
                                                <input type="hidden" class="form-control" id="codigo" name="hiddenIdCorrida" value="${corrida.id}" readonly />
                                                <input type="hidden" class="form-control" id="edicao" name="hiddenEdicao" value="${corrida.edicao}" readonly />
                                                <div class="form-group">
                                                    <label for="nomeCorrida">Nome:</label>
                                                    <input type="text" class="form-control" required id="nomeCorrida" onkeyup="escreveNome(this)" name="txtNomeCorrida" value="${corrida.nome}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if> />
                                                    </div>
                                                    <div class="form-group ">
                                                        <label for="numeroDePessoas">Máximo de Pessoas:</label>
                                                        <input type="number" class="form-control" required id="numeroDePessoas" name="txtMaxPessoaCorrida" maxlength="6" value="${corrida.maxPessoa}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                                    </div>      
                                                    <div class="row">
                                                        <div class="col-lg-6 col-md-12">
                                                            <div class="form-group">
                                                                <label for="dtCorrida">Data:</label>
                                                                <input type="text" class="form-control" required id="dtCorrida" name="txtDataCorrida" maxlength="10" onkeypress="mascaraData(this, event)" value="${corrida.data}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if> placeholder="__/__/____">
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6 col-md-12">
                                                            <div class="form-group">
                                                                <label for="horario">Horário:</label>
                                                                <input type="text" class="form-control" required id="horario"name="txtHorarioCorrida" value="${corrida.horario}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if> placeholder="hh:mm" maxlength="5">            
                                                            </div> 
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="dataRetiradaKit">Período de retirada de kits:</label>
                                                        <div class="row">
                                                            <div class="col-lg-6 col-md-12">
                                                                <input type="text" maxlength="10" required id="dataInicioRetiradaKit" class="form-control" name="txtDataInicioRetiradaKit" onkeypress="mascaraData(this, event)" value="" <c:if test="${operacao == 'Excluir'}"> readonly</c:if> placeholder="__/__/____">
                                                            </div>
                                                            <div class="col-lg-6 col-md-12">
                                                                <input type="text" maxlength="10" required id="dataFinalRetiradaKit" class="form-control" name="txtDataFinalRetiradaKit" onkeypress="mascaraData(this, event)" value="" <c:if test="${operacao == 'Excluir'}"> readonly</c:if> placeholder="__/__/____">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-4">             
                                                    <div class="form-group">
                                                        <label for="cep">CEP:</label>
                                                        <input type="text" class="form-control" id="cep" required name="txtCepCorrida" value="${corrida.cep}" onblur="pesquisacep(this.value);" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                                    </div> 
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-12">
                                                            <div class="form-group">
                                                                <label for="estado">UF:</label>
                                                                <input type="text" maxlength="2" class="form-control" required id="estado" name="txtEstadoCorrida" value="${corrida.estado}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-9 col-md-12">
                                                            <div class="form-group">
                                                                <label for="cidade">Cidade:</label>
                                                                <input type="text" class="form-control" required id="cidade" name="txtCidadeCorrida" value="${corrida.cidade}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                                            </div>  
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="logradouro">Logradouro:</label>
                                                        <input type="text" class="form-control" id="logradouro" required name="txtRuaCorrida" value="${corrida.logradouro}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-9 col-md-12">
                                                            <div class="form-group">
                                                                <label for="bairro">Bairro:</label>
                                                                <input type="text" class="form-control" id="bairro" required name="txtBairroCorrida" value="${corrida.bairro}"  <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-12">
                                                            <div class="form-group">
                                                                <label for="numero">Número:</label>
                                                                <input type="text" class="form-control" id="numero" maxlength="5" name="txtNumeroCorrida" value="${corrida.numero}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                                            </div> 
                                                        </div>
                                                    </div>

                                                    <div><input name="ibge" type="hidden" id="ibge" size="8"/><br/></div>

                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="descricao">Descrição:</label>
                                                        <textarea class="form-control" id="descricaoCorrida" required name="txtDescricaoCorrida" placeholder="Descrição da corrida" rows="12" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>${corrida.descricao}</textarea>       
                                                    </div>
                                                </div>
                                            <c:choose>
                                                <c:when test="${operacao=='Editar'}">
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <div class="col-md-12"> 
                                                                <button type="submit" name="btnConfirmar" class="btn btn-warning btn-block">Editar</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </c:when>    
                                        </c:choose>
                                    </div>
                                </div>


                                <div id="kit" class="tab-pane fade in active">
                                    <div class="panel-body">
                                        <!--<form action="ManterKitController?acao=confirmar${operacao}" method="post" name="frmManterKit">-->
                                        <div class="col-md-6">
                                            <div class="row">
                                                <c:choose>
                                                    <c:when test="${operacao=='Editar'}">
                                                        <form action="ManterKitController?acao=confirmarIncluir" method="post" enctype="multipart/form-data" name="frmManterKit">
                                                        </c:when>    
                                                    </c:choose>
                                                    <div class="col-md-12">   
                                                        <div class="form-group">
                                                            <input type="hidden" id="idCorrida" name="hiddenIdCorrida" value="${corrida.id}"/>
                                                            <input type="hidden" id="idKit" name="hiddenIdKit" />
                                                            <label for="nomeKit">Nome:</label>
                                                            <input type="text" class="form-control" id="nomeKit" name="nomeKit" placeholder="Nome (Ex: VIP, Normal, Único)" value="" <c:if test="${operacao == 'Excluir'}"> readonly</c:if> />
                                                            </div>            
                                                        </div>
                                                        <div  class="col-md-6">    
                                                            <div class="form-group">
                                                                <label for="valorKit">Preço:</label>
                                                                <input type="number" class="form-control" id="precoKit" name="precoKit" placeholder="Preço" value="" step=".05" <c:if test="${operacao == 'Excluir'}"> readonly</c:if> />
                                                            </div>            
                                                        </div>
                                                        <div class="col-md-6">  
                                                            <div class="form-group">
                                                                <label for="optTipoChip">Tipo do Chip:</label>
                                                                <select name="optTipoChip" id="tipoChipKit" class="form-control" <c:if test="${operacao == 'Excluir'}"> disabled</c:if>>
                                                                <option value="Descartavel" <c:if test="${kit.tipoChip == 'Descartavel'}"> selected</c:if>>Descartavel</option>
                                                                <option value="Retornavel" <c:if test="${kit.tipoChip == 'Retornavel'}"> selected</c:if>>Retornavel</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">    
                                                            <div class="form-group">
                                                                <label for="descricaoKit">Descrição:</label>
                                                                <textarea class="form-control" id="descricaoKit" name="descricaoKit" placeholder="Descrição dos produtos que irão compor o kit" rows="4" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></textarea>
                                                                <!--<input type="text" class="form-control" id="descricaoKit" name="descricaoKit" placeholder="Descrição"/>-->
                                                            </div>      
                                                            <div id="divImagemKit"></div>
                                                        </div>

                                                        <div class="col-sm-12">
                                                            <div class="row">
                                                                <div class="col-md-6">  
                                                                    <div class="form-group">
                                                                        <label class="btn btn-default btn-block">
                                                                            <i class="fa fa-image"></i> Imagem do kit <input type="file" onchange="escolherImagem(this)" id="fileUpload" name="fileImagemKit" class="form-control" value="${kit.imagem}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if> style="display: none">
                                                                        </label>
                                                                        <br><br>
                                                                        <div class="col-md-12" id="preview-kit" style="display: none">
                                                                            <div class="row">
                                                                                <!--<div class="col-md-6">-->
                                                                                <div class="panel panel-default panel-item panel-config">
                                                                                    <label class="label-kit-inscricao">
                                                                                        <div class="panel-body card-item">
                                                                                            <div class="div-img-inscricao" id="image-holder">
                                                                                                <!--                                                                                                <img src="imagesUpload/kit/kit-1.png" class="img-kit-inscricao">-->
                                                                                            </div>
                                                                                            <!--                                                                                            <p><b><span id="preview-nome">VIP</span> - R$ <span id="preview-preco">120,50</span></b></p>
                                                                                                                                                                                        <p class="descricao-item" id="preview-descricao">Bla  sad as d a ds as d asd bla blablao bla blem Bla bla blablao bla blem Bla bla blablao bla blem Bla bla blablao bla blem Bla bla blablao bla blem as</p>
                                                                                                                                                                                        <p><b><span id="preview-tipoChip">Descartável<span></b></p>-->
                                                                                        </div>
                                                                                    </label>
                                                                                </div>
                                                                                <!--</div>-->
                                                                            </div>
                                                                        </div>
                                                                        <!--<div id="image-holder"></div>-->
                                                                    </div>
                                                                </div>
                                                            <c:choose>
                                                                <c:when test="${operacao=='Editar'}">
                                                                    <div class="col-md-6" id="divAdicionaKit">
                                                                        <button class="btn btn-info btn-block" type="submit" id="adicionaKit" >Adicionar</button>
                                                                    </div>
                                                                </c:when>  
                                                                <c:otherwise>
                                                                    <div class="col-md-6" id="divAdicionaKit">
                                                                        <a class="btn btn-info btn-block" id="adicionaKit" onclick="Kit.adiciona()">Adicionar</a>
                                                                    </div>
                                                                </c:otherwise>
                                                            </c:choose>

                                                        </div>
                                                    </div>
                                            </div>
                                        </div>        
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <table class="table table-hover table-responsive">
                                                        <thead>
                                                            <tr>
                                                                <th>Nome</th>
                                                                <th>Preço</th>
                                                                <th>Tipo Chip</th>
                                                                <th colspan="2">
                                                            </tr>
                                                        </thead>
                                                        <tbody id="area-kits">
                                                            <c:choose>
                                                                <c:when test="${operacao == 'Editar'}">
                                                                    <c:forEach items="${kits}" var="kit">
                                                                        <tr id="kit${kit.id}">
                                                                    <div id="divImagemKit${kit.id}">
                                                                        <input type="hidden" class="form-control" name="txtImagemKit" id="txtImagemKitServidor${kit.id}" value="${kit.imagem}" />
                                                                    </div>
                                                                    <input type="hidden" class="form-control" name="txtNomeKit" id="txtNomeKit${kit.id}" value="${kit.nome}" />
                                                                    <input type="hidden" class="form-control" name="txtPrecoKit" id="txtPrecoKit${kit.id}" value="${kit.preco}" />
                                                                    <input type="hidden" class="form-control" name="txtTipoChipKit" id="txtTipoChipKit${kit.id}" value="${kit.tipoChip}" />
                                                                    <input type="hidden" class="form-control" name="txtDescricaoKit" id="txtDescricaoKit${kit.id}" value="${kit.descricao}" />

                                                                    <!--<td id="nomeKit${kit.imagem}"><c:out value="${kit.imagem}" /></td>-->
                                                                    <td id="nomeKit${kit.id}"><c:out value="${kit.nome}" /></td>
                                                                    <td id="precoKit${kit.id}"><c:out value="${kit.preco}" /></td>
                                                                    <td id="tipoChipKit${kit.id}"><c:out value="${kit.tipoChip}" /></td>

<!--                                                    <td id="descricaoKit${kit.id}"><c:out value="${kit.descricao}" /></td> -->
                                                                    <td style="width: 20px;"><a class="btn btn-success btn-xs" onclick="Kit.prepararEditarBD('${kit.id}')" ><i class="fa fa-pencil"></i></a></td>
                                                                    <td style="width: 20px;"><a class="btn btn-danger btn-xs" onclick="Kit.removeItemBD('${kit.id}')" ><i class="fa fa-trash"></i></a></td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </c:when>    
                                                        </c:choose>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <c:choose>
                                                    <c:when test="${operacao=='Editar'}">
                                                        </form>
                                                    </c:when>    
                                                </c:choose>
                                            </div>
                                            <c:choose>
                                                <c:when test="${operacao != 'Editar'}">
                                                    <div class="col-md-12" id="div-vazia-kits">
                                                        <div class="panel panel-default radio col-md-12 panel-config div-vazia">
                                                            <div class="panel-body text-center">
                                                                <span>Pelo menos um <b>kit</b> deve ser criado para que sua corrida possa ser publicada</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:when>    
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>



                                <div id="percurso" class="tab-pane fade">
                                    <div class="panel-body">
                                        <!--<form action="ManterPercursoController?acao=confirmar${operacao}" method="post" name="frmManterPercurso">-->                               
                                        <div class="row">
                                            <div class="col-md-6">
                                                <c:choose>
                                                    <c:when test="${operacao=='Editar'}">
                                                        <form action="ManterPercursoController?acao=confirmarIncluir" method="post" name="frmManterPercurso">
                                                        </c:when>    
                                                    </c:choose>
                                                    <div class="col-md-12"> 
                                                        <div class="form-group">
                                                            <input type="hidden" id="idCorrida" name="hiddenIdCorrida" value="${corrida.id}"/>
                                                            <input type="hidden" id="idPercurso" name="hiddenIdPercurso" />
                                                            <label for="numQuilometragemPercurso">Quilometragem:</label>
                                                            <input type="number" class="form-control" id="quilometragemPercurso" name="numQuilometragemPercurso" min="0.1" max="999" value="${percurso.quilometragem}" step=".1" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                                            </div>
                                                        </div>
                                                        <!--                                                    <div class="col-md-12"> 
                                                                                                                <div class="form-group">
                                                                                                                    <label for="fileImagemPercurso">Imagem:</label>
                                                                                                                    <input type="hidden" name="MAX_FILE_SIZE" value="4194304" />
                                                                                                                     Nao permir valores maiores que 4194304 (4MB) 
                                                                                                                    <input type="text" class="form-control" name="fileImagemPercurso" value="${percurso.imagem}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                                                                                                </div> 
                                                                                                            </div>-->

                                                        <div class="col-md-12">    
                                                            <div class="form-group">
                                                                <label for="descricaoPercurso">Descrição:</label>
                                                                <textarea class="form-control" id="descricaoPercurso" name="descricaoPercurso" placeholder="Descrição do caminho do percurso" rows="4" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>${percurso.descricao}</textarea>
                                                                <!--<input type="text" class="form-control" id="descricaoKit" name="descricaoKit" placeholder="Descrição"/>-->
                                                            </div>            
                                                        </div>
                                                        <div class="col-md-12"> 
                                                            <c:choose>
                                                                <c:when test="${operacao=='Editar'}">
                                                                    <div class="col-md-6" id="divCriaPercurso">
                                                                        <button class="btn btn-info btn-block" type="submit">Adicionar</button>
                                                                    </div>
                                                                </c:when>  
                                                                <c:otherwise>
                                                                    <div class="col-md-6" id="divCriaPercurso">
                                                                        <a class="btn btn-info btn-block" id="criaPercurso" onclick="criaPercurso()">Adicionar</a>
                                                                    </div>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                    <c:choose>
                                                        <c:when test="${operacao=='Editar'}">
                                                        </form>
                                                    </c:when>    
                                                </c:choose>
                                            </div>
                                            <div class="col-md-6">
                                                <table class="table table-hover table-responsive">
                                                    <thead>
                                                        <tr>
                                                            <th>Km</th>
                                                            <th>Descrição</th>
                                                            <th colspan="2"></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="area-percursos">
                                                        <c:choose>
                                                            <c:when test="${operacao == 'Editar'}">
                                                                <c:forEach items="${percursos}" var="percurso">
                                                                    <tr id="percurso${percurso.id}">
                                                                <input type="hidden" class="form-control" name="txtQuilometragemPercurso" id="txtQuilometragemPercurso${percurso.id}" value="${percurso.quilometragem}" />
                                                                <input type="hidden" class="form-control" name="txtDescricaoPercurso" id="txtDescricaoPercurso${percurso.id}" value="${percurso.descricao}" />

                                                                <td id="quilometragemPercurso${percurso.id}"><c:out value="${percurso.quilometragem}" /></td>
                                                                <td id="descricaoPercurso${percurso.id}"><c:out value="${percurso.descricao}" /></td>
                                                                <td style="width: 20px;"><a class="btn btn-success btn-xs" onclick="prepararEditarPercursoBD('${percurso.id}')" ><i class="fa fa-pencil"></i></a></td>
                                                                <td style="width: 20px;"><a class="btn btn-danger btn-xs" onclick="Percurso.removeItemBD('${percurso.id}')" ><i class="fa fa-trash"></i></a></td>
                                                                </tr>
                                                            </c:forEach>
                                                        </c:when>    
                                                    </c:choose>

                                                    </tbody>
                                                </table>
                                                <c:choose>
                                                    <c:when test="${operacao != 'Editar'}">
                                                        <div class="col-md-12" id="div-vazia-percursos">
                                                            <div class="panel panel-default radio col-md-12 panel-config div-vazia">
                                                                <div class="panel-body text-center">
                                                                    <span>Pelo menos um <b>percurso</b> deve ser criado para que sua corrida possa ser publicada</span>
                                                                </div>
                                                            </div>
                                                        </div> 
                                                    </c:when>    
                                                </c:choose>
                                            </div>
                                        </div>
                                        <!--</form>-->
                                    </div>
                                </div>


                                <div id="lote" class="tab-pane fade">
                                    <div class="panel-body">
                                        <!--<form action="ManterLoteController?acao=confirmar${operacao}" method="post" name="frmManterLote">--> 
                                        <div class="row">
                                            <div class="col-md-6">
                                                <input type="hidden" class="form-control" id="codigo" name="hiddenIdLote" value="${lote.id}" readonly />
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="tipoLote">Tipo:</label>
                                                        <input type="text" class="form-control" id="tipoLote" placeholder="(Ex: 1º Lote, Inscrição I)" name="tipoLote" value="${lote.tipo}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="preco">Preço:</label>
                                                            <input type="number" class="form-control" id="precoLote" placeholder="R$" name="precoLote" value="${lote.preco}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="dtInicio">Data de Início:</label>
                                                            <input type="text" class="form-control" id="dataInicioLote" placeholder="__/__/____" onkeypress="mascaraData(this, event)" name="dataInicioLote" value="${lote.dataInicio}" <c:if test="${operacao =='Excluir'}"> readonly</c:if> >
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="dtTermino">Data de Término:</label>
                                                            <input type="text" class="form-control" id="dataTerminoLote" placeholder="__/__/____" onkeypress="mascaraData(this, event)" name="dataFinalLote" value="${lote.dataFinal}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12"> 
                                                        <div class="form-group">
                                                            <div class="col-md-offset-3 col-md-6" id="divAdicionaLote">
                                                                <a class="btn btn-info btn-block" id="adicionaLote" onclick="Lote.adiciona()">Adicionar</a>
                                                            </div>
                                                        </div>
                                                    </div>  
                                                </div>
                                                <div class="col-md-6">
                                                    <table class="table table-hover table-responsive">
                                                        <thead>
                                                            <tr>
                                                                <th>Tipo</th>
                                                                <th>Preço</th>
                                                                <th colspan="2"></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="area-lotes">
                                                        <c:choose>
                                                            <c:when test="${operacao == 'Editar'}">
                                                                <c:forEach items="${lotes}" var="lote">
                                                                    <tr id="lote${lote.id}">
                                                                <input type="hidden" name="txtTipoLote" id="txtTipoLote${lote.id}" value="${lote.tipo}" />
                                                                <input type="hidden" name="txtPreco" id="txtPrecoLote${lote.id}" value="${lote.preco}" />
                                                                <input type="hidden" name="txtDataInicioLote" id="txtDataInicioLote${lote.id}" value="${lote.dataInicio}" />
                                                                <input type="hidden" name="txtDataTerminoLote" id="txtDataTerminoLote${lote.id}" value="${lote.dataFinal}" />

                                                                <td id="tipoLote${lote.id}"><c:out value="${lote.tipo}" /></td>
                                                                <td id="precoLote${lote.id}"><c:out value="${lote.preco}" /></td>
                                                                <td style="width: 20px;"><a class="btn btn-success btn-xs" onclick="Lote.prepararEditar('${lote.id}')" ><i class="fa fa-pencil"></i></a></td>
                                                                <td style="width: 20px;"><a class="btn btn-danger btn-xs" onclick="Lote.removeItem('lote${lote.id}')" ><i class="fa fa-trash"></i></a></td>
                                                                </tr>
                                                            </c:forEach>
                                                        </c:when>    
                                                    </c:choose>
                                                    </tbody>
                                                </table>
                                                <c:choose>
                                                    <c:when test="${operacao != 'Editar'}">
                                                        <div class="col-md-12" id="div-vazia-lotes">
                                                            <div class="panel panel-default radio col-md-12 panel-config div-vazia">
                                                                <div class="panel-body text-center">
                                                                    <span>Pelo menos um <b>lote</b> deve ser criado para que sua corrida possa ser publicada</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:when>    
                                                </c:choose>

                                            </div>
                                        </div>
                                        <!--</form>-->
                                    </div>
                                </div>
                            </div>
                            <c:choose>
                                <c:when test="${operacao!='Editar'}">
                                    <div class="panel-footer">
                                        <div class="row">
                                            <div class="col-md-8 col-md-offset-2"> 
                                                <!--                                        <div class="col-md-6"> 
                                                                                            <div class="form-group">
                                                                                                <div class="col-md-12"> 
                                                                                                    <button type="submit" name="btnConfirmar" class="btn btn-info btn-block" style="background-color: #563D7C; border-color: #421a7a;">Salvar como rascunho</button>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>  -->
                                                <div class=" col-md-offset-3 col-md-6"> 
                                                    <div class="form-group">
                                                        <div class="col-md-12"> 
                                                            <button type="submit" name="btnConfirmar" class="btn btn-success btn-block">Concluir</button>
                                                        </div>
                                                    </div>
                                                </div> 
                                            </div>
                                        </div>
                                    </div>
                                </c:when>
                            </c:choose>
                        </form>
                    </div>
                </div>     
            </div>
        </div>
    </div>
</div>              
</div>

<%@ include file = "layout/rodape.jsp" %>

<script>
    //    $("#fileUpload").on('change', function () {
    //
    //        if (typeof (FileReader) != "undefined") {
    //
    //            var image_holder = $("#image-holder");
    //            image_holder.empty();
    //
    //            var reader = new FileReader();
    //            reader.onload = function (e) {
    //                $("<img />", {
    //                    "src": e.target.result,
    //                    "class": "thumb-image"
    //                }).appendTo(image_holder);
    //            }
    //            image_holder.show();
    //            reader.readAsDataURL($(this)[0].files[0]);
    //        } else {
    //            alert("Este navegador nao suporta FileReader.");
    //        }
    //    });

    $(".form-control").on('input', function () {

    });

</script>

</body>
</html>
