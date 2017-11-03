package modelo;

import dao.CorridaDAO;
import dao.IngressoDAO;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author RAJ
 */
public class Ingresso {

    private int id;
    private String tipo;
    private double preco;
    private String dataInicio;
    private String dataFinal;
    private int quantidade;
    private Corrida corrida;

    private int corridasId;

    public Ingresso(int id, String tipo, double preco, String dataInicio, String dataFinal, int quantidade, Corrida corrida) {
        this.id = id;
        this.tipo = tipo;
        this.preco = preco;
        this.dataInicio = dataInicio;
        this.dataFinal = dataFinal;
        this.quantidade = quantidade;
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

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
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

    public static List<Ingresso> obterIngressos() throws ClassNotFoundException {
        return IngressoDAO.obterIngressos();
    }

    public void gravar() throws ClassNotFoundException, SQLException {
        IngressoDAO.gravar(this);
    }

    public void alterar() throws ClassNotFoundException, SQLException {
        IngressoDAO.alterar(this);
    }

    public void excluir() throws ClassNotFoundException, SQLException {
        IngressoDAO.alterar(this);
    }

    public static Ingresso obterIngresso(int id) throws ClassNotFoundException {
        return IngressoDAO.obterIngresso(id);
    }

}
