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
import modelo.Corrida;

/**
 *
 * @author RAJ
 */
public class CorridaDAO {

    public static List<Corrida> obterCorridas() throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Corrida> corridas = new ArrayList<Corrida>();
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM corrida");

            while (rs.next()) {
                Corrida corrida = new Corrida(
                        rs.getInt("id"),
                        rs.getString("nome"),
                        rs.getInt("max_pessoas"),
                        rs.getString("horario"),
                        rs.getString("data"),
                        rs.getString("banner"),
                        rs.getString("logradouro"),
                        rs.getString("cep"),
                        rs.getString("cidade"),
                        rs.getString("estado"),
                        rs.getString("bairro"),
                        rs.getString("descricao"),
                        rs.getString("regulamento"),
                        null);
                corrida.setOrganizadorId(rs.getInt("organizador_id"));
                corridas.add(corrida);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return corridas;
    }

    public static void gravar(Corrida corrida) throws ClassNotFoundException, SQLException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "INSERT INTO corrida (id, nome, max_pessoas, horario, data, banner, "
                    + "logradouro, cep, cidade, estado, bairro, descricao, regulamento, organizador_id) "
                    + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setInt(1, corrida.getId());
            comando.setString(2, corrida.getNome());
            comando.setInt(3, corrida.getMaxPessoas());
            comando.setString(4, corrida.getHorario());
            comando.setString(5, corrida.getData());
            comando.setString(6, corrida.getBanner());
            comando.setString(7, corrida.getLogradouro());
            comando.setString(8, corrida.getCep());
            comando.setString(9, corrida.getCidade());
            comando.setString(10, corrida.getEstado());
            comando.setString(11, corrida.getBairro());
            comando.setString(12, corrida.getDescricao());
            comando.setString(13, corrida.getRegulamento());
            comando.setInt(14, corrida.getOrganizador().getId());
            comando.execute();
            comando.close();
            conexao.close();

        } catch (SQLException e) {
            throw e;
        }
    }

    public static void excluir(Corrida corrida) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        String stringSQL;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            stringSQL = "DELETE FROM corrida WHERE id = " + corrida.getId();
            comando.execute(stringSQL);

        } catch (SQLException e) {
            throw e;
        } finally {
            fecharConexao(conexao, comando);
        }
    }

    public static void alterar(Corrida corrida) throws ClassNotFoundException, SQLException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "UPDATE corrida SET nome = ?, max_pessoas = ?, horario = ?, data = ?, "
                    + "banner = ?, logradouro = ?, cep = ?, cidade = ?, estado = ? , bairro = ?, "
                    + "descricao = ?, regulamento = ?, organizador_id = ? WHERE id = ?";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, corrida.getNome());
            comando.setInt(2, corrida.getMaxPessoas());
            comando.setString(3, corrida.getHorario());
            comando.setString(4, corrida.getData());
            comando.setString(5, corrida.getBanner());
            comando.setString(6, corrida.getLogradouro());
            comando.setString(7, corrida.getCep());
            comando.setString(8, corrida.getCidade());
            comando.setString(9, corrida.getEstado());
            comando.setString(10, corrida.getBairro());
            comando.setString(11, corrida.getDescricao());
            comando.setString(12, corrida.getRegulamento());
            comando.setInt(13, corrida.getOrganizador().getId());
            comando.setInt(14, corrida.getId());
            comando.execute();
            comando.close();
            conexao.close();
        } catch (SQLException e) {
            throw e;
        }
    }

    public static Corrida obterCorrida(int id) throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        Corrida corrida = null;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM corrida WHERE id = " + id);
            rs.first();
            corrida = new Corrida(
                    rs.getInt("id"),
                    rs.getString("nome"),
                    rs.getInt("max_pessoas"),
                    rs.getString("horario"),
                    rs.getString("data"),
                    rs.getString("banner"),
                    rs.getString("logradouro"),
                    rs.getString("cep"),
                    rs.getString("cidade"),
                    rs.getString("estado"),
                    rs.getString("bairro"),
                    rs.getString("descricao"),
                    rs.getString("regulamento"),
                    null);
            corrida.setOrganizadorId(rs.getInt("organizador_id"));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return corrida;
    }

    public static void fecharConexao(Connection conexao, Statement comando) {
        try {
            if (comando != null) {
                comando.close();
            }
            if (conexao != null) {
                conexao.close();
            }
        } catch (SQLException e) {

        }
    }
}
