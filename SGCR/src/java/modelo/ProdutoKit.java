
package modelo;

/**
 *
 * @author RAJ
 */
public class ProdutoKit {
    private int id;
    private String nomeProduto;
    private Double valor;
    private Kit kits;
    private int kitsId;

    public ProdutoKit() {
    }

    public ProdutoKit(int id, String nomeProduto, Double valor, int kitsId) {
        this.id = id;
        this.nomeProduto = nomeProduto;
        this.valor = valor;
        this.kitsId = kitsId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNomeProduto() {
        return nomeProduto;
    }

    public void setNomeProduto(String nomeProduto) {
        this.nomeProduto = nomeProduto;
    }

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
    }

    public Kit getKits() {
        return kits;
    }

    public void setKits(Kit kits) {
        this.kits = kits;
    }

    public int getKitsId() {
        return kitsId;
    }

    public void setKitsId(int kitsId) {
        this.kitsId = kitsId;
    }
}
