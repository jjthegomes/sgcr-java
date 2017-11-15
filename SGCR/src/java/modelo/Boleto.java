/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import dao.BoletoDAO;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author RAJ
 */
public class Boleto implements Pagamento {

    private int id;
    private String codigoBarra;
    private String dataEmissao;
    private String dataVencimento;
    private String nomeTitular;
    private String cpfTitular;

    public Boleto(int id, String codigoBarra, String dataEmissao, String dataVencimento, String nomeTitular, String cpfTitular) {
        this.id = id;
        this.codigoBarra = codigoBarra;
        this.dataEmissao = dataEmissao;
        this.dataVencimento = dataVencimento;
        this.nomeTitular = nomeTitular;
        this.cpfTitular = cpfTitular;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCodigoBarra() {
        return codigoBarra;
    }

    public void setCodigoBarra(String codigoBarra) {
        this.codigoBarra = codigoBarra;
    }

    public String getDataEmissao() {
        return dataEmissao;
    }

    public void setDataEmissao(String dataEmissao) {
        this.dataEmissao = dataEmissao;
    }

    public String getDataVencimento() {
        return dataVencimento;
    }

    public void setDataVencimento(String dataVencimento) {
        this.dataVencimento = dataVencimento;
    }

    public String getNomeTitular() {
        return nomeTitular;
    }

    public void setNomeTitular(String nomeTitular) {
        this.nomeTitular = nomeTitular;
    }

    public String getCpfTitular() {
        return cpfTitular;
    }

    public void setCpfTitular(String cpfTitular) {
        this.cpfTitular = cpfTitular;
    }

    @Override
    public void confirmarPagamento() {

    }

    public void gravar() throws SQLException, ClassNotFoundException {
        BoletoDAO.gravar(this);
    }

    public void alterar() throws SQLException, ClassNotFoundException {
        BoletoDAO.alterar(this);
    }

    public void excluir() throws SQLException, ClassNotFoundException {
        BoletoDAO.excluir(this);
    }

    public static List<Boleto> obterBoletos() throws ClassNotFoundException {
        return BoletoDAO.obterBoletos();
    }

    public static Boleto obterBoleto(int id) throws ClassNotFoundException {
        return BoletoDAO.obterBoleto(id);
    }

}
