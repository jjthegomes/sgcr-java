
package modelo;

import dao.AtletaDAO;
import java.util.List;


/**
 *
 * @author RAJ
 */
public class Atleta extends UsuarioComum{
    private String apelido;
    private String tamanhoCamisa;
    
    public Atleta(String apelido, String tamanhoCamisa, String nome, String dataNascimento, String sexo, String cpf, String cep, String rua, String bairro, String complemento, String numero, String cidade, String estado, String telefone, String celular, int id, String email, String senha) {
        super(nome, dataNascimento, sexo, cpf, cep, rua, bairro, complemento, numero, cidade, estado, telefone, celular, id, email, senha);
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
       
       
    public static List<Atleta> obterAtletas() throws ClassNotFoundException{
        return AtletaDAO.obterAtletas();
    }
      
}
