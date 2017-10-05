
package modelo;

/**
 *
 * @author RAJ
 */
public class Inscricao {
    private int id;
    private String dataCompra;
    private String numeroPeito;
    private String posicao;
    private boolean formaPagamento;
    private String tempoPercorrido;
    private Atleta atleta;
    
    private int atletaId;

    public Inscricao(int id, String dataCompra, String numeroPeito, String posicao, boolean formaPagamento, 
            String tempoPercorrido, int atletaId) {
        this.id = id;
        this.dataCompra = dataCompra;
        this.numeroPeito = numeroPeito;
        this.posicao = posicao;
        this.formaPagamento = formaPagamento;
        this.tempoPercorrido = tempoPercorrido;
        this.atletaId = atletaId;
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

    public String getPosicao() {
        return posicao;
    }

    public void setPosicao(String posicao) {
        this.posicao = posicao;
    }

    public boolean isFormaPagamento() {
        return formaPagamento;
    }

    public void setFormaPagamento(boolean formaPagamento) {
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

    public int getAtletaId() {
        return atletaId;
    }

    public void setAtletaId(int atletaId) {
        this.atletaId = atletaId;
    }

    
}
