package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modelo.Administrador;

/**
 *
 * @author RAJ
 */
public class AdministradorDAO {

    public static List<Administrador> obterAdministrador() throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Administrador> administradores = new ArrayList<Administrador>();

        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from administrador");
            while (rs.next()) {
                Administrador administrador = new Administrador(
                        rs.getInt("id"),
                        rs.getString("email"),
                        rs.getString("senha"));
                administradores.add(administrador);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return administradores;
    }

    public static void fecharConexao(Connection conexao, Statement comando) {
        try {
            if (comando != null) {
                comando.close();
            }

            if (comando != null) {
                conexao.close();
            }

        } catch (SQLException e){
            
        }
    }

}
