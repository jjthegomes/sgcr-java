/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;


import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.easymock.EasyMock.*;
import static org.junit.Assert.assertEquals;

/**
 *
 * @author ariel
 */
public class ProdutoMock {
    
    public ProdutoMock() {
    }
    ValidarProduto prod;
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
        prod = new ValidarProduto();
    }
    
    @After
    public void tearDown() {
    }
    
    @Test
    public void testNomeCaracter() {
        InterfaceProduto requestMock = createMock(InterfaceProduto.class);
        expect(requestMock.getNome()).andReturn("aaa");
        replay(requestMock);
        assertEquals(false,prod.validarNome(requestMock));
    }
    
  
    @Test
    public void testNomeNumero() {
        InterfaceProduto requestMock = createMock(InterfaceProduto.class);
        expect(requestMock.getNome()).andReturn("aaaaaaaaaaaaaaaaaaaaaaaaa");
        replay(requestMock);
        assertEquals(false,prod.validarNome(requestMock));
    }
    
    @Test
    public void testNomeValido() {
        InterfaceProduto requestMock = createMock(InterfaceProduto.class);
        expect(requestMock.getNome()).andReturn("Camisa");
        replay(requestMock);
        assertEquals(true,prod.validarNome(requestMock));
    }
    
}
