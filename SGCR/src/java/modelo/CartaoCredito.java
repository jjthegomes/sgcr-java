/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import dao.CartaoCreditoDAO;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author RAJ
 */
public class CartaoCredito implements Pagamento {
    private int id;
    private String numero;
    private String codigoSeguranca;
    private String validade;
    private String nomeTitular;

    public CartaoCredito(int id, String numero, String codigoSeguranca, String validade, String nomeTitular) {
        this.id = id;
        this.numero = numero;
        this.codigoSeguranca = codigoSeguranca;
        this.validade = validade;
        this.nomeTitular = nomeTitular;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getCodigoSeguranca() {
        return codigoSeguranca;
    }

    public void setCodigoSeguranca(String codigoSeguranca) {
        this.codigoSeguranca = codigoSeguranca;
    }

    public String getValidade() {
        return validade;
    }

    public void setValidade(String validade) {
        this.validade = validade;
    }

    public String getNomeTitular() {
        return nomeTitular;
    }

    public void setNomeTitular(String nomeTitular) {
        this.nomeTitular = nomeTitular;
    }

    @Override
    public void confirmarPagamento() {
        
    }
    
    public void gravar() throws SQLException,
        ClassNotFoundException{
         CartaoCreditoDAO.gravar(this);
    }
    public void alterar() throws SQLException, ClassNotFoundException{
        CartaoCreditoDAO.alterar(this);
    }
    
    public void excluir() throws SQLException, ClassNotFoundException{
        CartaoCreditoDAO.excluir(this);
    }
    
    public static List<CartaoCredito> obterCartaoCreditos() throws ClassNotFoundException{
        return CartaoCreditoDAO.obterCartoesCredito();
    }
    public static CartaoCredito obterCartaoCredito(int id) throws ClassNotFoundException{
        return CartaoCreditoDAO.obterCartaoCredito(id);
    }
}
