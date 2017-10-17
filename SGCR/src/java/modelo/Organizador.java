
package modelo;

import dao.OrganizadorDAO;
import java.util.List;

/**
 *
 * @author RAJ
 */
public class Organizador extends UsuarioComum{

    public Organizador(String nome, String dataNascimento, String sexo, String cpf, String cep, String rua, String bairro, String complemento, String numero, String cidade, String estado, String telefone, String celular, int id, String email, String senha) {
        super(nome, dataNascimento, sexo, cpf, cep, rua, bairro, complemento, numero, cidade, estado, telefone, celular, id, email, senha);
    }

  
    void gerarDados(){
    }
    void gerarRelatorios(){
    }
    
    public static List<Organizador> obterOrganizadores() throws ClassNotFoundException{
        return OrganizadorDAO.obterOrganizadores();
    }
}
