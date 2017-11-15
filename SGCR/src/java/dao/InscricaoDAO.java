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
                        rs.getString("data_compra"),
                        rs.getString("numero_peito"),
                        rs.getBoolean("pago"),
                        rs.getString("kit_retirado"),
                        rs.getString("tempo_largada"),
                        rs.getString("tempo_chegada"),
                        null,
                        null,
                        null,
                        null);
                inscricao.setPercursoId(rs.getInt("percurso_id"));
                inscricao.setBoletoId(rs.getInt("boleto_id"));
                inscricao.setAtletaId(rs.getInt("atleta_id"));
                inscricao.setCartaoCreditoId(rs.getInt("cartao_credito_id"));
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
            String sql = "INSERT INTO inscricao (id, data_compra, numero_peito, pago, kit_retirado, tempo_largada, "
                    + "tempo_chegada, percurso_id, atleta_id, boleto_id, cartao_credito_id) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setInt(1, inscricao.getId());
            comando.setString(2, inscricao.getDataCompra());
            comando.setString(3, inscricao.getNumeroPeito());
            comando.setBoolean(4, inscricao.isPago());
            comando.setString(5, inscricao.getKitRetirado());
            comando.setString(6, inscricao.getTempoLargada());
            comando.setInt(7, inscricao.getTempoChegada());
            comando.setInt(8, inscricao.getPercurso().getId());
            comando.setInt(9, inscricao.getAtleta().getId());
            comando.setInt(10, inscricao.getBoleto().getId());
            comando.setInt(11, inscricao.getCartaoCredito().getId());

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
            String sql = "UPDATE inscricao SET data_compra = ?, numero_peito = ?, pago = ?, kit_retirado = ?, "
                    + " tempo_largada = ?,  tempo_chegada = ?, percurso_id = ?, atleta_id = ?, boleto_id = ?, "
                    + "cartao_credito_id = ? WHERE id = ?";

            PreparedStatement comando = conexao.prepareStatement(sql);

            comando.setInt(1, inscricao.getId());
            comando.setString(2, inscricao.getDataCompra());
            comando.setString(3, inscricao.getNumeroPeito());
            comando.setBoolean(4, inscricao.isPago());
            comando.setString(5, inscricao.getKitRetirado());
            comando.setString(6, inscricao.getTempoLargada());
            comando.setInt(7, inscricao.getTempoChegada());
            comando.setInt(8, inscricao.getPercurso().getId());
            comando.setInt(9, inscricao.getAtleta().getId());
            comando.setInt(10, inscricao.getBoleto().getId());
            comando.setInt(11, inscricao.getCartaoCredito().getId());

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
                        rs.getString("data_compra"),
                        rs.getString("numero_peito"),
                        rs.getBoolean("pago"),
                        rs.getString("kit_retirado"),
                        rs.getString("tempo_largada"),
                        rs.getString("tempo_chegada"),
                        null,
                        null,
                        null,
                        null);

            inscricao.setBoletoId(rs.getInt("boleto_id"));
            inscricao.setAtletaId(rs.getInt("atleta_id"));
            inscricao.setCartaoCreditoId(rs.getInt("cartao_credito_id"));
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
