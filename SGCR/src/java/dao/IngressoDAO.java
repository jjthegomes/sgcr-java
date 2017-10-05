package dao;

import java.sql.Connection;
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

    public static List<Ingresso> obterIngresso() throws ClassNotFoundException {
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
                        0);
                ingresso.setCorridaId(rs.getInt("corridasId"));
                ingressos.add(ingresso);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return ingressos;
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
