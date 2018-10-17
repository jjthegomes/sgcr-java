
package modelo;

import dao.OrganizadorDAO;
import java.sql.SQLException;
import java.util.List;
import java.util.regex.Pattern;

/**
 *
 * @author RAJ
 */
public class Organizador extends UsuarioComum{
     public Organizador(){
         
    }
    public Organizador(String nome, String dataNascimento, String sexo, String cpf, String cep, String logradouro, String bairro, String complemento, String numero, String cidade, String estado, String telefone, String celular, int id, String email, String senha) {
        super(nome, dataNascimento, sexo, cpf, cep, logradouro, bairro, complemento, numero, cidade, estado, telefone, celular, id, email, senha);
    }
    
    public Organizador(String nome, String dataNascimento, String sexo, String cpf, String cep, String logradouro, String bairro, String complemento, String numero, String cidade, String estado, String telefone, String celular, String email, String senha) {
        super(nome, dataNascimento, sexo, cpf, cep, logradouro, bairro, complemento, numero, cidade, estado, telefone, celular, email, senha);
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
    public boolean validarCadastro(){
        Pattern p2 = Pattern.compile ("[A-Z]");// Criterio 2: Senha contém letras maiúsculas
        Pattern p3 = Pattern.compile ("[a-z]");// Criterio 3: Senha contém letras minúsculas
        Pattern p4 = Pattern.compile ("[0-9]");// Criterio 4: Senha contém dígitos
        Pattern p5 = Pattern.compile ("[-+*/=%]");// Critério 5: Senha contém um dos seguintes caracteres especiais: + - * / = %
        Pattern p6 = Pattern.compile ("[@]"); //Criterio 6: Email contém os caracteres
        Pattern p7 = Pattern.compile ("[.]"); //Criterio 6: Email contém os caracteres
        Pattern p8 = Pattern.compile ("[A-Z]"); // Criterio 7: Email contém os letras maiúsculas 
         
        if (getSenha().length() < 8) { // Criterio 1: Senha com 8 caracteres ou mais
            return false;
        }else 
        if (!p2.matcher (getSenha()).find()){  
            return false;
        }else
        if (!p3.matcher (getSenha()).find()){  
            return false;
        }else
        if (!p4.matcher (getSenha()).find()){  
            return false;
        }else 
        if (!p5.matcher (getSenha()).find()){  
            return false;                   
        }else 
        if (!p6.matcher (getEmail()).find()){  
            return false;                   
        }else 
        if (!p7.matcher (getEmail()).find()){  
            return false;                   
        }else 
        if (p8.matcher (getEmail()).find()){  
            return false;                   
        }else 
        if (getEmail().length() < 9){  
            return false;                   
        }else{
            return true;
        }
    }
}
