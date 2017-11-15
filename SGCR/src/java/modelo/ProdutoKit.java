
package modelo;

import dao.ProdutoKitDAO;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author RAJ
 */
public class ProdutoKit {
    private int id;
    private String descricao;
    private Double valor;
    private Kit kit;
    private Produto produto;
    
    private int kitId;
    private int produtoId;
    
    public ProdutoKit() {
    }

    public ProdutoKit(int id, String descricao, Double valor, Kit kit) {
        this.id = id;
        this.descricao = descricao;
        this.valor = valor;
        this.kit = kit;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
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

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public int getProdutoId() {
        return produtoId;
    }

    public void setProdutoId(int produtoId) {
        this.produtoId = produtoId;
    }
    
    public void gravar() throws SQLException,
        ClassNotFoundException{
        ProdutoKitDAO.gravar(this);
    }
    public void alterar() throws SQLException, ClassNotFoundException{
        ProdutoKitDAO.alterar(this);
    }
    
    public void excluir() throws SQLException, ClassNotFoundException{
        ProdutoKitDAO.excluir(this);
    }
    
    public static ProdutoKit obterProdutoKit(int id) throws ClassNotFoundException{
        return ProdutoKitDAO.obterProdutoKit(id);
    }
    
     public static List<ProdutoKit> obterProdutos_Kit() throws ClassNotFoundException{
        return ProdutoKitDAO.obterProdutos_Kit();
    }
}
