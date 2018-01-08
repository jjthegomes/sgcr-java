/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Administrador;
import modelo.Corrida;
import modelo.Inscricao;
import modelo.Percurso;
import modelo.Ranking;

/**
 *
 * @author RAJ
 */
public class PesquisaRankingController extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException {
        String acao = request.getParameter("acao");
        String id = request.getParameter("corridaId");
        String percursoId = request.getParameter("percursoId");

        if (id != null && percursoId != null) {
            visualizarClassificacaoPercurso(request, response);
        } else if (id != null && acao.equals("visualizarClassificacao")) {
            visualizarClassificacaoCorrida(request, response);
        } else if (acao.equals("visualizarClassificacao")) {
            visualizarClassificacao(request, response);
        } else if (acao.equals("visualizarRanking")) {
            visualizarRanking(request, response);
        } else if (acao.equals("listaRanking")) {
            listarRanking(request, response);
        }

    }

    public void visualizarRanking(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession(true);
            Administrador administrador = (Administrador) session.getAttribute("administrador");

            request.setAttribute("rankings", Ranking.obterRanking());
            RequestDispatcher view = request.getRequestDispatcher("/escolherRankingClassicacao.jsp");
            view.forward(request, response);
        } catch (ClassNotFoundException ex) {
        }
    }

    public void listarRanking(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession(true);
            Administrador administrador = (Administrador) session.getAttribute("administrador");

            request.setAttribute("rankings", Ranking.obterRankings(administrador.getId()));
            RequestDispatcher view = request.getRequestDispatcher("/escolherRankingClassicacao.jsp");
            view.forward(request, response);
        } catch (ClassNotFoundException ex) {
        }
    }

    public void visualizarClassificacao(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException {
        try {

            request.setAttribute("corridas", Corrida.obterCorridas());
            RequestDispatcher view = request.getRequestDispatcher("/escolherCorridaClassificacao.jsp");
            view.forward(request, response);
        } catch (ServletException | IOException ex) {
        }
    }

    public void visualizarClassificacaoCorrida(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException {
        try {

            int id = Integer.parseInt(request.getParameter("corridaId"));
            request.setAttribute("corrida", Corrida.obterCorrida(id));
            

            request.setAttribute("percursos", Percurso.obterPercursosCorrida(id));
            RequestDispatcher view = request.getRequestDispatcher("/pesquisaCorridaClassificacao.jsp");
            view.forward(request, response);
        } catch (ServletException | IOException ex) {
        }
    }

    public void visualizarClassificacaoPercurso(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException {
        try {

            int id = Integer.parseInt(request.getParameter("corridaId"));
            request.setAttribute("corrida", Corrida.obterCorrida(id));
            int percursoId = Integer.parseInt(request.getParameter("percursoId"));
            request.setAttribute("inscricoes", Inscricao.obterInscricoesCorrida(id, percursoId));

            request.setAttribute("percursos", Percurso.obterPercursosCorrida(id));
            RequestDispatcher view = request.getRequestDispatcher("/pesquisaCorridaClassificacao.jsp");
            view.forward(request, response);
        } catch (ServletException | IOException ex) {
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
            Logger.getLogger(PesquisaRankingController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(PesquisaRankingController.class.getName()).log(Level.SEVERE, null, ex);
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
