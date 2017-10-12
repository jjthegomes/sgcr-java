/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.List;
import dao.AdministradorDAO;

/**
 *
 * @author RAJ
 */
public class Administrador extends Usuario {

    public Administrador(int id, String email, String senha) {
        super(id, email, senha);
    }
    
    
    
    public static List<Administrador> obterAdministradores() throws ClassNotFoundException{
        return AdministradorDAO.obterAdministradores();
    }
        
}
