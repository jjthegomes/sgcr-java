package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
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

    public static List<Administrador> obterAdministradores() throws ClassNotFoundException {
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

    public static void gravar(Administrador administrador) throws ClassNotFoundException, SQLException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "INSERT INTO administrador (id, email, senha) VALUES (?,?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setInt(1, administrador.getId());
            comando.setString(2, administrador.getEmail());
            comando.setString(3, administrador.getSenha());

            /*
                Chave Estrangeira
            if(curso.getCoordenador() = null)
                comando.setNull(6, Types.Null);
            else
                comando.setInt(6, curso.getCoordenador().getMatricula());            
             */
            comando.execute();
            comando.close();
            conexao.close();

        } catch (SQLException e) {
            throw e;
        }
    }

    public static void alterar(Administrador administrador) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "UPDATE administradores SET email = ? , senha = ? WHERE id = ? )";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, administrador.getEmail());
            comando.setString(2, administrador.getSenha());
            comando.setInt(3, administrador.getId());
        } catch (SQLException e) {
            throw e;
        }
    }

    public static void excluir(Administrador administrador) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        String stringSQL;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            stringSQL = "DELETE FROM administradores where id = " + administrador.getId();
            comando.execute(stringSQL);

        } catch (SQLException e) {
            throw e;
        } finally {
            fecharConexao(conexao, comando);
        }
    }

    public static Administrador obterAdministrador(int id) throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        Administrador administrador = null;

        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * FROM administrador WHERE id = " + id);
            rs.first();
            administrador = new Administrador(
                    rs.getInt("id"),
                    rs.getString("email"),
                    rs.getString("senha")
            );
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return administrador;
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
