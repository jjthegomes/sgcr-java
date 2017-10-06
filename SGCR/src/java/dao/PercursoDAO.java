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
import modelo.Percurso;

/**
 *
 * @author RAJ
 */
public class PercursoDAO {
    public static List<Percurso> obtePercurso() throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Percurso> percursos = new ArrayList<Percurso>();
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from percursos");
            
            while (rs.next()) {                
                Percurso percurso = new Percurso (
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
