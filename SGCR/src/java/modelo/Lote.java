package modelo;

import dao.LoteDAO;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author RAJ
 */
public class Lote {

    private int id;
    private String tipo;
    private double preco;
    private String dataInicio;
    private String dataFinal;
    private Corrida corrida;

    private int corridaId;

    public Lote(int id, String tipo, double preco, String dataInicio, String dataFinal, Corrida corrida) {
        this.id = id;
        this.tipo = tipo;
        this.preco = preco;
        this.dataInicio = dataInicio;
        this.dataFinal = dataFinal;
        this.corrida = corrida;
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

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
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

    public static List<Lote> obterLotes() throws ClassNotFoundException {
        return LoteDAO.obterLotes();
    }
    
    public static List<Lote> obterLotes(int corridaId) throws ClassNotFoundException {
        return LoteDAO.obterLotes(corridaId);
    }

    public void gravar() throws ClassNotFoundException, SQLException {
        LoteDAO.gravar(this);
    }

    public void alterar() throws ClassNotFoundException, SQLException {
        LoteDAO.alterar(this);
    }

    public void excluir() throws ClassNotFoundException, SQLException {
        LoteDAO.excluir(this);
    }

    public static Lote obterLote(int id) throws ClassNotFoundException {
        return LoteDAO.obterLote(id);
    }

}
