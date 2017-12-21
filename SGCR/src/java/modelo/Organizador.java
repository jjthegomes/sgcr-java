
package modelo;

import dao.OrganizadorDAO;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author RAJ
 */
public class Organizador extends UsuarioComum{

    public Organizador(String nome, String dataNascimento, String sexo, String cpf, String cep, String logradouro, String bairro, String complemento, String numero, String cidade, String estado, String telefone, String celular, int id, String email, String senha) {
        super(nome, dataNascimento, sexo, cpf, cep, logradouro, bairro, complemento, numero, cidade, estado, telefone, celular, id, email, senha);
    }
    
    public static List<Organizador> obterOrganizadores() throws ClassNotFoundException{
        return OrganizadorDAO.obterOrganizadores();
    }
    
    public void gravar() throws SQLException, ClassNotFoundException {
        OrganizadorDAO.gravar(this);
    }
    
    public void alterar() throws SQLException, ClassNotFoundException {
        OrganizadorDAO.alterar(this);
    }
    
    public void excluir() throws SQLException, ClassNotFoundException {
        OrganizadorDAO.excluir(this);
    }
    
    public static Organizador obterOrganizador(int id) throws ClassNotFoundException {
        return OrganizadorDAO.obterOrganizador(id);
    }
    
    public static Organizador logar(String email, String senha) throws ClassNotFoundException {
        return OrganizadorDAO.logar(email, senha);
    }
}
