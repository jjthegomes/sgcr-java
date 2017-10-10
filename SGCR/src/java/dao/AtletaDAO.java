package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modelo.Atleta;

/**
 *
 * @author RAJ
 */
public class AtletaDAO {

    public static List<Atleta> obterAtletas() throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Atleta> atletas = new ArrayList<Atleta>();

        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from atletas");
            while (rs.next()) {
                Atleta atleta = new Atleta(rs.getString("apelido"),
                        null,
                        rs.getString("nome"),
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

//                select tamanho from tamanhos_camisas where id = rs.getInt("id")
                atleta.setTamanhoCamisa(rs.getString("tamanhosCamisasId"));
                atletas.add(atleta);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return atletas;
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
