/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Atleta;
import modelo.Corrida;
import modelo.Inscricao;

/**
 *
 * @author RAJ
 */
public class PesquisaInscricaoController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        if (request.getParameter("busca") != null) {
            buscarCorridaAtleta(request, response);
        }

        if (session.getAttribute("administrador") != null && session.getAttribute("usuario") == "administrador") {
            obterInscricoes(request, response);
        } else if (session.getAttribute("atleta") != null && session.getAttribute("usuario") == "atleta") {
            obterInscricoesAtleta(request, response);
        } else if (session.getAttribute("organizador") != null && session.getAttribute("usuario") == "organizador") {
            obterInscricoes(request, response);
        }
    }

    public void obterInscricoes(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setAttribute("inscricoes", Inscricao.obterInscricoes());
            RequestDispatcher view = request.getRequestDispatcher("/pesquisaInscricao.jsp");
            view.forward(request, response);
        } catch (ClassNotFoundException | ServletException | IOException ex) {
        }
    }

    public void obterInscricoesAtleta(HttpServletRequest request, HttpServletResponse response) {
        try {
            HttpSession session = request.getSession(true);
            Atleta atleta = (Atleta) session.getAttribute("atleta");
            request.setAttribute("inscricoes", Inscricao.obterInscricoesAtleta(atleta.getId()));
            RequestDispatcher view = request.getRequestDispatcher("/pesquisaInscricao.jsp");
            view.forward(request, response);
        } catch (ClassNotFoundException | ServletException | IOException ex) {
        }
    }

    public void buscarCorridaAtleta(HttpServletRequest request, HttpServletResponse response) {
        try {
            String nome = request.getParameter("busca");
            String opt = request.getParameter("optBusca");

            if (opt.equals("") || nome.equals("")) {
                request.setAttribute("inscricoes", Inscricao.obterInscricoes());
                RequestDispatcher view = request.getRequestDispatcher("/pesquisaInscricao.jsp");
                view.forward(request, response);
            } else {
                if (opt.equals("corridas")) {
                    List<Inscricao> inscricao = Inscricao.buscaInscrisoesCorridas(nome.toLowerCase());
                    request.setAttribute("inscricoes", inscricao);
                } else {
                    List<Inscricao> inscricao = Inscricao.buscaInscrisoesAtletas(nome);
                    request.setAttribute("inscricoes", inscricao);
                }
            }
            RequestDispatcher view = request.getRequestDispatcher("/pesquisaInscricao.jsp");
            view.forward(request, response);
        } catch (ServletException | IOException | ClassNotFoundException ex) {
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
