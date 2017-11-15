
package modelo;

import dao.RankingDAO;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author RAJ
 */
public class Ranking {
    private int id;
    private String nome;
    private int intervaloFaixaEtaria;
    private Administrador administrador;
    
    private int administradorId;

    public Ranking(int id, String nome, int intervaloFaixaEtaria, Administrador administrador) {
        this.id = id;
        this.nome = nome;
        this.intervaloFaixaEtaria = intervaloFaixaEtaria;
        this.administrador = administrador;
    }

    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getIntervaloFaixaEtaria() {
        return intervaloFaixaEtaria;
    }

    public void setIntervaloFaixaEtaria(int intervaloFaxaEtaria) {
        this.intervaloFaixaEtaria = intervaloFaxaEtaria;
    }

    public Administrador getAdministrador() {
        return administrador;
    }

    public void setAdministrador(Administrador administrador) {
        this.administrador = administrador;
    }
    
    public void cadastrarRanking(){
        
    }

    public int getAdministradorId() {
        return administradorId;
    }

    public void setAdministradorId(int administradorId) {
        this.administradorId = administradorId;
    }
    
    public void gravar() throws SQLException,
        ClassNotFoundException{
        RankingDAO.gravar(this);
    }
    public void alterar() throws SQLException, ClassNotFoundException{
        RankingDAO.alterar(this);
    }
    
    public void excluir() throws SQLException, ClassNotFoundException{
        RankingDAO.excluir(this);
    }
    
    public static List<Ranking> obterRankings() throws ClassNotFoundException{
        return RankingDAO.obterRankings();
    }
    public static Ranking obterRanking(int id) throws ClassNotFoundException{
        return RankingDAO.obterRanking(id);
    }

}
