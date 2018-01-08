<%-- 
    Document   : manterOrganizador
    Created on : Oct 17, 2017, 10:14:45 AM
    Author     : RAJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
    <head>

        <%@ include file = "layout/head.jsp" %>
        <script type="text/javascript" src="public/js/myscript.js"></script>
        <title>${operacao} Organizador</title>

    </head>
    <body>

        <%@ include file = "layout/menu.jsp" %>
        <c:choose>
            <c:when test="${operacao == 'Editar'}">
                <div class="container-fluid corpo corpo-adm">
                </c:when> 
                <c:when test="${operacao !='Editar'}">
                    <div class="container corpo">
                    </c:when> 
                </c:choose>
                <ul class="breadcrumb">
                    <li><a href="dashboard.jsp">Home</a></li>
                    <li class="active"> ${operacao} Organizador</li>
                </ul>
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading"> ${operacao} Organizador</div>

                            <div class="panel-body">
                                <form action="ManterOrganizadorController?acao=confirmar${operacao}" method="post" name="frmManterOrganizador">
                                    <input type="hidden" class="form-control" id="codigo" name="hiddenIdOrganizador" value="${organizador.id}" readonly />
                                    <div class="col-md-4">   
                                        <div class="form-group">
                                            <label for="Nome">Nome Completo:</label>
                                            <input type="text" name="txtNomeOrganizador" class="form-control" required value="${organizador.nome}" 
                                                   <c:if test="${operacao == 'Excluir'}"> readonly</c:if>
                                                       id="nome"
                                                       />
                                            </div>              
                                            <div class="form-group">
                                                <label for="dtNasc">Data Nascimento:</label>
                                                <input type="text" name="txtDataNascimentoOrganizador" value="${organizador.dataNascimento}" 
                                                   <c:if test="${operacao == 'Excluir'}"> readonly</c:if>
                                                       class="form-control" 
                                                       id="dtNasc" 
                                                       placeholder="__/__/____" required onkeypress="mascaraData(this, event)"
                                                       />
                                            </div>
                                            <div class="form-group">
                                                <label for="cpf">CPF:</label>
                                                <input type="text" name="txtCpfOrganizador" value="${organizador.cpf}" 
                                                   <c:if test="${operacao == 'Excluir'}"> readonly</c:if>
                                                       class="form-control"
                                                       id="cpf" 
                                                       placeholder="xxx.xxx.xxx-xx" required onkeydown="javascript: fMasc(this, mCPF);"
                                                       />
                                            </div>
                                            <div class="form-group">
                                                <label for="cel">Celular:</label>
                                                <input type="tel" class="form-control" value="${organizador.celular}" 
                                                   <c:if test="${operacao == 'Excluir'}"> readonly</c:if>
                                                       name="txtCelularOrganizador"  
                                                       placeholder="(xx) x xxxx-xxxx" required onkeydown="javascript: fMasc(this, mTel);"
                                                       id="cel"    
                                                       />
                                            </div>
                                            <div class="form-group">
                                                <label for="telefone">Telefone:</label>
                                                <input type="tel" class="form-control" value="${organizador.telefone}" 
                                                   <c:if test="${operacao == 'Excluir'}"> readonly</c:if>
                                                       name="txtTelefoneOrganizador" 
                                                       placeholder="(xx) x xxxx-xxxx"  onkeydown="javascript: fMasc(this, mTel);"
                                                       id="cel"    
                                                       />
                                            </div>
                                            <div class="form-group">
                                                <label for="sexo">Sexo:</label> <br>
                                                <div class="radio-inline">
                                                    <label>
                                                        <input type="radio" name="radioSexoOrganizador" value="M" required
                                                        <c:if test="${operacao == 'Excluir'}"> disabled</c:if> 
                                                        <c:if test="${organizador.sexo == 'M'}"> checked</c:if>
                                                            />
                                                        Masculino
                                                    </label>
                                                </div>
                                                <div class="radio-inline">
                                                    <label>
                                                        <input type="radio" name="radioSexoOrganizador" value="F"  required
                                                        <c:if test="${operacao == 'Excluir'}"> disabled</c:if> 
                                                        <c:if test="${organizador.sexo == 'F'}"> checked</c:if>
                                                            />
                                                        Feminino
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="cep">CEP:</label>
                                                <input type="text" class="form-control" id="cep" name="txtCepOrganizador" value="${organizador.cep}" required onblur="pesquisacep(this.value);" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                            </div>
                                            <div class="form-group">
                                                <label for="cidade">Cidade:</label>
                                                <input type="text" class="form-control" id="cidade" name="txtCidadeOrganizador" value="${organizador.cidade}" required <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                            </div>
                                            <div class="form-group">
                                                <label for="estado">Estado:</label>
                                                <input type="text" class="form-control" id="estado" name="txtEstadoOrganizador" value="${organizador.estado}" required <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                            </div>
                                            <div class="form-group">
                                                <label for="rua">Logradouro:</label>
                                                <input type="text" class="form-control" id="logradouro" name="txtLogradouroOrganizador" value="${organizador.logradouro}" required <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                            </div>
                                            <div class="form-group">
                                                <label for="bairro">Bairro:</label>
                                                <input type="text" class="form-control" id="bairro" name="txtBairroOrganizador" value="${organizador.bairro}" required <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                            </div>
                                            <div class="form-group">
                                                <label for="numero">Número:</label>
                                                <input type="text" class="form-control" id="numero" name="txtNumeroOrganizador" value="${organizador.numero}" required <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                            </div>
                                            <div class="form-group">
                                                <label for="complemento">Complemento:</label>
                                                <input type="text" class="form-control" id="complemento" name="txtComplementoOrganizador" value="${organizador.complemento}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                            </div>
                                            <div><input name="ibge" type="hidden" id="ibge" size="8"/><br/></div>

                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="email">E-mail:</label>
                                                <input type="email" class="form-control" id="email" name="txtEmailOrganizador" value="${organizador.email}" required <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                            </div>
                                            <div class="form-group">
                                                <label for="senha1">Senha:</label>
                                                <input type="password" class="form-control" id="senha1" name="txtSenhaOrganizador" value="${organizador.senha}" required <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                            </div>
                                            <div class="form-group">
                                                <label for="senha2">Confirmar Senha:</label>
                                                <input type="password" class="form-control" id="senha2" name="txtSenhaOrganizador2" oninput="validaSenha(this)" required <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                            </div>

                                            <div class="checkbox">
                                                <label><input type="checkbox" name="agree" id="agree" required> Aceito e Concordo com os <a href="#">Termos</a></label>
                                            </div>
                                            <div class="form-group">
                                                <a href="PesquisaOrganizadorController" style="text-decoration: none" ><button type="button" class="btn btn-danger">Cancelar</button> </a>
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
