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
import modelo.Organizador;

/**
 *
 * @author RAJ
 */
public class CorridaDAO {

    public static List<Corrida> obterCorridas() throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Corrida> corridas = new ArrayList<>();
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM corrida");

            while (rs.next()) {
                Corrida corrida = new Corrida(
                        rs.getInt("id"),
                        rs.getString("nome"),
                        rs.getInt("max_pessoa"),
                        rs.getString("horario"),
                        rs.getString("data"),
                        rs.getString("banner"),
                        rs.getString("logradouro"),
                        rs.getString("cep"),
                        rs.getString("numero"),
                        rs.getString("cidade"),
                        rs.getString("estado"),
                        rs.getString("bairro"),
                        rs.getString("descricao"),
                        rs.getString("regulamento"),
                        rs.getString("edicao"),
                        rs.getBoolean("ativo"),
                        null);
                corrida.setOrganizadorId(rs.getInt("organizador_id"));
                corrida.setOrganizador(Organizador.obterOrganizador(rs.getInt("organizador_id")));
                corridas.add(corrida);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return corridas;
    }

    public static List<Corrida> obterCorridas(int id) throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Corrida> corridas = new ArrayList<>();
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM corrida WHERE organizador_id = " + id);

            while (rs.next()) {
                Corrida corrida = new Corrida(
                        rs.getInt("id"),
                        rs.getString("nome"),
                        rs.getInt("max_pessoa"),
                        rs.getString("horario"),
                        rs.getString("data"),
                        rs.getString("banner"),
                        rs.getString("logradouro"),
                        rs.getString("cep"),
                        rs.getString("numero"),
                        rs.getString("cidade"),
                        rs.getString("estado"),
                        rs.getString("bairro"),
                        rs.getString("descricao"),
                        rs.getString("regulamento"),
                        rs.getString("edicao"),
                        rs.getBoolean("ativo"),
                        null);
                corrida.setOrganizadorId(id);
                corrida.setOrganizador(Organizador.obterOrganizador(id));
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
            String sql = "INSERT INTO corrida (nome, max_pessoa, horario, data, banner, "
                    + "logradouro, cep, numero, cidade, estado, bairro, descricao, regulamento, edicao, ativo, organizador_id) "
                    + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, corrida.getNome());
            comando.setInt(2, corrida.getMaxPessoa());
            comando.setString(3, corrida.getHorario());
            comando.setString(4, corrida.getData());
            comando.setString(5, corrida.getBanner());
            comando.setString(6, corrida.getLogradouro());
            comando.setString(7, corrida.getCep());
            comando.setString(8, corrida.getNumero());
            comando.setString(9, corrida.getCidade());
            comando.setString(10, corrida.getEstado());
            comando.setString(11, corrida.getBairro());
            comando.setString(12, corrida.getDescricao());
            comando.setString(13, corrida.getRegulamento());
            comando.setString(14, corrida.getEdicao());
            comando.setBoolean(15, corrida.isAtivo());
            comando.setInt(16, corrida.getOrganizador().getId());
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
            String sql = "UPDATE corrida SET nome = ?, max_pessoa = ?, horario = ?, data = ?, "
                    + "banner = ?, logradouro = ?, cep = ?, numero = ?, cidade = ?, estado = ? , bairro = ?, "
                    + "descricao = ?, regulamento = ?, edicao = ?, ativo = ?, organizador_id = ? WHERE id = ?";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, corrida.getNome());
            comando.setInt(2, corrida.getMaxPessoa());
            comando.setString(3, corrida.getHorario());
            comando.setString(4, corrida.getData());
            comando.setString(5, corrida.getBanner());
            comando.setString(6, corrida.getLogradouro());
            comando.setString(7, corrida.getCep());
            comando.setString(8, corrida.getNumero());
            comando.setString(9, corrida.getCidade());
            comando.setString(10, corrida.getEstado());
            comando.setString(11, corrida.getBairro());
            comando.setString(12, corrida.getDescricao());
            comando.setString(13, corrida.getRegulamento());
            comando.setString(14, corrida.getEdicao());
            comando.setBoolean(15, corrida.isAtivo());
            comando.setInt(16, corrida.getOrganizador().getId());
            comando.setInt(17, corrida.getId());
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
                    rs.getInt("max_pessoa"),
                    rs.getString("horario"),
                    rs.getString("data"),
                    rs.getString("banner"),
                    rs.getString("logradouro"),
                    rs.getString("cep"),
                    rs.getString("numero"),
                    rs.getString("cidade"),
                    rs.getString("estado"),
                    rs.getString("bairro"),
                    rs.getString("descricao"),
                    rs.getString("regulamento"),
                    rs.getString("edicao"),
                    rs.getBoolean("ativo"),
                    null);
            corrida.setOrganizadorId(rs.getInt("organizador_id"));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return corrida;
    }

    public static Corrida obterUltimaCorrida(int id) throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM `corrida` WHERE organizador_id = " + id
                    + " ORDER BY `corrida`.`id` DESC");

            if (rs.first()) {
                Corrida corrida = new Corrida(
                        rs.getInt("id"),
                        rs.getString("nome"),
                        rs.getInt("max_pessoa"),
                        rs.getString("horario"),
                        rs.getString("data"),
                        rs.getString("banner"),
                        rs.getString("logradouro"),
                        rs.getString("cep"),
                        rs.getString("numero"),
                        rs.getString("cidade"),
                        rs.getString("estado"),
                        rs.getString("bairro"),
                        rs.getString("descricao"),
                        rs.getString("regulamento"),
                        rs.getString("edicao"),
                        rs.getBoolean("ativo"),
                        null);
                corrida.setOrganizadorId(rs.getInt("organizador_id"));
                corrida.setOrganizador(Organizador.obterOrganizador(rs.getInt("organizador_id")));
                return corrida;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return null;
    }
    public static List<Corrida> buscaCorridas(String nome) throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Corrida> corridas = new ArrayList<>();
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM corrida WHERE LOWER(nome) LIKE '%"+nome+"%'" );

            while (rs.next()) {
                Corrida corrida = new Corrida(
                        rs.getInt("id"),
                        rs.getString("nome"),
                        rs.getInt("max_pessoa"),
                        rs.getString("horario"),
                        rs.getString("data"),
                        rs.getString("banner"),
                        rs.getString("logradouro"),
                        rs.getString("cep"),
                        rs.getString("numero"),
                        rs.getString("cidade"),
                        rs.getString("estado"),
                        rs.getString("bairro"),
                        rs.getString("descricao"),
                        rs.getString("regulamento"),
                        rs.getString("edicao"),
                        rs.getBoolean("ativo"),
                        null);
                corrida.setOrganizadorId(rs.getInt("organizador_id"));
                corrida.setOrganizador(Organizador.obterOrganizador(rs.getInt("organizador_id")));
                corridas.add(corrida);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return corridas;
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
