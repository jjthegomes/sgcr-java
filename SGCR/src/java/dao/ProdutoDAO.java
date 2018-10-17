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
import modelo.CartaoCredito;
import modelo.Produto;

/**
 *
 * @author RAJ
 */
public class ProdutoDAO {

    public static void gravar(Produto produto) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "insert into produto (nome, administrador_id) values(?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, produto.getNome());
            comando.setInt(2, produto.getAdministrador().getId());
            comando.execute();
            comando.close();
            conexao.close();

        } catch (SQLException e) {
            throw e;
        }
    }

    public static void alterar(Produto produto) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "UPDATE produto SET nome = ?, administrador_id = ? WHERE id = ?";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, produto.getNome());
            comando.setInt(2, produto.getAdministrador().getId());
            comando.setInt(3, produto.getId());
            comando.execute();
            comando.close();
            conexao.close();

        } catch (SQLException e) {
            throw e;
        }
    }

    public static void excluir(Produto produto) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        String stringSQL;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            stringSQL = "DELETE FROM produto WHERE id = " + produto.getId();
            comando.execute(stringSQL);
        } catch (SQLException e) {
            throw e;
        } finally {
            fecharConexao(conexao, comando);
        }
    }

    public static Produto obterProduto(int id) throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        Produto produto = null;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM produto WHERE id = " + id);
            rs.first();
            produto = new Produto(rs.getInt("id"),
                    rs.getString("nome"),
                    null);
            produto.setAdministradorId(rs.getInt("administrador_id"));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return produto;
    }

    public static List<Produto> obterProdutos() throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Produto> produtos = new ArrayList<Produto>();
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM produto");

            while (rs.next()) {
                Produto produto = new Produto(
                        rs.getInt("id"),
                        rs.getString("nome"),
                        null);
                produto.setAdministradorId(rs.getInt("administrador_id"));
                produto.setAdministrador(Administrador.obterAdministrador(rs.getInt("administrador_id")));
                produtos.add(produto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return produtos;
    }
    
     public static List<Produto> obterProdutos(int id) throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Produto> produtos = new ArrayList<Produto>();
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM produto where administrador_id = " + id);

            while (rs.next()) {
                Produto produto = new Produto(
                        rs.getInt("id"),
                        rs.getString("nome"),
                        null);
                produto.setAdministradorId(id);
                produto.setAdministrador(Administrador.obterAdministrador(id));
                produtos.add(produto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return produtos;
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
