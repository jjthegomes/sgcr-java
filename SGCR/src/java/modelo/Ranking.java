
package modelo;

/**
 *
 * @author RAJ
 */
public class Ranking {
    private int id;
    private String nomeRanking;
    private String intervaloFaxaEtaria;
    private Administrador administrador;

    public Ranking(int id, String nomeRanking, String intervaloFaxaEtaria, Administrador administrador) {
        this.id = id;
        this.nomeRanking = nomeRanking;
        this.intervaloFaxaEtaria = intervaloFaxaEtaria;
        this.administrador = administrador;
    }

    public int getId() {
        return id;
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

    public String getIntervaloFaxaEtaria() {
        return intervaloFaxaEtaria;
    }

    public void setIntervaloFaxaEtaria(String intervaloFaxaEtaria) {
        this.intervaloFaxaEtaria = intervaloFaxaEtaria;
    }

    public Administrador getAdministrador() {
        return administrador;
    }

    public void setAdministrador(Administrador administrador) {
        this.administrador = administrador;
    }
    
    public void cadastrarRanking(){
        
    }
}
