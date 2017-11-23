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
import modelo.Kit;
import modelo.Produto;
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
            String sql = "INSERT INTO produto_kit (id, descricao, valor, produto_id, kit_id,kit_corrida_id) VALUES (?,?,?,?,?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setInt(1, produtoKit.getId());
            comando.setString(2, produtoKit.getDescricao());
            comando.setDouble(3, produtoKit.getValor());
            comando.setInt(4, produtoKit.getProduto().getId());
            comando.setInt(5, produtoKit.getKit().getId());
            comando.setInt(6, produtoKit.getCorrida().getId());

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
            String sql = "UPDATE produto_kit SET descricao = ?, valor = ?, kit_id = ?, produto_id = ?, kit_corrida_id = ? WHERE id = ?";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, produtoKit.getDescricao());
            comando.setDouble(2, produtoKit.getValor());
            comando.setInt(3, produtoKit.getKit().getId());
            comando.setInt(4, produtoKit.getProduto().getId());
            comando.setInt(5, produtoKit.getCorrida().getId());
            comando.setInt(6, produtoKit.getId());
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
                    null,
                    null,
                    null);
            produtoKit.setProdutoId(rs.getInt("produto_id"));
            produtoKit.setKitId(rs.getInt("kit_id"));
            produtoKit.setCorridaId(rs.getInt("kit_corrida_id"));
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
                        null,
                        null,
                        null);
                produtoKit.setProduto(Produto.obterProduto(rs.getInt("produto_id")));
                produtoKit.setProdutoId(rs.getInt("produto_id"));
                produtoKit.setKitId(rs.getInt("kit_id"));
                produtoKit.setCorridaId(rs.getInt("kit_corrida_id"));
                produtoKit.setKit(Kit.obterKit(rs.getInt("kit_id"), rs.getInt("kit_corrida_id")));
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
