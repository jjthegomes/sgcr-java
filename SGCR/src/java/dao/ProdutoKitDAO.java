/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modelo.ProdutoKit;

/**
 *
 * @author RAJ
 */
public class ProdutoKitDAO {
    
    public static void gravar (ProdutoKit produtoKit)throws SQLException,
            ClassNotFoundException{
        Connection conexao =null;
        try{
            conexao = BD.getConexao();
            String sql= "insert into produtos_kit (id, nome, valor, kitsId) values (?,?,?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setInt(1,produtoKit.getId());
            comando.setString(2,produtoKit.getNome());
            comando.setDouble(3,produtoKit.getValor());
            comando.setInt(4,produtoKit.getKits().getId());
            comando.execute();
            comando.close();
            conexao.close();
            
        }catch(SQLException e){
            throw e;
        }
    }
    
    public static void alterar (ProdutoKit produtoKit)throws SQLException,
            ClassNotFoundException{
        Connection conexao =null;
        try{
            conexao = BD.getConexao();
            String sql= "upgrade produtos_kit set nome = ?, valor=?, kitId=? "
              +"where id =?";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1,produtoKit.getNome());
            comando.setDouble(2,produtoKit.getValor());
            comando.setInt(3,produtoKit.getKits().getId());
            comando.setInt(4,produtoKit.getId());
            comando.execute();
            comando.close();
            conexao.close();
            
        }catch(SQLException e){
            throw e;
        }
    }
    
    public static void excluir (ProdutoKit produtoKit)throws SQLException,
            ClassNotFoundException{
        Connection conexao =null;
        Statement comando = null;
        String stringSQL;
        try{
          conexao = BD.getConexao();
          comando= conexao.createStatement();
          stringSQL = "delete from produtos_kit where id ="+produtoKit.getId();
                  comando.execute(stringSQL);
        }catch(SQLException e){
            throw e;
        }finally{
            fecharConexao(conexao,comando);
        }
    }
    
    public static ProdutoKit obterProdutoKit (int id)throws ClassNotFoundException{
        Connection conexao = null;
        Statement comando = null;
        ProdutoKit produtoKit =null;
        try{
          conexao =BD.getConexao();
          comando= conexao.createStatement();
          ResultSet rs =  comando.executeQuery("select * from produtos_kit where id = "+ id);
          rs.first();
            produtoKit= new ProdutoKit(rs.getInt("id"),
            rs.getString("nome"),
            rs.getDouble("valor"),
            null);
            produtoKit.setKitsId(rs.getInt("kitsId"));
        }catch(SQLException e){
             e.printStackTrace();
        }finally{
            fecharConexao(conexao,comando);
        }
        return produtoKit;
    }
    
    public static List<ProdutoKit> obterProdutos_Kit() throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<ProdutoKit> produtosKit = new ArrayList<ProdutoKit>();
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from produtos_kit");
            
            while (rs.next()) {
                ProdutoKit produtoKit = new ProdutoKit(
                        rs.getInt("id"), 
                        rs.getString("nome"), 
                        rs.getDouble("valor"), 
                        null);
                produtoKit.setKitsId(rs.getInt("kitsId"));
                produtosKit.add(produtoKit);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return produtosKit;
    }
    
    public static void fecharConexao(Connection conexao, Statement comando) {
        try {
            if(comando != null) {
                comando.close();
            }
            if(conexao != null) {
                conexao.close();
            }
        } catch (SQLException e) {
            
        }
    }
}
