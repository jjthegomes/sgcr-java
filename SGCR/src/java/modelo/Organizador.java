
package modelo;

/**
 *
 * @author RAJ
 */
public class Organizador extends UsuarioComum{

    public Organizador(String nomeComepleto, String dataNascimento, boolean sexo, String cpf, String cep, String rua, String bairro, String complemento, String numero, String cidade, boolean statusAtivo, String telefone, String celular, int id, String email, String senha) {
        super(nomeComepleto, dataNascimento, sexo, cpf, cep, rua, bairro, complemento, numero, cidade, statusAtivo, telefone, celular, id, email, senha);
    }


   
    
    void gerarDados(){
    }
    void gerarRelatorios(){
    }
}
