/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Corrida;
import modelo.Inscricao;

/**
 *
 * @author rafael
 */
public class ManterResultadoCorridaController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        String acao = request.getParameter("acao");
        if (acao.equals("prepararIncluir")) {
            prepararIncluir(request, response);
        } else if (acao.equals("confirmarIncluir")) {
            confirmarIncluir(request, response);
        } else if (acao.equals("escolherCorrida")) {
            escolherCorrida(request, response);
        }
    }
    
    public void prepararIncluir(HttpServletRequest request, HttpServletResponse response) {
        try {
            int corridaId = Integer.parseInt(request.getParameter("corridaId"));
            request.setAttribute("corrida", Corrida.obterCorrida(corridaId));
            request.setAttribute("inscricoes", Inscricao.obterInscricoes(corridaId));
            RequestDispatcher view = request.getRequestDispatcher("/manterResultadoCorrida.jsp");
            view.forward(request, response);
        } catch (ServletException ex) {
        } catch (ClassNotFoundException ex) {
        } catch (IOException ex) {

        }
    }

    private void confirmarIncluir(HttpServletRequest request, HttpServletResponse response) {
        try {
            int corridaId = Integer.parseInt(request.getParameter("corridaId"));
            List<Inscricao> inscricoes = Inscricao.obterInscricoes(corridaId);
            for (Inscricao inscricao : inscricoes) {
                inscricao.setTempoLargada(request.getParameter("tempoLargada"+inscricao.getId()));
                inscricao.setTempoChegada(request.getParameter("tempoChegada"+inscricao.getId()));
            }
             
            Inscricao.atualizarResultadoCorrida(inscricoes);
            
            RequestDispatcher view = request.getRequestDispatcher("ManterResultadoCorridaController?acao=escolherCorrida");
            view.forward(request, response);
        } catch (IOException ex) {
        } catch (ServletException ex) {
        } catch (ClassNotFoundException ex) {
        } catch (SQLException ex) {
        }
    }
    
    private void escolherCorrida(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setAttribute("corridas", Corrida.obterCorridas());
            RequestDispatcher view = request.getRequestDispatcher("/escolherCorridaResultado.jsp");
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
