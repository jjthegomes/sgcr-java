
package modelo;

import dao.InscricaoDAO;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author RAJ
 */
public class Inscricao {
    private int id;
    private String dataCompra;
    private String numeroPeito;
    private boolean pago;
    private String formaPagamento;
    private String tempoPercorrido;
    private Atleta atleta;
    private Percurso percurso;
    private Kit kit;
    
    private int atletasId;
    private int percursosId;
    private int kitsId;

    public Inscricao(int id, String dataCompra, String numeroPeito, boolean pago, String formaPagamento, String tempoPercorrido, Atleta atleta, Percurso percurso, Kit kit) {
        this.id = id;
        this.dataCompra = dataCompra;
        this.numeroPeito = numeroPeito;
        this.pago = pago;
        this.formaPagamento = formaPagamento;
        this.tempoPercorrido = tempoPercorrido;
        this.atleta = atleta;
        this.percurso = percurso;
        this.kit = kit;
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

    public boolean isPago() {
        return pago;
    }

    public void setPago(boolean pago) {
        this.pago = pago;
    }

    public String getFormaPagamento() {
        return formaPagamento;
    }

    public void setFormaPagamento(String formaPagamento) {
        this.formaPagamento = formaPagamento;
    }

    public String getTempoPercorrido() {
        return tempoPercorrido;
    }

    public void setTempoPercorrido(String tempoPercorrido) {
        this.tempoPercorrido = tempoPercorrido;
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

    public int getAtletasId() {
        return atletasId;
    }

    public void setAtletasId(int atletasId) {
        this.atletasId = atletasId;
    }

    public int getPercursosId() {
        return percursosId;
    }

    public void setPercursosId(int percursosId) {
        this.percursosId = percursosId;
    }

    public Kit getKit() {
        return kit;
    }

    public void setKit(Kit kit) {
        this.kit = kit;
    }

    public int getKitsId() {
        return kitsId;
    }

    public void setKitsId(int kitsId) {
        this.kitsId = kitsId;
    }
    
    public static List<Inscricao> obterInscricoes() throws ClassNotFoundException {
        return InscricaoDAO.obterInscricoes();
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

}
