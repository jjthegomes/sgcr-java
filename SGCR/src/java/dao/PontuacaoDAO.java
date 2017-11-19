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
import modelo.Pontuacao;
import modelo.Ranking;

/**
 *
 * @author RAJ
 */
public class PontuacaoDAO {
    
    public static void gravar (Pontuacao pontuacao)throws SQLException,
            ClassNotFoundException{
        Connection conexao = null;
        try{
            conexao = BD.getConexao();
            String sql= "INSERT INTO pontuacao (id, pontuacao, ranking_id) VALUES (?,?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setInt(1,pontuacao.getId());
            comando.setInt(2,pontuacao.getPontuacao());
            comando.setInt(3,pontuacao.getRanking().getId());
            comando.execute();
            comando.close();
            conexao.close();
            
        }catch(SQLException e){
            throw e;
        }
    }
    
    public static void alterar (Pontuacao pontuacao)throws SQLException,
            ClassNotFoundException{
        Connection conexao = null;
        try{
            conexao = BD.getConexao();
            String sql= "UPDATE pontuacao SET pontuacao = ?, ranking_id = ? WHERE id = ?";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setInt(1,pontuacao.getPontuacao());
            comando.setInt(2,pontuacao.getRanking().getId());
            comando.setInt(3,pontuacao.getId());
            comando.execute();
            comando.close();
            conexao.close();
            
        }catch(SQLException e){
            throw e;
        }
    }
    
    public static void excluir (Pontuacao pontuacao)throws SQLException,
            ClassNotFoundException{
        Connection conexao = null;
        Statement comando = null;
        String stringSQL;
        try{
          conexao =BD.getConexao();
          comando= conexao.createStatement();
          stringSQL = "DELETE FROM pontuacao WHERE id = " + pontuacao.getId()+" and "
                  + "ranking_id = " + pontuacao.getRanking().getId();
                  comando.execute(stringSQL);
        }catch(SQLException e){
            throw e;
        }finally{
            fecharConexao(conexao,comando);
        }
    }
    
    public static Pontuacao obterPontuacao (int id)throws ClassNotFoundException{
        Connection conexao = null;
        Statement comando = null;
        Pontuacao pontuacao = null;
        try{
          conexao = BD.getConexao();
          comando= conexao.createStatement();
          ResultSet rs =  comando.executeQuery("SELECT * FROM pontuacao WHERE id = " + id);
          rs.first();
            pontuacao = new Pontuacao(rs.getInt("id"),
            rs.getInt("pontuacao"),
            null);
            pontuacao.setRankingId(rs.getInt("ranking_id"));
        }catch(SQLException e){
             e.printStackTrace();
        }finally{
            fecharConexao(conexao,comando);
        }
        return pontuacao;
    }
    
    public static List<Pontuacao> obterPontuacoes() throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Pontuacao> pontuacoes = new ArrayList<Pontuacao>();
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM pontuacao");
            
            while (rs.next()) {
                Pontuacao pontuacao = new Pontuacao(
                        rs.getInt("id"), 
                        rs.getInt("pontuacao"), 
                        null);
                pontuacao.setRanking(Ranking.obterRanking(rs.getInt("ranking_id")));
                pontuacao.setRankingId(rs.getInt("ranking_id"));
                pontuacoes.add(pontuacao);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return pontuacoes;
    }
    
    public static void fecharConexao(Connection conexao, Statement comando) {
        try {
            if(comando != null) {
                comando.close();
            }
            if(conexao != null) {
                conexao.close();
            }
        } catch (SQLException e) {
            
        }
    }
}
