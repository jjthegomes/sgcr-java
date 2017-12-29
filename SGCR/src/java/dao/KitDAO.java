package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modelo.Kit;
import modelo.Organizador;

/**
 *
 * @author RAJ
 */
public class KitDAO {
    public static List<Kit> obterKits() throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Kit> kits = new ArrayList<Kit>();
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM kit");
            
            while (rs.next()) {
                Kit kit = new Kit(
                        rs.getInt("id"), 
                        rs.getString("nome"),
                        rs.getString("descricao"),
                        rs.getString("imagem"), 
                        rs.getString("tipo_chip"),
                        rs.getString("data_inicio_retirada"),
                        rs.getString("data_final_retirada"),
                        null);
                kit.setOrganizadorId(rs.getInt("organizador_id"));
                kit.setOrganizador(Organizador.obterOrganizador(rs.getInt("organizador_id")));
                kits.add(kit);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return kits;
    }
    
    public static List<Kit> obterKits(int organizadorId) throws ClassNotFoundException  {
        Connection conexao = null;
        Statement comando = null;
        List<Kit> kits = new ArrayList<Kit>();
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM kit WHERE organizador_id = "+organizadorId);
            
            while (rs.next()) {
                Kit kit = new Kit(
                        rs.getInt("id"), 
                        rs.getString("nome"),
                        rs.getString("descricao"),
                        rs.getString("imagem"), 
                        rs.getString("tipo_chip"),
                        rs.getString("data_inicio_retirada"),
                        rs.getString("data_final_retirada"),
                        null);
                kit.setOrganizadorId(rs.getInt("organizador_id"));
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
            String sql = "INSERT INTO kit (nome, descricao, imagem, tipo_chip, data_inicio_retirada, data_final_retirada, organizador_id) VALUES (?,?,?,?,?,?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, kit.getNome());
            comando.setString(2, kit.getDescricao());
            comando.setString(3, kit.getImagem());
            comando.setString(4, kit.getTipoChip());
            comando.setString(5, kit.getDataInicioRetirada());
            comando.setString(6, kit.getDataFinalRetirada());
            comando.setInt(7, kit.getOrganizador().getId());

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
            String sql = "UPDATE kit SET nome = ?, descricao = ?, imagem = ?, tipo_chip = ?, data_inicio_retirada = ?, data_final_retirada = ?, organizador_id = ?  WHERE id = ?";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, kit.getNome());
            comando.setString(2, kit.getDescricao());
            comando.setString(3, kit.getImagem());
            comando.setString(4, kit.getTipoChip());
            comando.setString(5, kit.getDataInicioRetirada());
            comando.setString(6, kit.getDataFinalRetirada());
            comando.setInt(7, kit.getOrganizador().getId());
            comando.setInt(8, kit.getId());
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
            stringSQL = "DELETE FROM kit WHERE id = " + kit.getId();
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
            ResultSet rs = comando.executeQuery("SELECT * FROM kit WHERE id = " + id);
            rs.first();
            kit = new Kit (
                    rs.getInt("id"), 
                    rs.getString("nome"),
                    rs.getString("descricao"),
                    rs.getString("imagem"), 
                    rs.getString("tipo_chip"),
                    rs.getString("data_inicio_retirada"),
                    rs.getString("data_final_retirada"),
                    null);
            kit.setOrganizadorId(rs.getInt("organizador_id"));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return kit;
    }
    
    public static Kit obterKit(int id, int organizadorId) throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        Kit kit = null;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM kit WHERE id = " + id + " AND organizador_id = " + organizadorId);
            rs.first();
            kit = new Kit (
                    rs.getInt("id"), 
                    rs.getString("nome"),
                    rs.getString("descricao"),
                    rs.getString("imagem"), 
                    rs.getString("tipo_chip"),
                    rs.getString("data_inicio_retirada"),
                    rs.getString("data_final_retirada"),
                    null);
            kit.setOrganizadorId(rs.getInt("organizador_id"));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return kit;
    }
    
    public static List<Kit> obterKitsCorrida(int corridaId) throws ClassNotFoundException  {
        Connection conexao = null;
        Statement comando = null;
        List<Kit> kits = new ArrayList<Kit>();
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM kit INNER JOIN kit_corrida ON kit.id = kit_corrida.kit_id WHERE kit_corrida.corrida_id = " + corridaId);
            
            while (rs.next()) {
                Kit kit = new Kit(
                        rs.getInt("id"), 
                        rs.getString("nome"),
                        rs.getString("descricao"),
                        rs.getString("imagem"), 
                        rs.getString("tipo_chip"),
                        rs.getString("data_inicio_retirada"),
                        rs.getString("data_final_retirada"),
                        null);
                kit.setOrganizadorId(rs.getInt("organizador_id"));
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
