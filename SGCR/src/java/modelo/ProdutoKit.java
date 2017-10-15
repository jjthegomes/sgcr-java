
package modelo;

import dao.ProdutoKitDAO;
import java.util.List;

/**
 *
 * @author RAJ
 */
public class ProdutoKit {
    private int id;
    private String nome;
    private Double valor;
    private Kit kits;
    private int kitsId;

    public ProdutoKit() {
    }

    public ProdutoKit(int id, String nome, Double valor, int kitsId) {
        this.id = id;
        this.nome = nome;
        this.valor = valor;
        this.kitsId = kitsId;
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

    public void setNome(String nomeProduto) {
        this.nome = nome;
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
    
     public static List<ProdutoKit> obterProdutos_Kit() throws ClassNotFoundException{
        return ProdutoKitDAO.obterProdutos_Kit();
    }
}
