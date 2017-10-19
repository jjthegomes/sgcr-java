
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
    private String nomeRanking;
    private int intervaloFaixaEtaria;
    private Administrador administrador;
    
    private int administradorId;

    public Ranking(int id, String nomeRanking, int intervaloFaixaEtaria, Administrador administrador) {
        this.id = id;
        this.nomeRanking = nomeRanking;
        this.intervaloFaixaEtaria = intervaloFaixaEtaria;
        this.administrador = administrador;
    }

    public int getId() {
        return id;
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
    
    public Ranking obterRanking(int id) throws ClassNotFoundException{
        return RankingDAO.obterRanking(id);
    }
    
    public void setId(int id) {
        this.id = id;
    }

    public String getNomeRanking() {
        return nomeRanking;
    }

    public void setNomeRanking(String nomeRanking) {
        this.nomeRanking = nomeRanking;
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
    
    public static List<Ranking> obterRankings() throws ClassNotFoundException{
        return RankingDAO.obterRankings();
    }

}
