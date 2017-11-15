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
            ResultSet rs = comando.executeQuery("SELECT * FROM administrador");
            while (rs.next()) {
                Administrador administrador = new Administrador(
                        rs.getInt("id"),
                        rs.getString("nome"),
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
            String sql = "INSERT INTO administrador (id, nome, email, senha) VALUES (?,?,?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setInt(1, administrador.getId());
            comando.setString(2, administrador.getNome());
            comando.setString(3, administrador.getEmail());
            comando.setString(4, administrador.getSenha());
     
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
            String sql = "UPDATE administrador SET nome = ?, email = ?, senha = ? WHERE id = ?";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, administrador.getNome());
            comando.setString(2, administrador.getEmail());
            comando.setString(3, administrador.getSenha());
            comando.setInt(4, administrador.getId());
            comando.execute();
            comando.close();
            conexao.close();
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
            stringSQL = "DELETE FROM administrador WHERE id = " + administrador.getId();
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
                    rs.getString("nome"),
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
