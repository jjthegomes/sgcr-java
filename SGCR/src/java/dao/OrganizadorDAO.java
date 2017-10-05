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
import modelo.Organizador;

/**
 *
 * @author ariel
 */
public class OrganizadorDAO {

    public static List<Organizador> obterOrganizador() throws ClassNotFoundException, SQLException {
        Connection conexao = null;
        Statement comando = null;
        List<Organizador> organizadores = new ArrayList<Organizador>();

        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from organizadores");
            while (rs.next()) {
                Organizador organizador = new Organizador(
                        rs.getString("nomeComepleto"),
                        rs.getString("dataNascimento"),
                        rs.getBoolean("sexo"),
                        rs.getString("cpf"),
                        rs.getString("cep"),
                        rs.getString("rua"),
                        rs.getString("bairro"),
                        rs.getString("complemento"),
                        rs.getString("numero"),
                        rs.getString("cidade"),
                        rs.getString("estado"),
                        rs.getString("telefone"),
                        rs.getString("celular"),
                        rs.getInt("id"),
                        rs.getString("email"),
                        rs.getString("senha"));

                organizadores.add(organizador);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return organizadores;
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
