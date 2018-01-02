function criaPercurso(quilometragem, descricao) {
    inputQuilometragem = document.getElementById(quilometragem);
    inputDescricao     = document.getElementById(descricao);
    
    quilometragem = parseFloat(document.getElementById(quilometragem).value);
    descricao     = document.getElementById(descricao).value;

    var percursos = document.getElementById("area-percursos");
    var percurso = '';
    
    if (quilometragem > 0 && descricao.length > 0) {
        document.getElementById("div-vazia-percursos").style.display = 'none';
        percurso += '<input type="hidden" class="form-control" name="txtQuilometragemPercurso" value="' + quilometragem + '" />';
        percurso += '<input type="hidden" class="form-control" name="txtDescricaoPercurso" value="' + descricao + '" />';

        percurso += '<tr>';
        percurso += '   <td>' + quilometragem + '</td>';
        percurso += '   <td>' + descricao + '</td>';
        percurso += '   <td style="width: 20px;"><a class="btn btn-success btn-xs"><i class="fa fa-pencil"></i></a></td>';
        percurso += '   <td style="width: 20px;"><a class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></a></td>';
        percurso += '</tr>';
        
        percursos.insertAdjacentHTML('afterbegin', percurso);
        
        inputQuilometragem.value = "";
        inputDescricao.value = "";
    }


//    percurso += '   <div class="panel panel-default col-md-12 panel-config">';
//    percurso += '       <div class="panel-body">';
//    percurso += '           <p><b>' + quilometragem + 'km</b></p>';
//    percurso += '           <p>' + descricao + '</p>';
//    percurso += '           <a class="btn btn-success btn-sm">Editar</a>';
//    percurso += '           <a class="btn btn-danger btn-sm">Excluir</a>';
//    percurso += '       </div>';
//    percurso += '   </div>';

}