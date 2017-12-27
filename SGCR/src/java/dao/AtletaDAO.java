package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
        List<Atleta> atletas = new ArrayList<>();

        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * from atleta");
            while (rs.next()) {
                Atleta atleta = new Atleta(rs.getString("apelido"),
                        rs.getString("tamanho_camisa"),
                        rs.getString("nome"),
                        rs.getString("data_nascimento"),
                        rs.getString("sexo"),
                        rs.getString("cpf"),
                        rs.getString("cep"),
                        rs.getString("logradouro"),
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

                atletas.add(atleta);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return atletas;
    }

    public static void gravar(Atleta atleta) throws ClassNotFoundException, SQLException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "INSERT INTO atleta (nome, apelido, email, senha, sexo, tamanho_camisa, data_nascimento, "
                    + "cpf, cep, estado, cidade, bairro, logradouro, numero, complemento, telefone, celular) "
                    + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, atleta.getNome());
            comando.setString(2, atleta.getApelido());
            comando.setString(3, atleta.getEmail());
            comando.setString(4, atleta.getSenha());
            comando.setString(5, atleta.getSexo());
            comando.setString(6, atleta.getTamanhoCamisa());
            comando.setString(7, atleta.getDataNascimento());
            comando.setString(8, atleta.getCpf());
            comando.setString(9, atleta.getCep());
            comando.setString(10, atleta.getEstado());
            comando.setString(11, atleta.getCidade());
            comando.setString(12, atleta.getBairro());
            comando.setString(13, atleta.getLogradouro());
            comando.setString(14, atleta.getNumero());
            comando.setString(15, atleta.getComplemento());
            comando.setString(16, atleta.getTelefone());
            comando.setString(17, atleta.getCelular());
            comando.execute();
            comando.close();
            conexao.close();

        } catch (SQLException e) {
            throw e;
        }
    }

    public static void alterar(Atleta atleta) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = BD.getConexao();
            String sql = "UPDATE atleta SET nome = ?, apelido = ?, email = ?, senha = ?, "
                    + "data_nascimento = ?, cpf = ?, cep = ?, cidade = ?, estado = ? , logradouro = ?, "
                    + "bairro = ? , numero = ?, complemento = ?, telefone = ?, celular = ?, tamanho_camisa = ? "
                    + " WHERE id = ?";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, atleta.getNome());
            comando.setString(2, atleta.getApelido());
            comando.setString(3, atleta.getEmail());
            comando.setString(4, atleta.getSenha());
            comando.setString(5, atleta.getDataNascimento());
            comando.setString(6, atleta.getCpf());
            comando.setString(7, atleta.getCep());
            comando.setString(8, atleta.getCidade());
            comando.setString(9, atleta.getEstado());
            comando.setString(10, atleta.getLogradouro());
            comando.setString(11, atleta.getBairro());
            comando.setString(12, atleta.getNumero());
            comando.setString(13, atleta.getComplemento());
            comando.setString(14, atleta.getTelefone());
            comando.setString(15, atleta.getCelular());
            comando.setString(16, atleta.getTamanhoCamisa());
            comando.setInt(17, atleta.getId());
            comando.execute();
            comando.close();
            conexao.close();
        } catch (SQLException e) {
            throw e;
        }
    }

    public static void excluir(Atleta atleta) throws SQLException, ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        String stringSQL;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            stringSQL = "DELETE FROM atleta WHERE id = " + atleta.getId();
            comando.execute(stringSQL);

        } catch (SQLException e) {
            throw e;
        } finally {
            fecharConexao(conexao, comando);
        }
    }

    public static Atleta obterAtleta(int id) throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        Atleta atleta = null;

        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("SELECT * from atleta WHERE id = " + id);
            rs.first();
            atleta = new Atleta(rs.getString("apelido"),
                    rs.getString("tamanho_camisa"),
                    rs.getString("nome"),
                    rs.getString("data_nascimento"),
                    rs.getString("sexo"),
                    rs.getString("cpf"),
                    rs.getString("cep"),
                    rs.getString("logradouro"),
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

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return atleta;
    }

    public static Atleta logar(String email, String senha) throws ClassNotFoundException {
        Connection conexao = null;
        Atleta atleta = null;
        PreparedStatement comando = null;
        try {
            conexao = BD.getConexao();
            String sql = "SELECT * FROM atleta WHERE email = ? AND senha = ?";
            comando = conexao.prepareStatement(sql);
            comando.setString(1, email);
            comando.setString(2, senha);
            ResultSet rs = comando.executeQuery();
            if (rs.first()) {
                atleta = new Atleta(rs.getString("apelido"),
                        rs.getString("tamanho_camisa"),
                        rs.getString("nome"),
                        rs.getString("data_nascimento"),
                        rs.getString("sexo"),
                        rs.getString("cpf"),
                        rs.getString("cep"),
                        rs.getString("logradouro"),
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
            }

            comando.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return atleta;
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
