/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import dao.ProdutoDAO;
import java.sql.SQLException;
import java.util.List;
import java.util.regex.Pattern;

/**
 *
 * @author RAJ
 */
public class Produto{
    private int id;
    private String nome;
    private Administrador administrador;
    private int administradorId;
    
    
    public Produto(){
    }
    

    public Produto(int id, String nome, Administrador administrador) {
        this.id = id;
        this.nome = nome;
        this.administrador = administrador;
    }
    
    public void setAdministradorId(int administradorId) {
        this.administradorId = administradorId;
    }
    
    public Produto(String nome, Administrador administrador) {
        this.nome = nome;
        this.administrador = administrador;
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

    public Administrador getAdministrador() {
        return administrador;
    }

    public void setAdministrador(Administrador administrador) {
        this.administrador = administrador;
    }

    public int getAdministradorId() {
        return administradorId;
    }
    public void gravar() throws SQLException,
        ClassNotFoundException{
         ProdutoDAO.gravar(this);
    }
    public void alterar() throws SQLException, ClassNotFoundException{
        ProdutoDAO.alterar(this);
    }
    
    public void excluir() throws SQLException, ClassNotFoundException{
        ProdutoDAO.excluir(this);
    }
    
    public static List<Produto> obterProdutos() throws ClassNotFoundException{
        return ProdutoDAO.obterProdutos();
    }
    
     public static List<Produto> obterProdutos(int administradorId) throws ClassNotFoundException{
        return ProdutoDAO.obterProdutos(administradorId);
    }
     
    public static Produto obterProduto(int id) throws ClassNotFoundException{
        return ProdutoDAO.obterProduto(id);
    }

}
