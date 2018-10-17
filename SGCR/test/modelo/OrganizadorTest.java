/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author ariel
 */
public class OrganizadorTest {
    
    public OrganizadorTest() {
    }
    Organizador org; 
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
       org = new Organizador();
    }
    
    @After
    public void tearDown() {
    }



    /**
     * Test of validarCadastro method, of class Organizador.
     */
    @Test
    public void testSenhaMenor() {
        org.setSenha("aaaaaaa");
        assertEquals(false,org.validarCadastro());
    }
    @Test
    public void testSenhaMaiuscula() {
        org.setSenha("aaaaaaaa");
        assertEquals(false,org.validarCadastro());
    }
    @Test
    public void testSenhaMinuscula() {
        org.setSenha("ABCAEIII");
        assertEquals(false,org.validarCadastro());
    }
    @Test
    public void testSenhaNumero() {
        org.setSenha("ABCAEIII");
        assertEquals(false,org.validarCadastro());
    }
    @Test
    public void testSenhaCaracteres() {
        org.setSenha("Aa2cDIII");
        assertEquals(false,org.validarCadastro());
    }
    @Test
    public void testEmailSemArroba() {
        org.setSenha("Aa2+DIII");
        org.setEmail("ian.com");
        assertEquals(false,org.validarCadastro());
    }
    @Test
    public void testEmailSemPonto() {
        org.setSenha("Aa2+DIII");
        org.setEmail("ian@com");
        assertEquals(false,org.validarCadastro());
    }
    @Test
    public void testEmailMaiuscula() {
        org.setSenha("Aa2+DIII");
        org.setEmail("Ian@.com");
        assertEquals(false,org.validarCadastro());
    }
    @Test
    public void testEmailMenorQueNove() {
        org.setSenha("Aa2+DIII");
        org.setEmail("ian@.com");
        assertEquals(false,org.validarCadastro());
    }
    @Test
    public void testSenhaEmailValido() {
        org.setSenha("Aa2+DIII");
        org.setEmail("ianp@.com");
        assertEquals(true,org.validarCadastro());
    }
    
}
