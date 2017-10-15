/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
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
