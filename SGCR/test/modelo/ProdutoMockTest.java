/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;


import modelo.InterfaceProduto;
import modelo.ValidarProduto;
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
public class ProdutoMockTest {
    
    public ProdutoMockTest() {
    }
    ValidarProduto prod;
    InterfaceProduto requestMock;
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
        prod = new ValidarProduto();
        requestMock = createMock(InterfaceProduto.class);
    }
    
    @After
    public void tearDown() {
    }
    
    @Test
    public void testNomeCaracter() {
        expect(requestMock.getNome()).andReturn("aaa");
        replay(requestMock);
        assertEquals(false,prod.validarNome(requestMock));
    }
    
  
    @Test
    public void testNomeNumero() {
        expect(requestMock.getNome()).andReturn("aaaaaaaaaaaaaaaaaaaaaaaaa");
        replay(requestMock);
        assertEquals(false,prod.validarNome(requestMock));
    }
    
    @Test
    public void testNomeValido() {
        expect(requestMock.getNome()).andReturn("Camisa");
        replay(requestMock);
        assertEquals(true,prod.validarNome(requestMock));
    }
    
}
