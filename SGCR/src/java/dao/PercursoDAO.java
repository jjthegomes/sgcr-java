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
import static jdk.nashorn.internal.runtime.Debug.id;
import modelo.Organizador;
import modelo.Percurso;

/**
 *
 * @author RAJ
 */
public class PercursoDAO {

    public static List<Percurso> obterPercursos() throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Percurso> percursos = new ArrayList<>();
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM percurso");

            while (rs.next()) {
                Percurso percurso = new Percurso(
                        rs.getInt("id"),
                        rs.getString("imagem"),
                        rs.getString("descricao"),
                        rs.getDouble("quilometragem"));
                percursos.add(percurso);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return percursos;
    }

    public static List<Percurso> obterPercursos(int id) throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Percurso> percursos = new ArrayList<>();
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM percurso WHERE organizador_id = " + id);

            while (rs.next()) {
                Percurso percurso = new Percurso(
                        rs.getInt("id"),
                        rs.getString("imagem"),
                        rs.getString("descricao"),
                        rs.getDouble("quilometragem"));

                percursos.add(percurso);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return percursos;
    }

    public static void gravar(Percurso percurso) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "INSERT INTO percurso (imagem, quilometragem, descricao) VALUES (?,?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setInt(1, percurso.getId());
            comando.setString(2, percurso.getImagem());
            comando.setDouble(3, percurso.getQuilometragem());
            comando.setString(4, percurso.getDescricao());

            comando.execute();
            comando.close();
            conexao.close();
        } catch (SQLException e) {
            throw e;
        }
    }

    public static void alterar(Percurso percurso) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "UPDATE percurso SET imagem = ?,quilometragem = ?, descricao = ? WHERE id = ?";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, percurso.getImagem());
            comando.setDouble(2, percurso.getQuilometragem());
            comando.setString(3, percurso.getDescricao());
            comando.setInt(4, percurso.getId());

            comando.execute();
            comando.close();
            conexao.close();
        } catch (SQLException e) {
            throw e;
        }
    }

    public static void excluir(Percurso percurso) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        String stringSQL;

        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            stringSQL = "DELETE FROM percurso WHERE id = " + percurso.getId();
            comando.execute(stringSQL);
        } catch (Exception e) {
            throw e;
        } finally {
            fecharConexao(conexao, comando);
        }
    }

    public static Percurso obterPercurso(int id) throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        Percurso percurso = null;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM percurso WHERE id = " + id);
            rs.first();
            percurso = new Percurso(
                    rs.getInt("id"),
                    rs.getString("imagem"),
                    rs.getString("descricao"),
                    rs.getDouble("quilometragem"));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return percurso;
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
