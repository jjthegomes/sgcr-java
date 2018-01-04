//CRIAÇÃO DE CORRIDA

class Kit {
    constructor(nome, preco, tipoChip, descricao, dataInicioRetirada, dataFinalRetirada) {
        this.id = new Date().getTime();
        this.nome = nome;
        this.preco = preco;
        this.tipoChip = tipoChip;
        this.descricao = descricao;
        this.dataInicioRetirada = dataInicioRetirada;
        this.dataFinalRetirada = dataFinalRetirada;
        Kit.inputs = ['nomeKit', 'precoKit', 'tipoChipKit', 'descricaoKit', 'dataInicioRetiradaKit', 'dataFinalRetiradaKit'];
    }

    static adiciona() {
        var nome = document.getElementById('nomeKit').value;
        var preco = parseFloat(document.getElementById('precoKit').value);
        var tipoChip = document.getElementById('tipoChipKit').value;
        var descricao = document.getElementById('descricaoKit').value;
        var dataInicioRetirada = document.getElementById('dataInicioRetiradaKit').value;
        var dataFinalRetirada = document.getElementById('dataFinalRetiradaKit').value;

        var kit = new Kit(nome, preco, tipoChip, descricao, dataInicioRetirada, dataFinalRetirada);
        arrayKits[kit.id] = kit;

        var percursos = document.getElementById("area-kits");
        var kitTr = '';

        if (kit.nome.length > 0 && kit.preco > 0 && kit.tipoChip.length > 0 && kit.descricao.length > 0
                && kit.dataInicioRetirada.length > 0 && kit.dataFinalRetirada.length > 0) {

            document.getElementById("div-vazia-kits").style.display = 'none';
            kitTr += '<tr id="kit' + kit.id + '">';
            kitTr += '<input type="hidden" name="txtNomeKit" id="txtNomeKit' + kit.id + '" value="' + kit.nome + '" />';
            kitTr += '<input type="hidden" name="txtPrecoKit" id="txtPrecoKit' + kit.id + '" value="' + kit.preco + '" />';
            kitTr += '<input type="hidden" name="txtTipoChipKit" id="txtTipoChipKit' + kit.id + '" value="' + kit.tipoChip + '" />';
            kitTr += '<input type="hidden" name="txtDescricaoKit" id="txtDescricaoKit' + kit.id + '" value="' + kit.descricao + '" />';
            kitTr += '<input type="hidden" name="txtDataInicioRetiradaKit" id="txtDataInicioRetiradaKit' + kit.id + '" value="' + kit.dataInicioRetirada + '" />';
            kitTr += '<input type="hidden" name="txtDataFinalRetiradaKit" id="txtDataFinalRetiradaKit' + kit.id + '" value="' + kit.dataFinalRetirada + '" />';

            kitTr += '   <td id="nomeKit' + kit.id + '">' + kit.nome + '</td>';
            kitTr += '   <td id="precoKit' + kit.id + '">' + kit.preco + '</td>';
            kitTr += '   <td id="tipoChipKit' + kit.id + '">' + kit.tipoChip + '</td>';
//            kitTr += '   <td id="descricaoKit' + kit.id + '">' + kit.descricao + '</td>';
//            kitTr += '   <td id="dataInicioRetiradaKit' + kit.id + '">' + kit.dataInicioRetirada + '</td>';
//            kitTr += '   <td id="dataFinalRetiradaKit' + kit.id + '">' + kit.dataFinalRetirada + '</td>';
            kitTr += '   <td style="width: 20px;"><a class="btn btn-success btn-xs" onclick="Kit.prepararEditar(' + kit.id + ')" ><i class="fa fa-pencil"></i></a></td>';
            kitTr += '   <td style="width: 20px;"><a class="btn btn-danger btn-xs" onclick="Kit.removeItem(\'kit' + kit.id + '\')" ><i class="fa fa-trash"></i></a></td>';
            kitTr += '</tr>';

            percursos.insertAdjacentHTML('afterbegin', kitTr);

            limpaInputs(Kit.inputs);
        }
        
    }

