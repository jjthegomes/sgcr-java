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
            ResultSet rs = comando.executeQuery("select * from ingressos");
            while (rs.next()) {
                Ingresso ingresso = new Ingresso(
                        rs.getInt("id"),
                        rs.getString("tipo"),
                        rs.getFloat("preco"),
                        rs.getString("dataInicio"),
                        rs.getString("dataFinal"),
                        rs.getInt("quantidade"),
                        null);
                ingresso.setCorridasId(rs.getInt("corridasId"));
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
            String sql = "INSERT INTO ingressos (id, tipo, preco, dataInicio, dataFinal, quantidade, "
                    + "corridasId) VALUES (?,?,?,?,?,?,?)";
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
            stringSQL = "DELETE FROM ingressos where id = " + ingresso.getId();
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
            // id, tipo, preco, dataInicio, dataFinal, quantidade 
            String sql = "UPDATE ingressos SET tipo = ?, preco = ?, dataInicio = ?, "
                    + "dataFinal = ?, quantidade = ?, corridasId = ? WHERE id = ?";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, ingresso.getTipo());
            comando.setDouble(2, ingresso.getPreco());
            comando.setString(3, ingresso.getDataInicio());
            comando.setString(4, ingresso.getDataFinal());
            comando.setInt(5, ingresso.getQuantidade());
            comando.setInt(6, ingresso.getCorridasId());
            comando.setInt(7, ingresso.getId());

        } catch (SQLException e) {
            throw e;
        }
    }

    public static Ingresso obterIngresso (int id) throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        Ingresso ingresso = null;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM ingressos WHERE id = " + id);
            rs.first();
            ingresso = new Ingresso(
                    rs.getInt("id"),
                    rs.getString("tipo"),
                    rs.getDouble("preco"),
                    rs.getString("dataInicio"),
                    rs.getString("dataFinal"),
                    rs.getInt("quantidade"),
                    null);
            ingresso.setCorridasId(rs.getInt("corridasId"));
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
