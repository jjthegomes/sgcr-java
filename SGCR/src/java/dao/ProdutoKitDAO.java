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
import modelo.ProdutoKit;

/**
 *
 * @author RAJ
 */
public class ProdutoKitDAO {

    public static void gravar(ProdutoKit produtoKit) throws SQLException,
            ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "INSERT INTO produto_kit (id, kit_id, descricao, valor, produto_id) VALUES (?,?,?,?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setInt(1, produtoKit.getId());
            comando.setInt(2, produtoKit.getKit().getId());
            comando.setString(3, produtoKit.getDescricao());
            comando.setDouble(4, produtoKit.getValor());
            comando.setInt(5, produtoKit.getProduto().getId());

            comando.execute();
            comando.close();
            conexao.close();

        } catch (SQLException e) {
            throw e;
        }
    }

    public static void alterar(ProdutoKit produtoKit) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "UPDATE produto_kit SET descricao = ?, valor = ?, kitsId = ? WHERE id =?";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, produtoKit.getDescricao());
            comando.setDouble(2, produtoKit.getValor());
            comando.setInt(3, produtoKit.getKit().getId());
            comando.setInt(4, produtoKit.getId());
            comando.execute();
            comando.close();
            conexao.close();

        } catch (SQLException e) {
            throw e;
        }
    }

    public static void excluir(ProdutoKit produtoKit) throws SQLException,
            ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        String stringSQL;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            stringSQL = "DELETE FROM produto_kit WHERE id =" + produtoKit.getId();
            comando.execute(stringSQL);
        } catch (SQLException e) {
            throw e;
        } finally {
            fecharConexao(conexao, comando);
        }
    }

    public static ProdutoKit obterProdutoKit(int id) throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        ProdutoKit produtoKit = null;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM produto_kit WHERE id = " + id);
            rs.first();
            produtoKit = new ProdutoKit(rs.getInt("id"),
                    rs.getString("descricao"),
                    rs.getDouble("valor"),
                    null);
            produtoKit.setKitId(rs.getInt("kitsId"));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return produtoKit;
    }

    public static List<ProdutoKit> obterProdutos_Kit() throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<ProdutoKit> produtosKit = new ArrayList<ProdutoKit>();
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM produto_kit");

            while (rs.next()) {
                ProdutoKit produtoKit = new ProdutoKit(
                        rs.getInt("id"),
                        rs.getString("descricao"),
                        rs.getDouble("valor"),
                        null);
                produtoKit.setKitId(rs.getInt("kitsId"));
                produtosKit.add(produtoKit);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return produtosKit;
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
