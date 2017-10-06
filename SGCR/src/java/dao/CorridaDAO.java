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
import modelo.Corrida;

/**
 *
 * @author RAJ
 */
public class CorridaDAO {
    public static List<Corrida> obterCorrida() throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Corrida> corridas = new ArrayList<Corrida>();
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from corridas");
            
            while (rs.next()) {
                Corrida corrida = new Corrida(
                        rs.getInt("id"),
                        rs.getString("nomeCorrida"),
                        rs.getInt("maxPessoa"),
                        rs.getString("horarioInicio"),
                        rs.getString("horarioFinal"),
                        rs.getString("banner"),
                        rs.getString("rua"),
                        rs.getString("cep"),
                        rs.getString("cidade"),
                        rs.getString("estado"),
                        rs.getString("bairro"),
                        rs.getString("descricao"),
                        rs.getString("regulamento"),
                        null);
                corrida.setOrganizadoresId(rs.getInt("organizadoresId"));
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
