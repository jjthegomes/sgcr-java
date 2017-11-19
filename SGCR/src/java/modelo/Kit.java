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
    private String nome;
    private int quantidade;
    private String imagem;
    private String tipoChip;
    private Corrida corrida;

    private int corridaId;

    public Kit() {
    }

    public Kit(int id, String nome, int quantidade, String imagem, String tipoChip, Corrida corrida) {
        this.id = id;
        this.nome = nome;
        this.quantidade = quantidade;
        this.imagem = imagem;
        this.tipoChip = tipoChip;
        this.corrida = corrida;
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

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }
    
    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagemKit) {
        this.imagem = imagemKit;
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

    public int getCorridaId() {
        return corridaId;
    }

    public void setCorridaId(int corridaId) {
        this.corridaId = corridaId;
    }

    public static List<Kit> obterKits() throws ClassNotFoundException {
        return KitDAO.obterKits();
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
    
    public static Kit obterKit(int id, int corridaId) throws ClassNotFoundException {
        return KitDAO.obterKit(id, corridaId);
    }
}
