/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.List;
import dao.AdministradorDAO;
import java.sql.SQLException;

/**
 *
 * @author RAJ
 */
public class Administrador extends Usuario {

    public Administrador(int id, String nome, String email, String senha) {
        super(id, nome, email, senha);
    }

    public static List<Administrador> obterAdministradores() throws ClassNotFoundException {
        return AdministradorDAO.obterAdministradores();
    }

    public void gravar() throws ClassNotFoundException, SQLException {
        AdministradorDAO.gravar(this);
    }

    public void alterar() throws ClassNotFoundException, SQLException {
        AdministradorDAO.alterar(this);
    }

    public void excluir() throws ClassNotFoundException, SQLException {
        AdministradorDAO.excluir(this);
    }
    
     public static Administrador obterAdministrador(int id) throws ClassNotFoundException {
        return AdministradorDAO.obterAdministrador(id);
    }
}
