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
import modelo.Organizador;

/**
 *
 * @author rafael
 */
public class PesquisaRelatorioController extends HttpServlet {

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
        if (acao.equals("relatorioAdministrador")) {
            relatorioAdministrador(request, response);
        } else if (acao.equals("relatorioOrganizador")) {
            relatorioOrganizador(request, response);
        } else if (acao.equals("relatorioAtleta")) {
            relatorioAtleta(request, response);
        } else if (acao.equals("prepararRelatorioCorridasPorOrganizador")) {
            prepararRelatorioCorridasPorOrganizador(request, response);
        } else if(acao.equals("prepararRelatorioAtletasPorCorrida")) {
            prepararRelatorioAtletasPorCorrida(request, response);
        }else if(acao.equals("prepararRelatorioAtletasInadimplentes")) {
            prepararRelatorioAtletasInadimplentes(request, response);
        }else if(acao.equals("prepararRelatorioBoleto")) {
            prepararRelatorioBoleto(request, response);
        }else if(acao.equals("prepararRelatorioCartao")) {
            prepararRelatorioCartao(request, response);
        }else if(acao.equals("prepararRelatorioTodosPagamentos")) {
            prepararRelatorioTodosPagamentos(request, response);
        }else if(acao.equals("prepararRelatorioCorridasParticipadas")) {
            prepararRelatorioCorridasParticipadas(request, response);
        }else if(acao.equals("prepararRelatorioTodosPagamentosAtleta")) {
            prepararRelatorioTodosPagamentosAtleta(request, response);
        }
    }
    
    public void relatorioAdministrador(HttpServletRequest request, HttpServletResponse response) {
        try {
            RequestDispatcher view = request.getRequestDispatcher("/pesquisaRelatorioAdministrador.jsp");
            view.forward(request, response);
        } catch (ServletException ex) {
        } catch (IOException ex) {
        }
    }

    public void prepararRelatorioCorridasPorOrganizador(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession(true);
            Administrador administrador = (Administrador) session.getAttribute("administrador");

            request.setAttribute("organizadores", Organizador.obterOrganizadores());
            RequestDispatcher view = request.getRequestDispatcher("/manterRelatorioAdministrador.jsp");
            view.forward(request, response);
        } catch (ClassNotFoundException ex) {
        }
    }
    
    public void prepararRelatorioAtletasPorCorrida(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession(true);
            Administrador administrador = (Administrador) session.getAttribute("administrador");

            request.setAttribute("corridas", Corrida.obterCorridas());
            RequestDispatcher view = request.getRequestDispatcher("/manterRelatorioOrganizador.jsp");
            view.forward(request, response);
        } catch (ClassNotFoundException ex) {
        }
    }
    
      public void relatorioOrganizador(HttpServletRequest request, HttpServletResponse response) {
        try {
            RequestDispatcher view = request.getRequestDispatcher("/pesquisaRelatorioOrganizador.jsp");
            view.forward(request, response);
        } catch (ServletException ex) {
        } catch (IOException ex) {
        }
    }
      
        public void relatorioAtleta(HttpServletRequest request, HttpServletResponse response) {
        try {
            RequestDispatcher view = request.getRequestDispatcher("/pesquisaRelatorioAtleta.jsp");
            view.forward(request, response);
        } catch (ServletException ex) {
        } catch (IOException ex) {
        }
    }
        
        
   //início   
 public void prepararRelatorioAtletasInadimplentes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession(true);
            Administrador administrador = (Administrador) session.getAttribute("administrador");

            request.setAttribute("corridas", Corrida.obterCorridas());
            RequestDispatcher view = request.getRequestDispatcher("/manterRelatorioOrganizador.jsp");
            view.forward(request, response);
        } catch (ClassNotFoundException ex) {
        }
    }

public void prepararRelatorioBoleto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession(true);
            Administrador administrador = (Administrador) session.getAttribute("administrador");

            request.setAttribute("corridas", Corrida.obterCorridas());
            RequestDispatcher view = request.getRequestDispatcher("/manterRelatorioOrganizador.jsp");
            view.forward(request, response);
        } catch (ClassNotFoundException ex) {
        }
    }
public void prepararRelatorioCartao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession(true);
            Administrador administrador = (Administrador) session.getAttribute("administrador");

            request.setAttribute("corridas", Corrida.obterCorridas());
            RequestDispatcher view = request.getRequestDispatcher("/manterRelatorioOrganizador.jsp");
            view.forward(request, response);
        } catch (ClassNotFoundException ex) {
        }
    }
public void prepararRelatorioTodosPagamentos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession(true);
            Administrador administrador = (Administrador) session.getAttribute("administrador");

            request.setAttribute("corridas", Corrida.obterCorridas());
            RequestDispatcher view = request.getRequestDispatcher("/manterRelatorioOrganizador.jsp");
            view.forward(request, response);
        } catch (ClassNotFoundException ex) {
        }
    }

public void prepararRelatorioCorridasParticipadas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //HttpSession session = request.getSession(true);
        //Administrador administrador = (Administrador) session.getAttribute("administrador");
        
        //request.setAttribute("corridas", Corrida.obterCorridas());
        RequestDispatcher view = request.getRequestDispatcher("/manterRelatorioAtleta.jsp");
        view.forward(request, response);
    }
public void prepararRelatorioTodosPagamentosAtleta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //HttpSession session = request.getSession(true);
        //Administrador administrador = (Administrador) session.getAttribute("administrador");
        
        //request.setAttribute("corridas", Corrida.obterCorridas());
        RequestDispatcher view = request.getRequestDispatcher("/manterRelatorioAtleta.jsp");
        view.forward(request, response);
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
            Logger.getLogger(PesquisaRelatorioController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(PesquisaRelatorioController.class.getName()).log(Level.SEVERE, null, ex);
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
