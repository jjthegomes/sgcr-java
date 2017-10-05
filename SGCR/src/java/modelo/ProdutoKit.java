
package modelo;

/**
 *
 * @author RAJ
 */
public class ProdutoKit {
    private Double valor;
    private int integer;
    private String nomeProduto;

    public ProdutoKit(Double valor, int integer, String nomeProduto) {
        this.valor = valor;
        this.integer = integer;
        this.nomeProduto = nomeProduto;
    }

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
    }

    public int getInteger() {
        return integer;
    }

    public void setInteger(int integer) {
        this.integer = integer;
    }

    public String getNomeProduto() {
        return nomeProduto;
    }

    public void setNomeProduto(String nomeProduto) {
        this.nomeProduto = nomeProduto;
    }
    
    
}
