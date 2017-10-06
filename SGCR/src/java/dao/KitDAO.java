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
import modelo.Kit;

/**
 *
 * @author RAJ
 */
public class KitDAO {
    public static List<Kit> obterKit() throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Kit> kits = new ArrayList<Kit>();
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from kits");
            
            while (rs.next()) {
                Kit kit = new Kit(
                        rs.getInt("id"), 
                        rs.getString("imagemKit"), 
                        rs.getString("tipoChip"), 
                        0);
                kit.setCorridasId(rs.getInt("corridasId"));
                kits.add(kit);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return kits;
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
