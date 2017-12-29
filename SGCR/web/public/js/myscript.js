function limpa_formulário_cep() {
    //Limpa valores do formulário de cep.
    document.getElementById('logradouro').value = ("");
    document.getElementById('bairro').value = ("");
    document.getElementById('cidade').value = ("");
    document.getElementById('estado').value = ("");
    document.getElementById('ibge').value = ("");
}

function meu_callback(conteudo) {
    if (!("erro" in conteudo)) {
        //Atualiza os campos com os valores.
        document.getElementById('logradouro').value = (conteudo.logradouro);
        document.getElementById('bairro').value = (conteudo.bairro);
        document.getElementById('cidade').value = (conteudo.localidade);
        document.getElementById('estado').value = (conteudo.uf);
        document.getElementById('ibge').value = (conteudo.ibge);
    } //end if.
    else {
        //CEP não Encontrado.
        limpa_formulário_cep();
        alert("CEP não encontrado.");
    }
}
function pesquisacep(valor) {

    //Nova variável "cep" somente com dígitos.
    var cep = valor.replace(/\D/g, '');

    //Verifica se campo cep possui valor informado.
    if (cep != "") {

        //Expressão regular para validar o CEP.
        var validacep = /^[0-9]{8}$/;

        //Valida o formato do CEP.
        if (validacep.test(cep)) {

            //Preenche os campos com "..." enquanto consulta webservice.
            document.getElementById('logradouro').value = "...";
            document.getElementById('bairro').value = "...";
            document.getElementById('cidade').value = "...";
            document.getElementById('estado').value = "...";
            document.getElementById('ibge').value = "...";

            //Cria um elemento javascript.
            var script = document.createElement('script');

            //Sincroniza com o callback.
            script.src = '//viacep.com.br/ws/' + cep + '/json/?callback=meu_callback';

            //Insere script no documento e carrega o conteúdo.
            document.body.appendChild(script);

        } //end if.
        else {
            //cep é inválido.
            limpa_formulário_cep();
            alert("Formato de CEP inválido.");
        }
    } //end if.
    else {
        //cep sem valor, limpa formulário.
        limpa_formulário_cep();
    }
}

function pagamento(formaPagamento) {
    if (formaPagamento === "cartaoCredito") {
        $('.pagamentoCartaoCredito').prop("disabled", false);
        $('.pagamentoBoleto').prop("disabled", true);
    } else if (formaPagamento === "boleto") {
        $('.pagamentoCartaoCredito').prop("disabled", true);
        $('.pagamentoBoleto').prop("disabled", false);
    }
}

function validaSenha(input) {
    if (input.value != document.getElementById('senha1').value) {
        input.setCustomValidity('Repita a senha corretamente');
    } else {
        input.setCustomValidity('');
    }
}

function mascaraData(campo, e)
{
    var kC = (document.all) ? event.keyCode : e.keyCode;
    var data = campo.value;
    if (kC != 8 && kC != 46) {
        if (data.length == 2) {
            campo.value = data += '/';
        } else if (data.length == 5) {
            campo.value = data += '/';
        } else
            campo.value = data;
    }
}
function fMasc(objeto, mascara) {
    obj = objeto;
    masc = mascara;
    setTimeout("fMascEx()", 1)
}

function fMascEx() {
    obj.value = masc(obj.value)
}

function mCPF(cpf) {
    cpf = cpf.replace(/\D/g, "")
    cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2")
    cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2")
    cpf = cpf.replace(/(\d{3})(\d{1,2})$/, "$1-$2")
    return cpf;
}

function mTel(tel) {
    tel = tel.replace(/\D/g, "")
    tel = tel.replace(/^(\d)/, "($1")
    tel = tel.replace(/(.{3})(\d)/, "$1)$2")
    if (tel.length == 9) {
        tel = tel.replace(/(.{1})$/, "-$1")
    } else if (tel.length == 10) {
        tel = tel.replace(/(.{2})$/, "-$1")
    } else if (tel.length == 11) {
        tel = tel.replace(/(.{3})$/, "-$1")
    } else if (tel.length == 12) {
        tel = tel.replace(/(.{4})$/, "-$1")
    } else if (tel.length > 12) {
        tel = tel.replace(/(.{4})$/, "-$1")
    }
    return tel;
}
function mCEP(cep) {
    cep = cep.replace(/\D/g, "")
    cep = cep.replace(/^(\d{2})(\d)/, "$1.$2")
    cep = cep.replace(/\.(\d{3})(\d)/, ".$1-$2")
    return cep
}

function mNum(num) {
    num = num.replace(/\D/g, "")
    return num
}

function readOnly(){
    document.getElementById("read").disabled = false;
    
}
function limparImportarKit(){
    //Limpa campos de importar kit
    document.getElementById("kit").value = "";
    document.getElementById("nomeKit").value = "";
    document.getElementById("produtosKit").value = "";
    document.getElementById("valorKit").value = "";
}

function limparImportarPercurso(){
    //Limpa campos de importar kit
    document.getElementById("percurso").value = "";
    document.getElementById("quilometragem").value = "";
    document.getElementById("descricao").value = "";
}
function confimarSalvarCorrida(){
    var nome = document.getElementById("nomeCorrida");
    var descricao = document.getElementById("descricao");
    var numeroPessoas = document.getElementById("numeroDePessoas");
    var DtCorrida = document.getElementById("dtCorrida");
    var horario = document.getElementById("horario");
    var cep = document.getElementById("cep");
    var estado = document.getElementById("estado");
    var cidade = document.getElementById("cidade");
    var logradouro = document.getElementById("logradouro");
    var bairro = document.getElementById("bairro");
    var numero = document.getElementById("numero");
    var regulamento = document.getElementById("regulamento");
    var banner = document.getElementById("banner");
    var ativo = document.getElementById("ativo");
    var desativado = document.getElementById("desativado");
    var radio ="";
    if((ativo.checked == false) && desativado.checked == false){
        radio = "";
    }
    
     
    if((nome.value || descricao.value || numeroPessoas.value || 
     DtCorrida.value || horario.value || cep.value ||
     estado.value || cidade.value || logradouro.value ||
     bairro.value || numero.value || regulamento.value ||
     banner.value || radio) == ""){
        alert("Atenção: Algum campo obrigatório não foi preechido !");
     }  
}
