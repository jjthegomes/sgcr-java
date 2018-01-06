/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import dao.BoletoDAO;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

/**
 *
 * @author RAJ
 */
public class Boleto extends Pagamento {

    private String codigoBarra;
    private String dataEmissao;
    private String dataVencimento;
    
    public Boleto(int id, String codigoBarra, String dataEmissao, String dataVencimento, Inscricao inscricao, Corrida inscricaoCorrida) {
        super(id, inscricao, inscricaoCorrida);
        this.codigoBarra = codigoBarra;
        this.dataEmissao = dataEmissao;
        this.dataVencimento = dataVencimento;
    }
    
    public Boleto(Inscricao inscricao, Corrida inscricaoCorrida) {
        super(inscricao, inscricaoCorrida);

        Random random = new Random();
        this.codigoBarra = Integer.toString(100000 + random.nextInt(899999));
        Calendar hoje = Calendar.getInstance();
        this.dataEmissao = hoje.get(Calendar.DAY_OF_MONTH) + "/" + (hoje.get(Calendar.MONTH) + 1) + "/" + hoje.get(Calendar.YEAR);
        this.dataVencimento = (hoje.get(Calendar.DAY_OF_MONTH) + 2) + "/" + (hoje.get(Calendar.MONTH) + 1) + "/" + hoje.get(Calendar.YEAR);
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
