package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
                        rs.getString("nomeKit"),
                        rs.getString("imagemKit"), 
                        rs.getString("tipoChip"), 
                        null);
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
    
    public static void gravar(Kit kit) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "insert into kits (id,nomeKit,imagemKit,tipoChip,corridasId) values (?,?,?,?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setInt(1, kit.getId());
            comando.setString(2, kit.getNomeKit());
            comando.setString(3, kit.getImagemKit());
            comando.setString(4, kit.getTipoChip());
            comando.setInt(5, kit.getCorrida().getId());

            comando.execute();
            comando.close();
            conexao.close();
        } catch (SQLException e) {
            throw e;
        }
    }
    
    public static void alterar(Kit kit) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "update kits set nomeKit = ?, imagemKit = ?,tipoChip = ?, corridasId = ? where id = ?";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, kit.getNomeKit());
            comando.setString(2, kit.getImagemKit());
            comando.setString(3, kit.getTipoChip());
            comando.setInt(4, kit.getCorrida().getId());
            comando.setInt(5, kit.getId());
            comando.execute();
            comando.close();
            conexao.close();
        } catch (SQLException e) {
            throw e;
        }
    }
    
    public static void excluir(Kit kit) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        String stringSQL;
        
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            stringSQL = "delete from kits where id = " + kit.getId();
            comando.execute(stringSQL);
        } catch (Exception e) {
            throw e;
        } finally {
            fecharConexao(conexao, comando);
        }
    }
    
    public static Kit obterKit(int id) throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        Kit kit = null;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from kits where id = " + id);
            rs.first();
            kit = new Kit (
                    rs.getInt("id"), 
                    rs.getString("nomeKit"),
                    rs.getString("imagemKit"), 
                    rs.getString("tipoChip"),
                    null);
            kit.setCorridasId(rs.getInt("corridasId"));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return kit;
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
