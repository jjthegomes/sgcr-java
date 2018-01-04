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
                <li><a href="index.jsp">Home</a></li>
                <li class="active">${operacao} Corrida</li>
            </ul>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">${operacao} Corrida</div>

                        <ul class="nav nav-tabs">
                            <li <c:if test="${operacao != 'Excluir'}"> onclick="pagamento('corrida')"</c:if>><a data-toggle="tab" href="#corrida"><i class="fa fa-map-marker"></i> Corrida</a></li>
                            <li <c:if test="${operacao != 'Excluir'}"> onclick="pagamento('kit')"</c:if>><a data-toggle="tab" href="#kit"><i class="fa fa-shopping-bag"></i> Kits</a></li>
                            <li <c:if test="${operacao != 'Excluir'}"> onclick="pagamento('percurso')"</c:if>><a data-toggle="tab" href="#percurso"><i class="fa fa-map"></i> Percursos</a></li>
                            <li class="active" <c:if test="${operacao != 'Excluir'}"> onclick="pagamento('lote')"</c:if>><a data-toggle="tab" href="#lote"><i class="fa fa-ticket"></i> Lotes</a></li>    
                            </ul>
                            <form action="ManterCorridaController?acao=confirmar${operacao}" method="post" name="frmManterCorrida">

                            <div class="tab-content">

                                <div id="corrida" class="tab-pane fade">
                                    <div class="panel-body">

                                        <div class="col-md-4">
                                            <input type="hidden" class="form-control" id="codigo" name="hiddenIdCorrida" value="${corrida.id}" readonly />
                                            <input type="hidden" class="form-control" id="edicao" name="hiddenEdicao" value="${corrida.edicao}" readonly />
                                            <div class="form-group">
                                                <label for="nomeCorrida">Nome:</label>
                                                <input type="text" class="form-control" id="nomeCorrida" name="txtNomeCorrida" value="${corrida.nome}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if> />
                                                </div>
                                                <div class="form-group ">
                                                    <label for="numeroDePessoas">Máximo de Pessoas:</label>
                                                    <input type="number" class="form-control" id="numeroDePessoas" name="txtMaxPessoaCorrida" value="${corrida.maxPessoa}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
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

                                            <div class="col-md-4">                                       
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
                                                    <label for="descricao">Descrição:</label>
                                                    <textarea class="form-control" id="descricaoCorrida" name="txtDescricaoCorrida" placeholder="Descrição da corrida" rows="16" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>${corrida.descricao}</textarea>       
                                                </div>
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
                                            </div>

                                        </div>
                                    </div>

                                    <div id="kit" class="tab-pane fade">
                                        <div class="panel-body">
                                            <!--<form action="ManterKitController?acao=confirmar${operacao}" method="post" name="frmManterKit">-->
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-md-12">   
                                                    <div class="form-group">
                                                        <label for="nomeKit">Nome:</label>
                                                        <input type="text" class="form-control" id="nomeKit" name="nomeKit" placeholder="Nome (Ex: VIP, Normal, Único)" value="" <c:if test="${operacao == 'Excluir'}"> readonly</c:if> />
                                                        </div>            
                                                    </div>
                                                    <div  class="col-md-6">    
                                                        <div class="form-group">
                                                            <label for="valorKit">Preço:</label>
                                                            <input type="number" class="form-control" id="precoKit" name="precoKit" placeholder="Preço" value="" <c:if test="${operacao == 'Excluir'}"> readonly</c:if> />
                                                        </div>            
                                                    </div>
                                                    <div class="col-md-6">  
                                                        <div class="form-group">
                                                            <label for="optTipoChip">Tipo do Chip:</label>
                                                            <select name="optTipoChip" id="tipoChipKit" class="form-control" <c:if test="${operacao == 'Excluir'}"> disabled</c:if>>
                                                            <option value="Descartável" <c:if test="${kit.tipoChip == 'Descartável'}"> selected</c:if>>Descartável</option>
                                                            <option value="Retornável" <c:if test="${kit.tipoChip == 'Retornável'}"> selected</c:if>>Retornável</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">    
                                                        <div class="form-group">
                                                            <label for="descricaoKit">Descrição:</label>
                                                            <textarea class="form-control" id="descricaoKit" name="descricaoKit" placeholder="Descrição dos produtos que irão compor o kit" rows="4" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></textarea>
                                                            <!--<input type="text" class="form-control" id="descricaoKit" name="descricaoKit" placeholder="Descrição"/>-->
                                                        </div>            
                                                    </div>

                                                    <!--                                            <div class="col-md-12">  
                                                                                                    <div class="form-group">
                                                                                                        <label for="fileImagemKit">Imagem</label>
                                                                                                        <input type="hidden" name="MAX_FILE_SIZE" value="4194304" />
                                                                                                         Nao permir valores maiores que 4194304 (4MB) 
                                                                                                        <input type="text" class="form-control" name="fileImagemKit" value="${kit.imagem}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                                                                                    </div>
                                                                                                </div>-->

                                                    <div class="col-md-12">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="dataRetiradaKit">Data Início Retirada:</label>
                                                                    <input type="text" maxlength="10" id="dataInicioRetiradaKit" class="form-control" name="dataInicioRetiradaKit" onkeypress="mascaraData(this, event)" value="" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="dataRetiradaKit">Data Final Retirada:</label>
                                                                    <input type="text" maxlength="10" id="dataFinalRetiradaKit" class="form-control" name="dataFinalRetiradaKit" onkeypress="mascaraData(this, event)" value="" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-12">
                                                        <div class="row">
                                                            <!--                                                            <div class="col-sm-6">
                                                                                                                            <a href="PesquisaKitController" class="btn btn-danger btn-block" >Cancelar</a>
                                                                                                                        </div>-->
                                                            <div class="col-md-offset-3 col-md-6" id="divAdicionaKit">
                                                                <a class="btn btn-info btn-block" id="adicionaKit" onclick="Kit.adiciona()">Adicionar</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>        
                                            <div class="col-md-6">
                                                <table class="table table-hover table-responsive">
                                                    <thead>
                                                        <tr>
                                                            <th>Nome</th>
                                                            <th>Preço</th>
                                                            <th>Tipo Chip</th>
                                                            <!--                                                            <th>Descrição</th>
                                                                                                                        <th colspan="2">Retirada</th>-->
                                                            <th colspan="2">
                                                        </tr>
                                                    </thead>
                                                    <tbody id="area-kits">

                                                    </tbody>
                                                </table>
                                                <div class="col-md-12" id="div-vazia-kits">
                                                    <div class="panel panel-default radio col-md-12 panel-config div-vazia">
                                                        <div class="panel-body text-center">
                                                            <span>Pelo menos um <b>kit</b> deve ser criado para que sua corrida possa ser publicada</span>
                                                        </div>
                                                    </div>
                                                </div> 
                                            </div>
                                            <!--</form>-->
                                        </div>
                                    </div>

                                    <div id="percurso" class="tab-pane fade">
                                        <div class="panel-body">
                                            <!--<form action="ManterPercursoController?acao=confirmar${operacao}" method="post" name="frmManterPercurso">-->                               
                                        <div class="row">
                                            <div class="col-md-6">

                                                <div class="col-md-12"> 
                                                    <div class="form-group">
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
                                                        <div class="form-group">
                                                            <div class="col-md-offset-3 col-md-6" id="divCriaPercurso">
                                                                <a class="btn btn-info btn-block" id="criaPercurso" onclick="criaPercurso()">Adicionar</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <table class="table table-hover table-responsive">
                                                        <thead>
                                                            <tr>
                                                                <th>Km</th>
                                                                <th>Descrição</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="area-percursos">

                                                        </tbody>
                                                    </table>
                                                    <div class="col-md-12" id="div-vazia-percursos">
                                                        <div class="panel panel-default radio col-md-12 panel-config div-vazia">
                                                            <div class="panel-body text-center">
                                                                <span>Pelo menos um <b>percurso</b> deve ser criado para que sua corrida possa ser publicada</span>
                                                            </div>
                                                        </div>
                                                    </div> 
                                                </div>
                                            </div>
                                            <!--</form>-->
                                        </div>
                                    </div>


                                    <div id="lote" class="tab-pane fade in active">
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

                                                        </tbody>
                                                    </table>
                                                    <div class="col-md-12" id="div-vazia-lotes">
                                                        <div class="panel panel-default radio col-md-12 panel-config div-vazia">
                                                            <div class="panel-body text-center">
                                                                <span>Pelo menos um <b>lote</b> deve ser criado para que sua corrida possa ser publicada</span>
                                                            </div>
                                                        </div>
                                                    </div> 
                                                </div>
                                            </div>
                                            <!--</form>-->
                                        </div>
                                    </div>
                                </div>
                                <div class="panel-footer">
                                    <div class="row">
                                        <div class="col-md-8 col-md-offset-2"> 
                                            <div class="col-md-6"> 
                                                <div class="form-group">
                                                    <div class="col-md-12"> 
                                                        <button type="submit" name="btnConfirmar" class="btn btn-info btn-block" style="background-color: #563D7C; border-color: #421a7a;">Salvar como rascunho</button>
                                                    </div>
                                                </div>
                                            </div>  
                                            <div class="col-md-6"> 
                                                <div class="form-group">
                                                    <div class="col-md-12"> 
                                                        <button type="submit" name="btnConfirmar" class="btn btn-success btn-block">Salvar e publicar</button>
                                                    </div>
                                                </div>
                                            </div> 
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>     
                </div>
            </div>
        </div>
    </div>              
</div>

<%@ include file = "layout/rodape.jsp" %>

</body>
</html>
