package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modelo.Ingresso;

/**
 *
 * @author RAJ
 */
public class IngressoDAO {

    public static List<Ingresso> obterIngressos() throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Ingresso> ingressos = new ArrayList<Ingresso>();

        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM lote");
            while (rs.next()) {
                Ingresso ingresso = new Ingresso(
                        rs.getInt("id"),
                        rs.getString("tipo"),
                        rs.getFloat("preco"),
                        rs.getString("data_inicio"),
                        rs.getString("data_final"),
                        rs.getInt("quantidade"),
                        null);
                ingresso.setCorridasId(rs.getInt("corrida_id"));
                ingressos.add(ingresso);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return ingressos;
    }

    public static void gravar(Ingresso ingresso) throws ClassNotFoundException, SQLException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "INSERT INTO ingresso (id, tipo, preco, data_inicio, data_final, quantidade, "
                    + "corrida_id) VALUES (?,?,?,?,?,?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setInt(1, ingresso.getId());
            comando.setString(2, ingresso.getTipo());
            comando.setDouble(3, ingresso.getPreco());
            comando.setString(4, ingresso.getDataInicio());
            comando.setString(5, ingresso.getDataFinal());
            comando.setInt(6, ingresso.getQuantidade());
            comando.setInt(7, ingresso.getCorrida().getId());

            /*    if(corrida.getOrganizador() == null){
               comando.setInt(14, Types.NULL);
            }else{            
                }
             */
            comando.execute();
            comando.close();
            conexao.close();

        } catch (SQLException e) {
            throw e;
        }
    }

    public static void excluir(Ingresso ingresso) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        String stringSQL;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            stringSQL = "delete from ingressos where id = " + ingresso.getId();
            comando.execute(stringSQL);

        } catch (SQLException e) {
            throw e;
        } finally {
            fecharConexao(conexao, comando);
        }
    }

    public static void alterar(Ingresso ingresso) throws ClassNotFoundException, SQLException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            // id, tipo, preco, data_inicio, data_final, quantidade 
            String sql = "UPDATE ingresso SET tipo = ?, preco = ?, data_inicio = ?, "
                    + "data_final = ?, quantidade = ?, corrida_id = ? WHERE id = ?";            
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, ingresso.getTipo());
            comando.setDouble(2, ingresso.getPreco());
            comando.setString(3, ingresso.getDataInicio());
            comando.setString(4, ingresso.getDataFinal());
            comando.setInt(5, ingresso.getQuantidade());
            comando.setInt(6, ingresso.getCorrida().getId());
            comando.setInt(7, ingresso.getId());

            comando.execute();
            comando.close();
            conexao.close();

        } catch (SQLException e) {
            throw e;
        }
    }

    public static Ingresso obterIngresso(int id) throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        Ingresso ingresso = null;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM ingresso WHERE id = " + id);
            rs.first();
            ingresso = new Ingresso(
                    rs.getInt("id"),
                    rs.getString("tipo"),
                    rs.getDouble("preco"),
                    rs.getString("data_inicio"),
                    rs.getString("data_final"),
                    rs.getInt("quantidade"),
                    null);
            ingresso.setCorridasId(rs.getInt("corrida_id"));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return ingresso;
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
