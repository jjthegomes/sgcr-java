
package modelo;

/**
 *
 * @author RAJ
 */
public class Kit {
    private int id;
    private String imagemKit;
    private String tipoChip;
    private Corrida corrida;
    private int corridasId;

    public Kit() {
    }

    public Kit(int id, String imagemKit, String tipoChip, int corridasId) {
        this.id = id;
        this.imagemKit = imagemKit;
        this.tipoChip = tipoChip;
        this.corridasId = corridasId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public Corrida getCorrida() {
        return corrida;
    }

    public void setCorrida(Corrida corrida) {
        this.corrida = corrida;
    }

    public int getCorridasId() {
        return corridasId;
    }

    public void setCorridasId(int corridasId) {
        this.corridasId = corridasId;
    }
}
