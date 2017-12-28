package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import modelo.Atleta;
import modelo.Inscricao;
import modelo.Kit;
import modelo.Lote;
import modelo.Percurso;

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
                        rs.getBoolean("kit_retirado"),
                        rs.getString("tempo_largada"),
                        rs.getString("tempo_chegada"),
                        null,
                        null,
                        null,
                        null);
                inscricao.setPercursoId(rs.getInt("percurso_id"));
                inscricao.setAtletaId(rs.getInt("atleta_id"));
                inscricao.setKitId(rs.getInt("kit_id"));
                inscricao.setKitCorridaId(rs.getInt("kit_corrida_id"));
                inscricao.setLoteId(rs.getInt("lote_id"));
                inscricao.setPercurso(Percurso.obterPercurso((rs.getInt("percurso_id"))));
                inscricao.setAtleta(Atleta.obterAtleta((rs.getInt("atleta_id"))));
                inscricao.setKit(Kit.obterKit(rs.getInt("Kit_id"), rs.getInt("kit_corrida_id")));
                inscricao.setLote(Lote.obterLote((rs.getInt("lote_id"))));
                inscricoes.add(inscricao);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return inscricoes;
    }

    public static List<Inscricao> obterInscricoes(int corridaId) throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Inscricao> inscricoes = new ArrayList<>();

        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM inscricao WHERE kit_corrida_id = " + corridaId);
            while (rs.next()) {

                Inscricao inscricao = new Inscricao(
                        rs.getInt("id"),
                        rs.getString("data_compra"),
                        rs.getString("numero_peito"),
                        rs.getBoolean("pago"),
                        rs.getBoolean("kit_retirado"),
                        rs.getString("tempo_largada"),
                        rs.getString("tempo_chegada"),
                        null,
                        null,
                        null,
                        null);
                inscricao.setPercursoId(rs.getInt("percurso_id"));
                inscricao.setAtletaId(rs.getInt("atleta_id"));
                inscricao.setKitId(rs.getInt("kit_id"));
                inscricao.setKitCorridaId(rs.getInt("kit_corrida_id"));
                inscricao.setLoteId(rs.getInt("lote_id"));
                
                inscricao.setPercurso(Percurso.obterPercurso((rs.getInt("percurso_id"))));
                inscricao.setAtleta(Atleta.obterAtleta((rs.getInt("atleta_id"))));
                inscricao.setKit(Kit.obterKit(rs.getInt("Kit_id"), rs.getInt("kit_corrida_id")));
                inscricao.setLote(Lote.obterLote((rs.getInt("lote_id"))));
                inscricoes.add(inscricao);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return inscricoes;
    }

    public static List<Inscricao> obterInscricoesAtleta(int id) throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Inscricao> inscricoes = new ArrayList<>();

        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM inscricao WHERE atleta_id = " + id);
            while (rs.next()) {

                Inscricao inscricao = new Inscricao(
                        rs.getInt("id"),
                        rs.getString("data_compra"),
                        rs.getString("numero_peito"),
                        rs.getBoolean("pago"),
                        rs.getBoolean("kit_retirado"),
                        rs.getString("tempo_largada"),
                        rs.getString("tempo_chegada"),
                        null,
                        null,
                        null,
                        null);
                inscricao.setPercursoId(rs.getInt("percurso_id"));
                inscricao.setAtletaId(id);
                inscricao.setKitId(rs.getInt("kit_id"));
                inscricao.setKitCorridaId(rs.getInt("kit_corrida_id"));
                inscricao.setLoteId(rs.getInt("lote_id"));
                
                inscricao.setPercurso(Percurso.obterPercurso((rs.getInt("percurso_id"))));
                inscricao.setAtleta(Atleta.obterAtleta((id)));
                inscricao.setKit(Kit.obterKit(rs.getInt("Kit_id"), rs.getInt("kit_corrida_id")));
                inscricao.setLote(Lote.obterLote((rs.getInt("lote_id"))));
                inscricoes.add(inscricao);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return inscricoes;
    }

    
    public static List<Inscricao> obterInscricoesPagas(int corridaId) throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Inscricao> inscricoes = new ArrayList<>();

        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM inscricao WHERE kit_corrida_id = " + corridaId
                    + " and pago =" + true + " and kit_retirado = " + false);
            while (rs.next()) {

                Inscricao inscricao = new Inscricao(
                        rs.getInt("id"),
                        rs.getString("data_compra"),
                        rs.getString("numero_peito"),
                        rs.getBoolean("pago"),
                        rs.getBoolean("kit_retirado"),
                        rs.getString("tempo_largada"),
                        rs.getString("tempo_chegada"),
                        null,
                        null,
                        null,
                        null);
                inscricao.setPercursoId(rs.getInt("percurso_id"));
                inscricao.setAtletaId(rs.getInt("atleta_id"));
                inscricao.setKitId(rs.getInt("kit_id"));
                inscricao.setKitCorridaId(rs.getInt("kit_corrida_id"));
                inscricao.setLoteId(rs.getInt("lote_id"));
                inscricao.setPercurso(Percurso.obterPercurso((rs.getInt("percurso_id"))));
                inscricao.setAtleta(Atleta.obterAtleta((rs.getInt("atleta_id"))));
                inscricao.setKit(Kit.obterKit(rs.getInt("Kit_id"), rs.getInt("kit_corrida_id")));
                inscricao.setLote(Lote.obterLote((rs.getInt("lote_id"))));
                inscricoes.add(inscricao);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return inscricoes;
    }

    public static List<Inscricao> obterInscricoesNaoPagas(int corridaId) throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Inscricao> inscricoes = new ArrayList<>();

        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM inscricao WHERE kit_corrida_id = " + corridaId
                    + " and pago =" + false);
            while (rs.next()) {

                Inscricao inscricao = new Inscricao(
                        rs.getInt("id"),
                        rs.getString("data_compra"),
                        rs.getString("numero_peito"),
                        rs.getBoolean("pago"),
                        rs.getBoolean("kit_retirado"),
                        rs.getString("tempo_largada"),
                        rs.getString("tempo_chegada"),
                        null,
                        null,
                        null,
                        null);
                inscricao.setPercursoId(rs.getInt("percurso_id"));
                inscricao.setAtletaId(rs.getInt("atleta_id"));
                inscricao.setKitId(rs.getInt("kit_id"));
                inscricao.setKitCorridaId(rs.getInt("kit_corrida_id"));
                inscricao.setLoteId(rs.getInt("lote_id"));
                inscricao.setPercurso(Percurso.obterPercurso((rs.getInt("percurso_id"))));
                inscricao.setAtleta(Atleta.obterAtleta((rs.getInt("atleta_id"))));
                inscricao.setKit(Kit.obterKit(rs.getInt("Kit_id"), rs.getInt("kit_corrida_id")));
                inscricao.setLote(Lote.obterLote((rs.getInt("lote_id"))));
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
            String sql = "INSERT INTO inscricao (data_compra, numero_peito, pago, kit_retirado, tempo_largada, "
                    + "tempo_chegada, percurso_id, atleta_id, kit_id, kit_corrida_id, lote_id) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, inscricao.getDataCompra());
            comando.setString(2, inscricao.getNumeroPeito());
            comando.setBoolean(3, inscricao.isPago());
            comando.setBoolean(4, inscricao.isKitRetirado());
            comando.setString(5, inscricao.getTempoLargada());
            comando.setString(6, inscricao.getTempoChegada());
            comando.setInt(7, inscricao.getPercurso().getId());
            comando.setInt(8, inscricao.getAtleta().getId());
            comando.setInt(9, inscricao.getKit().getId());
            comando.setInt(10, inscricao.getKit().getCorridaId());
            comando.setInt(11, inscricao.getLote().getId());

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
                    + " tempo_largada = ?,  tempo_chegada = ?, percurso_id = ?, atleta_id = ?, kit_id = ?, "
                    + "kit_corrida_id = ?, lote_id = ? WHERE id = ?";

            PreparedStatement comando = conexao.prepareStatement(sql);

            comando.setString(1, inscricao.getDataCompra());
            comando.setString(2, inscricao.getNumeroPeito());
            comando.setBoolean(3, inscricao.isPago());
            comando.setBoolean(4, inscricao.isKitRetirado());
            comando.setString(5, inscricao.getTempoLargada());
            comando.setString(6, inscricao.getTempoChegada());
            comando.setInt(7, inscricao.getPercurso().getId());
            comando.setInt(8, inscricao.getAtleta().getId());
            comando.setInt(9, inscricao.getKit().getId());
            comando.setInt(10, inscricao.getKit().getCorridaId());
            comando.setInt(11, inscricao.getLote().getId());
            comando.setInt(12, inscricao.getId());

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
                    rs.getBoolean("kit_retirado"),
                    rs.getString("tempo_largada"),
                    rs.getString("tempo_chegada"),
                    null,
                    null,
                    null,
                    null);
            inscricao.setPercursoId(rs.getInt("percurso_id"));
            inscricao.setAtletaId(rs.getInt("atleta_id"));
            inscricao.setKitId(rs.getInt("kit_id"));
            inscricao.setKitCorridaId(rs.getInt("kit_corrida_id"));
            inscricao.setLoteId(rs.getInt("lote_id"));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return inscricao;
    }

    public static void atualizarResultadoCorrida(List<Inscricao> inscricoes) throws ClassNotFoundException, SQLException {
        for (Inscricao inscricao : inscricoes) {
            Connection conexao = null;
            try {
                conexao = BD.getConexao();
                String sql = "UPDATE inscricao SET tempo_largada = ?, tempo_chegada = ? WHERE id = ?";

                PreparedStatement comando = conexao.prepareStatement(sql);

                comando.setString(1, inscricao.getTempoLargada());
                comando.setString(2, inscricao.getTempoChegada());
                comando.setInt(3, inscricao.getId());

                comando.execute();
                comando.close();
                conexao.close();
            } catch (SQLException e) {
                throw e;
            }
        }
    }

    public static void retirarKit(Inscricao inscricao) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "UPDATE inscricao SET kit_retirado = ? WHERE id = ?";

            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setBoolean(1, inscricao.isKitRetirado());
            comando.setInt(2, inscricao.getId());

            comando.execute();
            comando.close();
            conexao.close();
        } catch (SQLException e) {
            throw e;
        }
    }

    public static void pagarInscricao(Inscricao inscricao) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "UPDATE inscricao SET pago = ? WHERE id = ?";

            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setBoolean(1, inscricao.isPago());
            comando.setInt(2, inscricao.getId());

            comando.execute();
            comando.close();
            conexao.close();
        } catch (SQLException e) {
            throw e;
        }
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
