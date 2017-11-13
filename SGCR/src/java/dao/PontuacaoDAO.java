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
            String sql= "insert into pontuacoes (id,pontuacao, corridasId)values(?,?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setInt(1,pontuacao.getId());
            comando.setInt(2,pontuacao.getPontuacao());
            comando.setInt(3,pontuacao.getCorrida().getId());
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
            String sql= "update pontuacoes set pontuacao=?, corridasId=? "
              +"where id =?";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setInt(1,pontuacao.getPontuacao());
            comando.setInt(2,pontuacao.getCorrida().getId());
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
          stringSQL = "delete from pontuacoes where id = " + pontuacao.getId()+" and corridasId = " + pontuacao.getCorrida().getId();
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
          ResultSet rs =  comando.executeQuery("select * from pontuacoes where id = " + id);
          rs.first();
            pontuacao = new Pontuacao(rs.getInt("id"),
            rs.getInt("pontuacao"),
            null);
            pontuacao.setCorridasId(rs.getInt("corridasId"));
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
            ResultSet rs = comando.executeQuery("select * from pontuacoes");
            
            while (rs.next()) {
                Pontuacao pontuacao = new Pontuacao(
                        rs.getInt("id"), 
                        rs.getInt("pontuacao"), 
                        null);
                pontuacao.setCorridasId(rs.getInt("corridasId"));
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