    static prepararEditar(id) {
        var kit = arrayKits[id];
        document.getElementById("nomeKit").value = kit.nome;
        document.getElementById("precoKit").value = kit.preco;
        document.getElementById("tipoChipKit").value = kit.tipoChip;
        document.getElementById("descricaoKit").value = kit.descricao;
        document.getElementById("dataInicioRetiradaKit").value = kit.dataInicioRetirada;
        document.getElementById("dataFinalRetiradaKit").value = kit.dataFinalRetirada;

        var editaKit = '<a class="btn btn-warning btn-block" id="adicionaKit" onclick="Kit.edita(' + id + ')">Editar</a>';
        document.getElementById("divAdicionaKit").innerHTML = editaKit;
    }

    static edita(id) {
        arrayKits[id].nome = document.getElementById('nomeKit').value;
        arrayKits[id].preco = parseFloat(document.getElementById('precoKit').value);
        arrayKits[id].tipoChip = document.getElementById('tipoChipKit').value;
        arrayKits[id].descricao = document.getElementById('descricaoKit').value;
        arrayKits[id].dataInicioRetirada = document.getElementById('dataInicioRetiradaKit').value;
        arrayKits[id].dataFinalRetirada = document.getElementById('dataFinalRetiradaKit').value;
        
        var kit = arrayKits[id];
        document.getElementById("txtNomeKit" + id).value = kit.nome;
        document.getElementById("nomeKit" + id).innerHTML = kit.nome;
        document.getElementById("txtPrecoKit" + id).value = kit.preco;
        document.getElementById("precoKit" + id).innerHTML = kit.preco;
        document.getElementById("txtTipoChipKit" + id).value = kit.tipoChip;
        document.getElementById("tipoChipKit" + id).innerHTML = kit.tipoChip;
        document.getElementById("txtDescricaoKit" + id).value = kit.descricao;
//        document.getElementById("descricaoKit" + id).innerHTML = kit.descricao;
        document.getElementById("txtDataInicioRetiradaKit" + id).value = kit.dataInicioRetirada;
//        document.getElementById("dataInicioRetiradaKit" + id).innerHTML = kit.dataInicioRetirada;
        document.getElementById("txtDataFinalRetiradaKit" + id).value = kit.dataFinalRetirada;
//        document.getElementById("dataFinalRetiradaKit" + id).innerHTML = kit.dataFinalRetirada;
        

        limpaInputs(Kit.inputs);

        var adicionaKit = '<a class="btn btn-info btn-block" id="adicionaKit" onclick="Kit.adiciona()">Adicionar</a>';
        document.getElementById("divAdicionaKit").innerHTML = adicionaKit;
    }

    static removeItem(id) {
        document.getElementById(id).remove();
        limpaInputs(Kit.inputs);
        var adicionaKit = '<a class="btn btn-info btn-block" id="adicionaKit" onclick="Kit.adiciona()">Adicionar</a>';
        document.getElementById("divAdicionaKit").innerHTML = adicionaKit;
    }
}

var arrayKits = [];

// -----------------------------------------------------------------------

class Percurso {
    constructor(quilometragem, descricao) {
        this.id = new Date().getTime();
        this.quilometragem = quilometragem;
        this.descricao = descricao;
        Percurso.inputs = ['quilometragemPercurso', 'descricaoPercurso'];
    }

    static removeItem(id) {
        document.getElementById(id).remove();
        limpaInputs(Percurso.inputs);
        var criaPercurso = '<a class="btn btn-info btn-block" id="criaPercurso" onclick="criaPercurso()">Adicionar</a>';
        document.getElementById("divCriaPercurso").innerHTML = criaPercurso;
    }
}

var arrayPercursos = [];

