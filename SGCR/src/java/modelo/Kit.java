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
    private String imagem;
    private String tipoChip;
    private String dataInicioRetirada;
    private String dataFinalRetirada;
    private Organizador organizador;

    private int organizadorId;

    public Kit() {
    }

    public Kit(int id, String nome, String imagem, String tipoChip, String dataInicioRetirada, String dataFinalRetirada, Organizador organizador) {
        this.id = id;
        this.nome = nome;
        this.imagem = imagem;
        this.tipoChip = tipoChip;
        this.dataInicioRetirada = dataInicioRetirada;
        this.dataFinalRetirada = dataFinalRetirada;
        this.organizador = organizador;
    }
    
    public Kit(String nome, String imagem, String tipoChip, String dataInicioRetirada, String dataFinalRetirada, Organizador organizador) {
        this.nome = nome;
        this.imagem = imagem;
        this.tipoChip = tipoChip;
        this.dataInicioRetirada = dataInicioRetirada;
        this.dataFinalRetirada = dataFinalRetirada;
        this.organizador = organizador;
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

    public String getDataInicioRetirada() {
        return dataInicioRetirada;
    }

    public void setDataInicioRetirada(String dataInicioRetirada) {
        this.dataInicioRetirada = dataInicioRetirada;
    }

    public String getDataFinalRetirada() {
        return dataFinalRetirada;
    }

    public void setDataFinalRetirada(String dataFinalRetirada) {
        this.dataFinalRetirada = dataFinalRetirada;
    }
    
    public Organizador getOrganizador() {
        return organizador;
    }

    public void setOrganizador(Organizador organizador) {
        this.organizador = organizador;
    }

    public int getOrganizadorId() {
        return organizadorId;
    }

    public void setOrganizadorId(int organizadorId) {
        this.organizadorId = organizadorId;
    }

    public static List<Kit> obterKits() throws ClassNotFoundException {
        return KitDAO.obterKits();
    }
    
    public static List<Kit> obterKits(int organizadorId) throws ClassNotFoundException {
        return KitDAO.obterKits(organizadorId);
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
    
    public static Kit obterKit(int id, int organizadorId) throws ClassNotFoundException {
        return KitDAO.obterKit(id, organizadorId);
    }
    
    public static Kit obterKitCorrida(int kitId, int corridaId) throws ClassNotFoundException {
        return KitDAO.obterKitCorrida(kitId, corridaId);
    }
}
