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
import modelo.Boleto;
import modelo.Inscricao;

/**
 *
 * @author RAJ
 */
public class BoletoDAO {

    public static List<Boleto> obterBoletos() throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Boleto> Boletos = new ArrayList<Boleto>();

        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from boleto");
            while (rs.next()) {
                Boleto boleto = new Boleto(
                        rs.getInt("id"),
                        rs.getString("codigo_barra"),
                        rs.getString("data_emissao"),
                        rs.getString("data_vencimento"),
                        rs.getString("nome_titular"),
                        rs.getString("cpf_titular"),
                        null);
                boleto.setInscricaoId(rs.getInt("inscricao_id"));
                boleto.setInscricao(Inscricao.obterInscricao(boleto.getInscricaoId()));
                Boletos.add(boleto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return Boletos;
    }

    public static void gravar(Boleto boleto) throws ClassNotFoundException, SQLException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "INSERT INTO boleto (codigo_barra, data_emissao, data_vencimento, nome_titular, cpf_titular, inscricao_id) VALUES (?,?,?,?,?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, boleto.getCodigoBarra());
            comando.setString(2, boleto.getDataEmissao());
            comando.setString(3, boleto.getDataVencimento());
            comando.setString(4, boleto.getNomeTitular());
            comando.setString(5, boleto.getCpfTitular());
            comando.setInt(6, boleto.getInscricao().getId());

            comando.execute();
            comando.close();
            conexao.close();

        } catch (SQLException e) {
            throw e;
        }
    }

    public static void alterar(Boleto boleto) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "UPDATE boleto SET codigo_barra = ?, data_emissao = ?, data_vencimento = ?, nome_titular = ?, cpf_titular = ?, inscricao_id = ? WHERE id = ?";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, boleto.getCodigoBarra());
            comando.setString(2, boleto.getDataEmissao());
            comando.setString(3, boleto.getDataVencimento());
            comando.setString(4, boleto.getNomeTitular());
            comando.setString(5, boleto.getCpfTitular());
            comando.setInt(6, boleto.getInscricao().getId());
            comando.setInt(7, boleto.getId());
            comando.execute();
            comando.close();
            conexao.close();
        } catch (SQLException e) {
            throw e;
        }
    }

    public static void excluir(Boleto boleto) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        String stringSQL;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            stringSQL = "DELETE FROM boleto WHERE id = " + boleto.getId();
            comando.execute(stringSQL);

        } catch (SQLException e) {
            throw e;
        } finally {
            fecharConexao(conexao, comando);
        }
    }

    public static Boleto obterBoleto(int id) throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        Boleto boleto = null;

        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM boleto WHERE id = " + id);
            rs.first();
            boleto = new Boleto(
                    rs.getInt("id"),
                    rs.getString("codigo_barra"),
                    rs.getString("data_emissao"),
                    rs.getString("data_vencimento"),
                    rs.getString("nome_titular"),
                    rs.getString("cpf_titular"),
                    null);
            boleto.setInscricaoId(rs.getInt("inscricao_id"));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return boleto;
    }

    public static void fecharConexao(Connection conexao, Statement comando) {
        try {
            if (comando != null) {
                comando.close();
            }

            if (comando != null) {
                conexao.close();
            }

        } catch (SQLException e) {

        }
    }
}
