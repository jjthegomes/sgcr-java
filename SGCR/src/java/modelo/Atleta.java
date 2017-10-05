
package modelo;


/**
 *
 * @author RAJ
 */
public class Atleta extends UsuarioComum{
    private String apelido;
    private String tamanhoCamisa;

    public Atleta(String apelido, String tamanhoCamisa, String nomeComepleto, String dataNascimento, boolean sexo, String cpf, String cep, String rua, String bairro, String complemento, String numero, String cidade, boolean statusAtivo, String telefone, String celular, int id, String email, String senha) {
        super(nomeComepleto, dataNascimento, sexo, cpf, cep, rua, bairro, complemento, numero, cidade, statusAtivo, telefone, celular, id, email, senha);
        this.apelido = apelido;
        this.tamanhoCamisa = tamanhoCamisa;
    }



    public String getApelido() {
        return apelido;
    }

    public void setApelido(String apelido) {
        this.apelido = apelido;
    }

    public String getTamanhoCamisa() {
        return tamanhoCamisa;
    }

    public void setTamanhoCamisa(String tamanhoCamisa) {
        this.tamanhoCamisa = tamanhoCamisa;
    }
            
}
