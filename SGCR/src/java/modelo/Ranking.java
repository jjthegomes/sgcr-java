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
    private int idadeInicial;
    private Administrador administrador;

    private Atleta atleta;
    private String tempoLargada;
    private String tempoChegada;
    private String tempo;
    private int quilometragem;
    private double mediaPace;
    private double pace;

    private int administradorId;
    private int atletaId;

    public Ranking(int id, String nome, int intervaloFaixaEtaria, int idadeInicial, Administrador administrador) {
        this.id = id;
        this.nome = nome;
        this.intervaloFaixaEtaria = intervaloFaixaEtaria;
        this.administrador = administrador;
        this.idadeInicial = idadeInicial;
    }

    public Ranking(String nome, int intervaloFaixaEtaria, int idadeInicial, Administrador administrador) {
        this.nome = nome;
        this.intervaloFaixaEtaria = intervaloFaixaEtaria;
        this.administrador = administrador;
        this.idadeInicial = idadeInicial;
    }

    public Ranking(int id, Atleta atleta, String tempoLargada, String tempoChegada, String tempo, int quilometragem, double mediaPace, double pace) {
        this.id = id;
        this.atleta = atleta;
        this.tempoLargada = tempoLargada;
        this.tempoChegada = tempoChegada;
        this.tempo = tempo;
        this.quilometragem = quilometragem;
        this.mediaPace = mediaPace;
        this.pace = pace;
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

    public int getIdadeInicial() {
        return idadeInicial;
    }

    public void setIdadeInicial(int idadeInicial) {
        this.idadeInicial = idadeInicial;
    }

    public Administrador getAdministrador() {
        return administrador;
    }

    public void setAdministrador(Administrador administrador) {
        this.administrador = administrador;
    }

    public int getAdministradorId() {
        return administradorId;
    }

    public void setAdministradorId(int administradorId) {
        this.administradorId = administradorId;
    }

    public Atleta getAtleta() {
        return atleta;
    }

    public void setAtleta(Atleta atleta) {
        this.atleta = atleta;
    }

    public String getTempoLargada() {
        return tempoLargada;
    }

    public void setTempoLargada(String tempoLargada) {
        this.tempoLargada = tempoLargada;
    }

    public String getTempoChegada() {
        return tempoChegada;
    }

    public void setTempoChegada(String tempoChegada) {
        this.tempoChegada = tempoChegada;
    }

    public String getTempo() {
        return tempo;
    }

    public void setTempo(String tempo) {
        this.tempo = tempo;
    }

    public int getQuilometragem() {
        return quilometragem;
    }

    public void setQuilometragem(int quilometragem) {
        this.quilometragem = quilometragem;
    }

    public double getMediaPace() {
        return mediaPace;
    }

    public void setMediaPace(double mediaPace) {
        this.mediaPace = mediaPace;
    }

    public double getPace() {
        return pace;
    }

    public void setPace(double pace) {
        this.pace = pace;
    }

    public int getAtletaId() {
        return atletaId;
    }

    public void setAtletaId(int atletaId) {
        this.atletaId = atletaId;
    }

    public void gravar() throws SQLException,
            ClassNotFoundException {
        RankingDAO.gravar(this);
    }

    public void alterar() throws SQLException, ClassNotFoundException {
        RankingDAO.alterar(this);
    }

    public void excluir() throws SQLException, ClassNotFoundException {
        RankingDAO.excluir(this);
    }

    public static List<Ranking> obterRankings() throws ClassNotFoundException {
        return RankingDAO.obterRankings();
    }

    public static List<Ranking> obterRankings(int administradorId) throws ClassNotFoundException {
        return RankingDAO.obterRankings(administradorId);
    }

    public static Ranking obterRanking(int id) throws ClassNotFoundException {
        return RankingDAO.obterRanking(id);
    }

    public static List<Ranking> obterRanking() throws ClassNotFoundException {
        return RankingDAO.obterRanking();
    }

}
