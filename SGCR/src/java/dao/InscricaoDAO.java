package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modelo.Inscricao;

/**
 *
 * @author RAJ
 */
public class InscricaoDAO {

    public static List<Inscricao> obterInscricoes() throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Inscricao> inscricoes = new ArrayList<>();

        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM inscricao");
            while (rs.next()) {

                Inscricao inscricao = new Inscricao(
                        rs.getInt("id"),
                        rs.getString("dataCompra"),
                        rs.getString("numeroPeito"),
                        rs.getBoolean("pago"),
                        rs.getString("formaPagamento"),
                        rs.getString("tempoPercorrido"),
                        null,
                        null,
                        null);

                inscricao.setAtletasId(rs.getInt("atletasId"));
                inscricao.setPercursosId(rs.getInt("percursosId"));
                inscricao.setKitsId(rs.getInt("kitsId"));
                inscricoes.add(inscricao);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return inscricoes;
    }

    public static void gravar(Inscricao inscricao) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "INSERT INTO inscricao (id, dataCompra, numeroPeito, tempoPercorrido, formaPagamento, "
                    + "pago, percursosId, atletasId, kitsId) VALUES (?,?,?,?,?,?,?,?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setInt(1, inscricao.getId());
            comando.setString(2, inscricao.getDataCompra());
            comando.setString(3, inscricao.getNumeroPeito());
            comando.setString(4, inscricao.getTempoPercorrido());
            comando.setString(5, inscricao.getFormaPagamento());
            comando.setBoolean(6, inscricao.isPago());
            comando.setInt(7, inscricao.getPercurso().getId());
            comando.setInt(8, inscricao.getAtleta().getId());
            comando.setInt(9, inscricao.getKit().getId());

            comando.execute();
            comando.close();
            conexao.close();
        } catch (SQLException e) {
            throw e;
        }
    }

    public static void alterar(Inscricao inscricao) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "UPDATE inscricao SET dataCompra = ?, numeroPeito = ?, tempoPercorrido = ?, formaPagamento = ?, "
                    + "pago = ?, percursosId = ?, atletasId = ?, kitsId = ? WHERE id = ?";

            PreparedStatement comando = conexao.prepareStatement(sql);

            comando.setString(1, inscricao.getDataCompra());
            comando.setString(2, inscricao.getNumeroPeito());
            comando.setString(3, inscricao.getTempoPercorrido());
            comando.setString(4, inscricao.getFormaPagamento());
            comando.setBoolean(5, inscricao.isPago());
            comando.setInt(6, inscricao.getPercurso().getId());
            comando.setInt(7, inscricao.getAtleta().getId());
            comando.setInt(8, inscricao.getKit().getId());
            comando.setInt(9, inscricao.getId());

            comando.execute();
            comando.close();
            conexao.close();
        } catch (SQLException e) {
            throw e;
        }
    }

    public static void excluir(Inscricao inscricao) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        String stringSQL;

        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            stringSQL = "DELETE FROM inscricao WHERE id = " + inscricao.getId();
            comando.execute(stringSQL);
        } catch (Exception e) {
            throw e;
        } finally {
            fecharConexao(conexao, comando);
        }
    }

    public static Inscricao obterInscricao(int id) throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        Inscricao inscricao = null;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM inscricao WHERE id = " + id);
            rs.first();
            inscricao = new Inscricao(
                    rs.getInt("id"),
                    rs.getString("dataCompra"),
                    rs.getString("numeroPeito"),
                    rs.getBoolean("pago"),
                    rs.getString("formaPagamento"),
                    rs.getString("tempoPercorrido"),
                    null,
                    null,
                    null);

            inscricao.setAtletasId(rs.getInt("atletasId"));
            inscricao.setPercursosId(rs.getInt("percursosId"));
            inscricao.setKitsId(rs.getInt("kitsId"));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return inscricao;
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
