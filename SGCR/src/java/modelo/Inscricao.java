package modelo;

import dao.InscricaoDAO;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.List;

/**
 *
 * @author RAJ
 */
public class Inscricao {

    private int id;
    private int corridaId;
    private Corrida corrida;
    private String dataCompra;
    private String numeroPeito;
    private boolean pago;
    private boolean kitRetirado;
    private String tempoLargada;
    private String tempoChegada;
    private String tempoFinal;
    private Atleta atleta;
    private Percurso percurso;
    private Kit kit;
    private Lote lote;

    private int atletaId;
    private int percursoId;
    private int kitId;
    private int loteId;

    public Inscricao(int id, Corrida corrida, String dataCompra, String numeroPeito, boolean pago, boolean kitRetirado, String tempoLargada, String tempoChegada, Atleta atleta, Percurso percurso, Kit kit, Lote lote) {
        this.id = id;
        this.corrida = corrida;
        this.dataCompra = dataCompra;
        this.numeroPeito = numeroPeito;
        this.pago = pago;
        this.kitRetirado = kitRetirado;
        this.tempoLargada = tempoLargada;
        this.tempoChegada = tempoChegada;
        this.atleta = atleta;
        this.percurso = percurso;
        this.kit = kit;
        this.lote = lote;
    }

    public Inscricao(Corrida corrida, Atleta atleta, Percurso percurso, Kit kit, Lote lote) {
        this.corrida = corrida;
        this.atleta = atleta;
        this.percurso = percurso;
        this.kit = kit;
        this.lote = lote;

        Calendar hoje = Calendar.getInstance();
        this.dataCompra = hoje.get(Calendar.DAY_OF_MONTH) + "/" + (hoje.get(Calendar.MONTH) + 1) + "/" + hoje.get(Calendar.YEAR);
        this.numeroPeito = "0";
        this.pago = false;
        this.kitRetirado = false;
        this.tempoLargada = "";
        this.tempoChegada = "";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDataCompra() {
        return dataCompra;
    }

    public void setDataCompra(String dataCompra) {
        this.dataCompra = dataCompra;
    }

    public String getNumeroPeito() {
        return numeroPeito;
    }

    public void setNumeroPeito(String numeroPeito) {
        this.numeroPeito = numeroPeito;
    }

    public String getTempoFinal() {
        return tempoFinal;
    }

    public void setTempoFinal(String tempoFinal) {
        this.tempoFinal = tempoFinal;
    }

    public boolean isPago() {
        return pago;
    }

    public void setPago(boolean pago) {
        this.pago = pago;
    }

    public boolean isKitRetirado() {
        return kitRetirado;
    }

    public void setKitRetirado(boolean kitRetirado) {
        this.kitRetirado = kitRetirado;
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

    public Atleta getAtleta() {
        return atleta;
    }

    public void setAtleta(Atleta atleta) {
        this.atleta = atleta;
    }

    public Percurso getPercurso() {
        return percurso;
    }

    public void setPercurso(Percurso percurso) {
        this.percurso = percurso;
    }

    public int getAtletaId() {
        return atletaId;
    }

    public void setAtletaId(int atletaId) {
        this.atletaId = atletaId;
    }

    public int getPercursoId() {
        return percursoId;
    }

    public void setPercursoId(int percursoId) {
        this.percursoId = percursoId;
    }

    public Kit getKit() {
        return kit;
    }

    public void setKit(Kit kit) {
        this.kit = kit;
    }

    public int getKitId() {
        return kitId;
    }

    public void setKitId(int kitId) {
        this.kitId = kitId;
    }

    public int getCorridaId() {
        return corridaId;
    }

    public void setCorridaId(int kitCorridaId) {
        this.corridaId = corridaId;
    }

    public Corrida getCorrida() {
        return corrida;
    }

    public void setCorrida(Corrida corrida) {
        this.corrida = corrida;
    }

    public Lote getLote() {
        return lote;
    }

    public void setLote(Lote lote) {
        this.lote = lote;
    }

    public int getLoteId() {
        return loteId;
    }

    public void setLoteId(int loteId) {
        this.loteId = loteId;
    }

    public static List<Inscricao> obterInscricoes() throws ClassNotFoundException {
        return InscricaoDAO.obterInscricoes();
    }

    public static List<Inscricao> obterInscricoes(int corridaId) throws ClassNotFoundException {
        return InscricaoDAO.obterInscricoes(corridaId);
    }
    
    public static List<Inscricao> obterInscricoesCorrida(int corridaId, int percursoId) throws ClassNotFoundException {
        return InscricaoDAO.obterInscricoesCorrida(corridaId, percursoId);
    }

    public static List<Inscricao> obterInscricoesAtleta(int atletaId) throws ClassNotFoundException {
        return InscricaoDAO.obterInscricoesAtleta(atletaId);
    }

    public static List<Inscricao> obterInscricoesPagas(int corridaId) throws ClassNotFoundException {
        return InscricaoDAO.obterInscricoesPagas(corridaId);
    }

    public static List<Inscricao> obterInscricoesNaoPagas(int corridaId) throws ClassNotFoundException {
        return InscricaoDAO.obterInscricoesNaoPagas(corridaId);
    }

    public void gravar() throws SQLException, ClassNotFoundException {
        InscricaoDAO.gravar(this);
    }

    public void alterar() throws SQLException, ClassNotFoundException {
        InscricaoDAO.alterar(this);
    }

    public void excluir() throws SQLException, ClassNotFoundException {
        InscricaoDAO.excluir(this);
    }

    public static Inscricao obterInscricao(int id) throws ClassNotFoundException {
        return InscricaoDAO.obterInscricao(id);
    }
    
    public static Inscricao obterUltimaInscricaoAtleta(int atletaId) throws ClassNotFoundException {
        return InscricaoDAO.obterUltimaInscricaoAtleta(atletaId);
    }

    public void retirarKit() throws SQLException, ClassNotFoundException {
        InscricaoDAO.retirarKit(this);
    }

    public static void atualizarResultadoCorrida(List<Inscricao> inscricoes) throws SQLException, ClassNotFoundException {
        InscricaoDAO.atualizarResultadoCorrida(inscricoes);
    }
    
    public static boolean atletaEstaInscrito(Atleta atleta,Corrida corrida) throws SQLException, ClassNotFoundException {
        return InscricaoDAO.atletaEstaInscrito(atleta,corrida);
    }

    public void pagarInscricao() throws SQLException, ClassNotFoundException {
        InscricaoDAO.pagarInscricao(this);
    }
}
