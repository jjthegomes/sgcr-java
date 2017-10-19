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
            ResultSet rs = comando.executeQuery("select * from percursos");

            while (rs.next()) {
                Percurso percurso = new Percurso(
                        rs.getInt("id"),
                        rs.getString("imagemPercurso"),
                        rs.getDouble("quilometragem"),
                        null);
                percurso.setCorridasId(rs.getInt("corridasId"));
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
            String sql = "insert into percursos (id,imagemPercurso,quilometragem,corridasId) values (?,?,?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setInt(1, percurso.getId());
            comando.setString(2, percurso.getImagemPercurso());
            comando.setDouble(3, percurso.getQuilometragem());
            comando.setInt(4, percurso.getCorrida().getId());

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
            String sql = "update percursos set imagemPercurso = ?,quilometragem = ?, corridasId = ? where id = ?";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, percurso.getImagemPercurso());
            comando.setDouble(2, percurso.getQuilometragem());
            comando.setInt(3, percurso.getCorrida().getId());
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
            stringSQL = "delete from percursos where id = " + percurso.getId();
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
            ResultSet rs = comando.executeQuery("select * from percursos where id = " + id);
            rs.first();
            percurso = new Percurso(
                    rs.getInt("id"), 
                    rs.getString("imagemPercurso"), 
                    rs.getDouble("quilometragem"),
                    null);
            percurso.setCorridasId(rs.getInt("corridasId"));
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
