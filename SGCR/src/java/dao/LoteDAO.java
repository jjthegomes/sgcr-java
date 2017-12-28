package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modelo.Corrida;
import modelo.Lote;

/**
 *
 * @author RAJ
 */
public class LoteDAO {

    public static List<Lote> obterLotes() throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Lote> lotes = new ArrayList<Lote>();

        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM lote");
            while (rs.next()) {
                Lote lote = new Lote(
                        rs.getInt("id"),
                        rs.getString("tipo"),
                        rs.getFloat("preco"),
                        rs.getString("data_inicio"),
                        rs.getString("data_final"),
                        null);
                lote.setCorridaId(rs.getInt("corrida_id"));
                lote.setCorrida(Corrida.obterCorrida(rs.getInt("corrida_id")));
                lotes.add(lote);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return lotes;
    }
    public static List<Lote> obterLotes(int corridaId) throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Lote> lotes = new ArrayList<Lote>();

        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM lote WHERE corrida_id = " + corridaId);
            while (rs.next()) {
                Lote lote = new Lote(
                        rs.getInt("id"),
                        rs.getString("tipo"),
                        rs.getFloat("preco"),
                        rs.getString("data_inicio"),
                        rs.getString("data_final"),
                        null);
                lote.setCorridaId(rs.getInt("corrida_id"));
                lotes.add(lote);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return lotes;
    }
    
    public static void gravar(Lote lote) throws ClassNotFoundException, SQLException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "INSERT INTO lote (tipo, preco, data_inicio, data_final, "
                    + "corrida_id) VALUES (?,?,?,?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, lote.getTipo());
            comando.setDouble(2, lote.getPreco());
            comando.setString(3, lote.getDataInicio());
            comando.setString(4, lote.getDataFinal());
            comando.setInt(5, lote.getCorrida().getId());
            comando.execute();
            comando.close();
            conexao.close();

        } catch (SQLException e) {
            throw e;
        }
    }

    public static void excluir(Lote lote) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        String stringSQL;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            stringSQL = "delete from lote where id = " + lote.getId();
            comando.execute(stringSQL);

        } catch (SQLException e) {
            throw e;
        } finally {
            fecharConexao(conexao, comando);
        }
    }

    public static void alterar(Lote lote) throws ClassNotFoundException, SQLException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "UPDATE lote SET tipo = ?, preco = ?, data_inicio = ?, "
                    + "data_final = ?, corrida_id = ? WHERE id = ?";            
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, lote.getTipo());
            comando.setDouble(2, lote.getPreco());
            comando.setString(3, lote.getDataInicio());
            comando.setString(4, lote.getDataFinal());
            comando.setInt(5, lote.getCorrida().getId());
            comando.setInt(6, lote.getId());

            comando.execute();
            comando.close();
            conexao.close();

        } catch (SQLException e) {
            throw e;
        }
    }

    public static Lote obterLote(int id) throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        Lote lote = null;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM lote WHERE id = " + id);
            rs.first();
            lote = new Lote(
                    rs.getInt("id"),
                    rs.getString("tipo"),
                    rs.getDouble("preco"),
                    rs.getString("data_inicio"),
                    rs.getString("data_final"),
                    null);
            lote.setCorridaId(rs.getInt("corrida_id"));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return lote;
    }

    public static void fecharConexao(Connection conexao, Statement comando) {
        try {
            if (comando != null) {
                comando.close();
            }

            if (comando != null) {
                conexao.close();
            }

        } catch (SQLException e) {

        }
    }
}
