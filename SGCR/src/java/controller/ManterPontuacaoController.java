/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Corrida;
import modelo.Kit;
import modelo.Pontuacao;

/**
 *
 * @author RAJ
 */
public class ManterPontuacaoController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acao= request.getParameter("acao");
        if(acao.equals("prepararIncluir")){
            prepararIncluir(request, response);
        }else{
            if (acao.equals("confirmarIncluir")) {
                confirmarIncluir(request,response);
            }
        }
    }
    
    public void prepararIncluir(HttpServletRequest request, HttpServletResponse response){
        try{
            request.setAttribute("operacao", "Incluir");
            request.setAttribute("corridas", Corrida.obterCorridas());
            RequestDispatcher view = request.getRequestDispatcher("/manterPontuacao.jsp");
            view.forward(request, response);
            
        }catch(ServletException ex){
        }catch(IOException ex){
        }catch (ClassNotFoundException ex){
        }
    }
    
    private void confirmarIncluir(HttpServletRequest request, HttpServletResponse response) {
       int id = Integer.parseInt(request.getParameter("txtIdPontuacao"));
       int valorPontuacao = Integer.parseInt(request.getParameter("txtPontuacao"));
       int corridaId = Integer.parseInt(request.getParameter("optCorrida"));
       try {
           Corrida corrida = null;
           
               corrida = Corrida.obterCorrida(corridaId);
        
           Pontuacao pontuacao = new Pontuacao(id,valorPontuacao,corrida); 
       pontuacao.gravar();
       RequestDispatcher view = request.getRequestDispatcher("PesquisaPontuacaoController");
       view.forward(request,response);  
    }catch (IOException ex){
    }catch(SQLException ex){
    }catch(ClassNotFoundException ex){
    }catch (ServletException ex){
    }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    

}
