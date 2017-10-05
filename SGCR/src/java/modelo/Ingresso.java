package modelo;

/**
 *
 * @author RAJ
 */
public class Ingresso {

    private int id;
    private String tipo;
    private float preco;
    private String dataInicio;
    private String dataFinal;
    private int quantidade;
    private Corrida corrida;

    private int corridaId;

    public Ingresso(int id, String tipo, float preco, String dataInicio, String dataFinal, int quantidade, int corridaId) {
        this.id = id;
        this.tipo = tipo;
        this.preco = preco;
        this.dataInicio = dataInicio;
        this.dataFinal = dataFinal;
        this.quantidade = quantidade;
        this.corridaId = corridaId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public float getPreco() {
        return preco;
    }

    public void setPreco(float preco) {
        this.preco = preco;
    }

    public String getDataInicio() {
        return dataInicio;
    }

    public void setDataInicio(String dataInicio) {
        this.dataInicio = dataInicio;
    }

    public String getDataFinal() {
        return dataFinal;
    }

    public void setDataFinal(String dataFinal) {
        this.dataFinal = dataFinal;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public Corrida getCorrida() {
        return corrida;
    }

    public void setCorrida(Corrida corrida) {
        this.corrida = corrida;
    }

    /*
    public void cadastrarIngresso(quantidade){
        
    }
     */
    public int getCorridaId() {
        return corridaId;
    }

    public void setCorridaId(int corridaId) {
        this.corridaId = corridaId;
    }
}
