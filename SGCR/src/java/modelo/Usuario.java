package modelo;

/**
 *
 * @author RAJ
 */
public abstract class Usuario {

    private int id;
    private String email;
    private String senha;

    public Usuario(int id, String email, String senha) {
        this.id = id;
        this.email = email;
        this.senha = senha;
    }

    public void login(String email, String senha) {
        System.out.println("Logado");
    }
}
