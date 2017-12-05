/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Corrida;
import modelo.Inscricao;

/**
 *
 * @author ariel
 */
public class ManterRetirarKitController extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String acao = request.getParameter("acao");
        if (acao.equals("prepararRetirarKit")) {
            prepararRetirarKit(request, response);
        } else if (acao.equals("confirmarRetirarKit")) {
            confirmarRetirarKit(request, response);
        } else if (acao.equals("escolherCorrida")) {
            escolherCorrida(request, response);
        }
    }
    
    public void prepararRetirarKit(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException {
        try {
            //LOGICA AQUI!
            int corridaId = Integer.parseInt(request.getParameter("corridaId"));
            request.setAttribute("inscricoes", Inscricao.obterInscricoesPagas(corridaId));
            RequestDispatcher view = request.getRequestDispatcher("/manterRetirarKit.jsp");
            view.forward(request, response);
        } catch (ServletException ex) {
        } catch (ClassNotFoundException ex) {
        } catch (IOException ex) {

        }
    }

    private void confirmarRetirarKit(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        
        Inscricao inscricao = Inscricao.obterInscricao(id);
        
        inscricao.setKitRetirado(true);
        
        try {
            inscricao.retirarKit();
            RequestDispatcher view = request.getRequestDispatcher("PesquisaRetirarKitController");
            view.forward(request, response);
        } catch (IOException ex) {
        } catch (ServletException ex) {
        }
    }

    private void escolherCorrida(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setAttribute("corridas", Corrida.obterCorridas());
            RequestDispatcher view = request.getRequestDispatcher("/escolherCorridaRetirarKit.jsp");
            view.forward(request, response);
        } catch (IOException ex) {
        } catch (ClassNotFoundException ex) {
        } catch (ServletException ex) {
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManterRetirarKitController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ManterRetirarKitController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManterRetirarKitController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ManterRetirarKitController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
