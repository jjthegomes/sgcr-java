
package modelo;

/**
 *
 * @author RAJ
 */
public class Kit {
    private int id;
    private int quantidade;
    private String  imagemKit;
    private String tipoChip;

    public Kit(int id, int quantidade, String imagemKit, String tipoChip) {
        this.id = id;
        this.quantidade = quantidade;
        this.imagemKit = imagemKit;
        this.tipoChip = tipoChip;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public String getImagemKit() {
        return imagemKit;
    }

    public void setImagemKit(String imagemKit) {
        this.imagemKit = imagemKit;
    }

    public String getTipoChip() {
        return tipoChip;
    }

    public void setTipoChip(String tipoChip) {
        this.tipoChip = tipoChip;
    }
    
}
