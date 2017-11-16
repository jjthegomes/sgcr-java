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
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import modelo.Organizador;

/**
 *
 * @author RAJ
 */
public class OrganizadorDAO {

    public static List<Organizador> obterOrganizadores() throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Organizador> organizadores = new ArrayList<>();

        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM organizador");
            while (rs.next()) {
                Organizador organizador = new Organizador(
                        rs.getString("nome"),
                        rs.getString("data_nascimento"),
                        rs.getString("sexo"),
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

    public static void gravar(Organizador organizador) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "INSERT INTO organizador (id,nome,email,senha,sexo,data_nascimento,"
                    + "cpf,cep,cidade,estado,rua,bairro,numero,complemento, telefone,celular) "
                    + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setInt(1, organizador.getId());
            comando.setString(2, organizador.getNome());
            comando.setString(3, organizador.getEmail());
            comando.setString(4, organizador.getSenha());
            comando.setString(5, organizador.getSexo());
            comando.setString(6, organizador.getDataNascimento());
            comando.setString(7, organizador.getCpf());
            comando.setString(8, organizador.getCep());
            comando.setString(9, organizador.getCidade());
            comando.setString(10, organizador.getEstado());
            comando.setString(11, organizador.getLogradouro());
            comando.setString(12, organizador.getBairro());
            comando.setString(13, organizador.getNumero());
            if (organizador.getComplemento() == null) {
                comando.setNull(14, Types.NULL);
            } else {
                comando.setString(14, organizador.getComplemento());
            }
            comando.setString(15, organizador.getTelefone());
            comando.setString(16, organizador.getCelular());

            comando.execute();
            comando.close();
            conexao.close();
        } catch (SQLException e) {
            throw e;
        }
    }

    public static void alterar(Organizador organizador) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "UPDATE organizador SET nome = ?,email = ?, senha = ?, sexo = ?, data_nascimento = ?, cpf = ?, "
                    + "cep = ?, cidade = ?, estado = ?, rua = ?, bairro = ?, numero = ?, complemento = ?, telefone = ?, "
                    + "celular = ? WHERE id = ?";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, organizador.getNome());
            comando.setString(2, organizador.getEmail());
            comando.setString(3, organizador.getSenha());
            comando.setString(4, organizador.getSexo());
            comando.setString(5, organizador.getDataNascimento());
            comando.setString(6, organizador.getCpf());
            comando.setString(7, organizador.getCep());
            comando.setString(8, organizador.getCidade());
            comando.setString(9, organizador.getEstado());
            comando.setString(10, organizador.getLogradouro());
            comando.setString(11, organizador.getBairro());
            comando.setString(12, organizador.getNumero());
            if (organizador.getComplemento() == null) {
                comando.setNull(13, Types.NULL);
            } else {
                comando.setString(13, organizador.getComplemento());
            }
            comando.setString(14, organizador.getTelefone());
            comando.setString(15, organizador.getCelular());
            comando.setInt(16, organizador.getId());
            comando.execute();
            comando.close();
            conexao.close();
        } catch (SQLException e) {
            throw e;
        }
    }

    public static void excluir(Organizador organizador) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        String stringSQL;

        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            stringSQL = "DELETE FROM organizador WHERE id = " + organizador.getId();
            comando.execute(stringSQL);
        } catch (Exception e) {
            throw e;
        } finally {
            fecharConexao(conexao, comando);
        }
    }

    public static Organizador obterOrganizador(int id) throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        Organizador organizador = null;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM organizador WHERE id = " + id);
            rs.first();
            organizador = new Organizador(
                    rs.getString("nome"),
                    rs.getString("data_nascimento"),
                    rs.getString("sexo"),
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
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return organizador;
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