function criaPercurso() {
    var percurso = new Percurso(parseFloat(document.getElementById('quilometragemPercurso').value), document.getElementById('descricaoPercurso').value);
    arrayPercursos[percurso.id] = percurso;

    var percursos = document.getElementById("area-percursos");
    var percursoTr = '';

    if (percurso.quilometragem > 0 && percurso.descricao.length > 0) {
        document.getElementById("div-vazia-percursos").style.display = 'none';

        percursoTr += '<tr id="percurso' + percurso.id + '">';
        percursoTr += '<input type="hidden" class="form-control" name="txtQuilometragemPercurso" id="txtQuilometragemPercurso' + percurso.id + '" value="' + percurso.quilometragem + '" />';
        percursoTr += '<input type="hidden" class="form-control" name="txtDescricaoPercurso" id="txtDescricaoPercurso' + percurso.id + '" value="' + percurso.descricao + '" />';
        percursoTr += '   <td id="quilometragemPercurso' + percurso.id + '">' + percurso.quilometragem + '</td>';
        percursoTr += '   <td id="descricaoPercurso' + percurso.id + '">' + percurso.descricao + '</td>';
        percursoTr += '   <td style="width: 20px;"><a class="btn btn-success btn-xs" onclick="prepararEditarPercurso(' + percurso.id + ')" ><i class="fa fa-pencil"></i></a></td>';
        percursoTr += '   <td style="width: 20px;"><a class="btn btn-danger btn-xs" onclick="Percurso.removeItem(\'percurso' + percurso.id + '\')" ><i class="fa fa-trash"></i></a></td>';
        percursoTr += '</tr>';

        percursos.insertAdjacentHTML('afterbegin', percursoTr);

        limpaInputs(Percurso.inputs);
    }
}

function prepararEditarPercurso(percursoId) {
    var percurso = arrayPercursos[percursoId];
    document.getElementById("quilometragemPercurso").value = percurso.quilometragem;
    document.getElementById("descricaoPercurso").value = percurso.descricao;

    var editaPercurso = '<a class="btn btn-warning btn-block" id="criaPercurso" onclick="editaPercurso(' + percursoId + ')">Editar</a>';
    document.getElementById("divCriaPercurso").innerHTML = editaPercurso;
}

function editaPercurso(percursoId) {
    arrayPercursos[percursoId].quilometragem = document.getElementById("quilometragemPercurso").value;
    arrayPercursos[percursoId].descricao = document.getElementById("descricaoPercurso").value;
    var percurso = arrayPercursos[percursoId];
    document.getElementById("txtQuilometragemPercurso" + percursoId).value = percurso.quilometragem;
    document.getElementById("quilometragemPercurso" + percursoId).innerHTML = percurso.quilometragem;
    document.getElementById("txtDescricaoPercurso" + percursoId).value = percurso.descricao;
    document.getElementById("descricaoPercurso" + percursoId).innerHTML = percurso.descricao;

    limpaInputs(Percurso.inputs);

    var criaPercurso = '<a class="btn btn-info btn-block" id="criaPercurso" onclick="criaPercurso()">Adicionar</a>';
    document.getElementById("divCriaPercurso").innerHTML = criaPercurso;
}

// ---------------------------------------------------------------

class Lote {
    constructor(tipo, preco, dataInicio, dataTermino) {
        this.id = new Date().getTime();
        this.tipo = tipo;
        this.preco = preco;
        this.dataInicio = dataInicio;
        this.dataTermino = dataTermino;
        Lote.inputs = ['tipoLote', 'precoLote', 'dataInicioLote', 'dataTerminoLote'];
    }

