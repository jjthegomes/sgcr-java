package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modelo.Inscricao;

/**
 *
 * @author RAJ
 */
public class InscricaoDAO {

    public static List<Inscricao> obterInscricoes() throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Inscricao> inscricoes = new ArrayList<>();

        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from inscricoes");
            while (rs.next()) {

                Inscricao inscricao = new Inscricao(
                        rs.getInt("id"),
                        rs.getString("dataCompra"),
                        rs.getString("numeroPeito"),
                        rs.getBoolean("pago"),
                        rs.getBoolean("formaPagamento"),
                        rs.getString("tempoPercorrido"),
                        null,
                        null,
                        null);

                inscricao.setAtletasId(rs.getInt("atletasId"));
                inscricao.setCorridasId(rs.getInt("corridasId"));
                inscricao.setKitsId(rs.getInt("kitsId"));
                inscricoes.add(inscricao);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return inscricoes;
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
