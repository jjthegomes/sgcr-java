package modelo;

import dao.AtletaDAO;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author RAJ
 */
public class Atleta extends UsuarioComum {

    private String apelido;
    private String tamanhoCamisa;

    public Atleta(String apelido, String tamanhoCamisa, String nome, String dataNascimento, String sexo, String cpf, String cep, String rua, String bairro, String complemento, String numero, String cidade, String estado, String telefone, String celular, int id, String email, String senha) {
        super(nome, dataNascimento, sexo, cpf, cep, rua, bairro, complemento, numero, cidade, estado, telefone, celular, id, email, senha);
        this.apelido = apelido;
        this.tamanhoCamisa = tamanhoCamisa;
    }
    
    public Atleta(String apelido, String tamanhoCamisa, String nome, String dataNascimento, String sexo, String cpf, String cep, String rua, String bairro, String complemento, String numero, String cidade, String estado, String telefone, String celular, String email, String senha) {
        super(nome, dataNascimento, sexo, cpf, cep, rua, bairro, complemento, numero, cidade, estado, telefone, celular, email, senha);
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

    public static List<Atleta> obterAtletas() throws ClassNotFoundException {
        return AtletaDAO.obterAtletas();
    }

    public void gravar() throws ClassNotFoundException, SQLException {
        AtletaDAO.gravar(this);
    }

    public void alterar() throws ClassNotFoundException, SQLException {
        AtletaDAO.alterar(this);
    }

    public void excluir() throws ClassNotFoundException, SQLException {
        AtletaDAO.excluir(this);
    }

    public static Atleta obterAtleta(int id) throws ClassNotFoundException {
        return AtletaDAO.obterAtleta(id);
    }
    
    public static Atleta logar(String email, String senha) throws ClassNotFoundException, SQLException{
        return  AtletaDAO.logar(email, senha);
    }
}
