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
import modelo.Administrador;
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
            String sql = "INSERT INTO ranking (nome, intervalo_faixa_etaria, idade_inicial, administrador_id) "
                    + "VALUES (?,?,?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, ranking.getNome());
            comando.setInt(2, ranking.getIntervaloFaixaEtaria());
            comando.setInt(3, ranking.getIdadeInicial());
            comando.setInt(4, ranking.getAdministrador().getId());

            comando.execute();
            comando.close();
            conexao.close();

        } catch (SQLException e) {
            throw e;
        }
    }

    public static void alterar(Ranking ranking) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "UPDATE ranking SET nome = ?, intervalo_faixa_etaria = ?, idade_inicial = ?, administrador_id = ? "
                    + "WHERE id = ?";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, ranking.getNome());
            comando.setInt(2, ranking.getIntervaloFaixaEtaria());
            comando.setInt(3, ranking.getIdadeInicial());
            comando.setInt(4, ranking.getAdministrador().getId());
            comando.setInt(5, ranking.getId());
            comando.execute();
            comando.close();
            conexao.close();

        } catch (SQLException e) {
            throw e;
        }
    }

    public static void excluir(Ranking ranking) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        String stringSQL;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            stringSQL = "DELETE FROM ranking WHERE id =" + ranking.getId();
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
            ResultSet rs = comando.executeQuery("select * from ranking where id= " + id);
            rs.first();
            ranking = new Ranking(rs.getInt("id"),
                    rs.getString("nome"),
                    rs.getInt("intervalo_faixa_etaria"),
                    rs.getInt("idade_inicial"),
                    null);
            ranking.setAdministradorId(rs.getInt("administrador_id"));
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
            ResultSet rs = comando.executeQuery("SELECT * FROM ranking ");

            while (rs.next()) {
                Ranking ranking = new Ranking(
                        rs.getInt("id"),
                        rs.getString("nome"),
                        rs.getInt("intervalo_faixa_etaria"),
                        rs.getInt("idade_inicial"),
                        null);
                ranking.setAdministradorId(rs.getInt("administrador_id"));
                ranking.setAdministrador(Administrador.obterAdministrador(rs.getInt("administrador_id")));
                rankings.add(ranking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return rankings;
    }

    public static List<Ranking> obterRankings(int id) throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Ranking> rankings = new ArrayList<Ranking>();
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM ranking where administrador_id = " + id);

            while (rs.next()) {
                Ranking ranking = new Ranking(
                        rs.getInt("id"),
                        rs.getString("nome"),
                        rs.getInt("intervalo_faixa_etaria"),
                        rs.getInt("idade_inicial"),
                        null);
                ranking.setAdministradorId(id);
                ranking.setAdministrador(Administrador.obterAdministrador(id));
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
