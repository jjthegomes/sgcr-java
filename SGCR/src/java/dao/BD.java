package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author RAJ
 */
public class BD {
    public static Connection getConexao() throws ClassNotFoundException, SQLException {
        Connection conexao = null;
        Class.forName("com.mysql.jdbc.Driver");
        conexao  = DriverManager.getConnection("jdbc:mysql://localhost/SGCR?useUnicode=yes&characterEncoding=ISO-8859-1", "root", "");
        
        return conexao;
    }
}
