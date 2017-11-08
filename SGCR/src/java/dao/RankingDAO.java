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
import modelo.Ranking;

/**
 *
 * @author RAJ
 */
public class RankingDAO {

    public static void gravar(Ranking ranking) throws SQLException,
            ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "insert into rankings (id,nomeRanking, intervaloFaixaEtaria, administradorId)values(?,?,?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setInt(1, ranking.getId());
            comando.setString(2, ranking.getNomeRanking());
            comando.setInt(3, ranking.getIntervaloFaixaEtaria());
            comando.setInt(4, ranking.getAdministrador().getId());
            comando.execute();
            comando.close();
            conexao.close();

        } catch (SQLException e) {
            throw e;
        }
    }

    public static void alterar(Ranking ranking) throws SQLException,
            ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "upgrade rankings set nomeRanking = ?, intervaloFaixaEtaria=?, administradorId=? "
                    + "where id =?";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, ranking.getNomeRanking());
            comando.setInt(2, ranking.getIntervaloFaixaEtaria());
            comando.setInt(3, ranking.getAdministrador().getId());
            comando.setInt(4, ranking.getId());
            comando.execute();
            comando.close();
            conexao.close();

        } catch (SQLException e) {
            throw e;
        }
    }

    public static void excluir(Ranking ranking) throws SQLException,
            ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        String stringSQL;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            stringSQL = "delete from rankings where id =" + ranking.getId();
            comando.execute(stringSQL);
        } catch (SQLException e) {
            throw e;
        } finally {
            fecharConexao(conexao, comando);
        }
    }

    public static Ranking obterRanking(int id) throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        Ranking ranking = null;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from rankings where id = " + id);
            rs.first();
            ranking = new Ranking(rs.getInt("id"),
                    rs.getString("nomeRanking"),
                    rs.getInt("intervaloFaixaEtaria"),
                    null);
            ranking.setAdministradorId(rs.getInt("administradorId"));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return ranking;
    }

    public static List<Ranking> obterRankings() throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Ranking> rankings = new ArrayList<Ranking>();
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from rankings");

            while (rs.next()) {
                Ranking ranking = new Ranking(
                        rs.getInt("id"),
                        rs.getString("nomeRanking"),
                        rs.getInt("intervaloFaixaEtaria"),
                        null);
                ranking.setAdministradorId(rs.getInt("administradorId"));
                rankings.add(ranking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return rankings;
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