    static adiciona() {
        var tipo = document.getElementById('tipoLote').value;
        var preco = parseFloat(document.getElementById('precoLote').value);
        var dataInicio = document.getElementById('dataInicioLote').value;
        var dataTermino = document.getElementById('dataTerminoLote').value;

        var lote = new Lote(tipo, preco, dataInicio, dataTermino);
        arrayLotes[lote.id] = lote;

        var lotes = document.getElementById("area-lotes");
        var loteTr = '';

        if (lote.tipo.length > 0 && lote.preco > 0 && lote.dataInicio.length > 0 && lote.dataTermino.length > 0) {

            document.getElementById("div-vazia-lotes").style.display = 'none';
            loteTr += '<tr id="lote' + lote.id + '">';
            loteTr += '<input type="hidden" name="txtTipoLote" id="txtTipoLote' + lote.id + '" value="' + lote.tipo + '" />';
            loteTr += '<input type="hidden" name="txtPrecoLote" id="txtPrecoLote' + lote.id + '" value="' + lote.preco + '" />';
            loteTr += '<input type="hidden" name="txtDataInicioLote" id="txtDataInicioLote' + lote.id + '" value="' + lote.dataInicio + '" />';
            loteTr += '<input type="hidden" name="txtDataTerminoLote" id="txtDataTerminoLote' + lote.id + '" value="' + lote.dataTermino + '" />';

            loteTr += '   <td id="tipoLote' + lote.id + '">' + lote.tipo + '</td>';
            loteTr += '   <td id="precoLote' + lote.id + '">R$ ' + lote.preco + '</td>';
//            loteTr += '   <td id="dataInicioLote' + lote.id + '">' + lote.dataInicio + '</td>';
//            loteTr += '   <td id="dataTerminoLote' + lote.id + '">' + lote.dataTermino + '</td>';

            loteTr += '   <td style="width: 20px;"><a class="btn btn-success btn-xs" onclick="Lote.prepararEditar(' + lote.id + ')" ><i class="fa fa-pencil"></i></a></td>';
            loteTr += '   <td style="width: 20px;"><a class="btn btn-danger btn-xs" onclick="Lote.removeItem(\'lote' + lote.id + '\')" ><i class="fa fa-trash"></i></a></td>';
            loteTr += '</tr>';

            lotes.insertAdjacentHTML('afterbegin', loteTr);

            limpaInputs(Lote.inputs);
        }
    }

    static prepararEditar(id) {
        var lote = arrayLotes[id];
        document.getElementById("tipoLote").value = lote.tipo;
        document.getElementById("precoLote").value = lote.preco;
        document.getElementById("dataInicioLote").value = lote.dataInicio;
        document.getElementById("dataTerminoLote").value = lote.dataTermino;

        var editaLote = '<a class="btn btn-warning btn-block" id="adicionaLote" onclick="Lote.edita(' + id + ')">Editar</a>';
        document.getElementById("divAdicionaLote").innerHTML = editaLote;
    }

    static edita(id) {
        arrayLotes[id].tipo = document.getElementById('tipoLote').value;
        arrayLotes[id].preco = parseFloat(document.getElementById('precoLote').value);
        arrayLotes[id].dataInicio = document.getElementById('dataInicioLote').value;
        arrayLotes[id].dataTermino = document.getElementById('dataTerminoLote').value;
        
        var lote = arrayLotes[id];
        document.getElementById("txtTipoLote" + id).value = lote.tipo;
        document.getElementById("tipoLote" + id).innerHTML = lote.tipo;
        document.getElementById("txtPrecoLote" + id).value = lote.preco;
        document.getElementById("precoLote" + id).innerHTML = lote.preco;
        document.getElementById("txtDataInicioLote" + id).value = lote.dataInicio;
//        document.getElementById("dataInicioLote" + id).innerHTML = lote.dataInicio;
        document.getElementById("txtDataTerminoLote" + id).value = lote.dataTermino;
//        document.getElementById("dataTerminoLote" + id).innerHTML = lote.dataTermino;

        limpaInputs(Lote.inputs);

        var adicionaLote = '<a class="btn btn-info btn-block" id="adicionaLote" onclick="Lote.adiciona()">Adicionar</a>';
        document.getElementById("divAdicionaLote").innerHTML = adicionaLote;
    }

    static removeItem(id) {
        document.getElementById(id).remove();
        limpaInputs(Lote.inputs);
        var adicionaLote = '<a class="btn btn-info btn-block" id="adicionaLote" onclick="Lote.adiciona()">Adicionar</a>';
        document.getElementById("divAdicionaLote").innerHTML = adicionaLote;
    }
}

var arrayLotes = [];

// ----------------------------------------

function limpaInputs(arrayInputs) {
    for (var i = 0; i < arrayInputs.length; i++) {
        document.getElementById(arrayInputs[i]).value = "";
    }
}
