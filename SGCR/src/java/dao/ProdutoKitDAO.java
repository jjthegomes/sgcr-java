/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
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
                        0);
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
