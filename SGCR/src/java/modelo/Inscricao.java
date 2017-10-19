
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
    private Corrida corrida;
    private Kit kit;
    
    private int atletasId;
    private int corridasId;
    private int kitsId;

    public Inscricao(int id, String dataCompra, String numeroPeito, boolean pago, String formaPagamento, String tempoPercorrido, Atleta atleta, Corrida corrida, Kit kit) {
        this.id = id;
        this.dataCompra = dataCompra;
        this.numeroPeito = numeroPeito;
        this.pago = pago;
        this.formaPagamento = formaPagamento;
        this.tempoPercorrido = tempoPercorrido;
        this.atleta = atleta;
        this.corrida = corrida;
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

    public Corrida getCorrida() {
        return corrida;
    }

    public void setCorrida(Corrida corrida) {
        this.corrida = corrida;
    }

    public int getAtletasId() {
        return atletasId;
    }

    public void setAtletasId(int atletasId) {
        this.atletasId = atletasId;
    }

    public int getCorridasId() {
        return corridasId;
    }

    public void setCorridasId(int corridasId) {
        this.corridasId = corridasId;
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
