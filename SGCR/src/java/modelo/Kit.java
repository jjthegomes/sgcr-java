package modelo;

import dao.KitDAO;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author RAJ
 */
public class Kit {

    private int id;
    private String nomeKit;
    private String imagemKit;
    private String tipoChip;
    private Corrida corrida;

    private int corridasId;

    public Kit() {
    }

    public Kit(int id, String nomeKit, String imagemKit, String tipoChip, Corrida corrida) {
        this.id = id;
        this.nomeKit = nomeKit;
        this.imagemKit = imagemKit;
        this.tipoChip = tipoChip;
        this.corrida = corrida;
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

    public String getNomeKit() {
        return nomeKit;
    }

    public void setNomeKit(String nomeKit) {
        this.nomeKit = nomeKit;
    }

    public static List<Kit> obterKits() throws ClassNotFoundException {
        return KitDAO.obterKit();
    }
    
    public void gravar() throws SQLException, ClassNotFoundException {
        KitDAO.gravar(this);
    }

    public void alterar() throws SQLException, ClassNotFoundException {
        KitDAO.alterar(this);
    }
    
    public void excluir() throws SQLException, ClassNotFoundException {
        KitDAO.excluir(this);
    }
    
    public static Kit obterKit(int id) throws ClassNotFoundException {
        return KitDAO.obterKit(id);
    }
}
