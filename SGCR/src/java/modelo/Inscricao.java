
package modelo;

/**
 *
 * @author RAJ
 */
public class Inscricao {
    private int id;
    private String dataCompra;
    private String numeroPeito;
    private boolean pago;
    private boolean formaPagamento;
    private Double tempoPercorrido;
    private Atleta atleta;
    private Corrida corrida;
    
    private int atletasId;
    private int corridasId;

    public Inscricao(int id, String dataCompra, String numeroPeito, boolean pago, boolean formaPagamento, Double tempoPercorrido, Atleta atleta, Corrida corrida) {
        this.id = id;
        this.dataCompra = dataCompra;
        this.numeroPeito = numeroPeito;
        this.pago = pago;
        this.formaPagamento = formaPagamento;
        this.tempoPercorrido = tempoPercorrido;
        this.atleta = atleta;
        this.corrida = corrida;
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

    public boolean isFormaPagamento() {
        return formaPagamento;
    }

    public void setFormaPagamento(boolean formaPagamento) {
        this.formaPagamento = formaPagamento;
    }

    public Double getTempoPercorrido() {
        return tempoPercorrido;
    }

    public void setTempoPercorrido(Double tempoPercorrido) {
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


}
