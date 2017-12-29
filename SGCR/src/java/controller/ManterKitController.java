/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Kit;
import modelo.Organizador;

/**
 *
 * @author rafael
 */
public class ManterKitController extends HttpServlet {

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
        } else {
            if (acao.equals("confirmarIncluir")) {
                confirmarIncluir(request, response);
            } else {
                if (acao.equals("prepararExcluir")) {
                    prepararExcluir(request, response);
                } else {
                    if (acao.equals("confirmarExcluir")) {
                        confirmarExcluir(request, response);
                    } else {
                        if (acao.equals("prepararEditar")) {
                            prepararEditar(request, response);
                        } else {
                            if (acao.equals("confirmarEditar")) {
                                confirmarEditar(request, response);
                            }
                        }
                    }
                }
            }
        }
    }

    public void prepararIncluir(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setAttribute("operacao", "Incluir");
            RequestDispatcher view = request.getRequestDispatcher("/manterKit.jsp");
            view.forward(request, response);
        } catch (ServletException ex) {

        } catch (IOException ex) {

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

    private void confirmarIncluir(HttpServletRequest request, HttpServletResponse response) {
        String nome = request.getParameter("txtNomeKit");
        String descricao = request.getParameter("txtDescricaoKit");
        String dataInicioRetirada = request.getParameter("txtDataInicioRetiradaKit");
        String dataFinalRetirada = request.getParameter("txtDataFinalRetiradaKit");
        String imagem = request.getParameter("fileImagemKit");
        String tipoChip = request.getParameter("optTipoChip");

        HttpSession session = request.getSession(true);
        Organizador organizador = (Organizador) session.getAttribute("organizador");

        try {
            Kit kit = new Kit(nome, descricao, imagem, tipoChip, dataInicioRetirada, dataFinalRetirada, organizador);
            kit.gravar();
            RequestDispatcher view = request.getRequestDispatcher("PesquisaKitController");
            view.forward(request, response);
        } catch (IOException ex) {
        } catch (SQLException ex) {
        } catch (ClassNotFoundException ex) {
        } catch (ServletException ex) {
        }
    }

    private void prepararExcluir(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setAttribute("operacao", "Excluir");
            int idKit = Integer.parseInt(request.getParameter("id"));
            HttpSession session = request.getSession(true);
            Organizador organizador = (Organizador) session.getAttribute("organizador");
            Kit kit = Kit.obterKit(idKit, organizador.getId());
            request.setAttribute("kit", kit);
            RequestDispatcher view = request.getRequestDispatcher("/manterKit.jsp");
            view.forward(request, response);
        } catch (ServletException ex) {

        } catch (IOException ex) {

        } catch (ClassNotFoundException ex) {

        }
    }

    private void confirmarExcluir(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("hiddenIdKit"));
        String nome = request.getParameter("txtNomeKit");
        String descricao = request.getParameter("txtDescricaoKit");
        String dataInicioRetirada = request.getParameter("txtDataInicioRetiradaKit");
        String dataFinalRetirada = request.getParameter("txtDataFinalRetiradaKit");
        String imagem = request.getParameter("fileImagemKit");
        String tipoChip = request.getParameter("optTipoChip");

        Kit kit = new Kit(id, descricao, nome, imagem, tipoChip, dataInicioRetirada, dataFinalRetirada, null);
        try {
            kit.excluir();
            RequestDispatcher view = request.getRequestDispatcher("PesquisaKitController");
            view.forward(request, response);
        } catch (IOException ex) {
        } catch (SQLException ex) {
        } catch (ClassNotFoundException ex) {
        } catch (ServletException ex) {
        }
    }

    private void prepararEditar(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setAttribute("operacao", "Editar");
            int idKit = Integer.parseInt(request.getParameter("id"));
            HttpSession session = request.getSession(true);
            Organizador organizador = (Organizador) session.getAttribute("organizador");
            Kit kit = Kit.obterKit(idKit, organizador.getId());
            request.setAttribute("kit", kit);
            RequestDispatcher view = request.getRequestDispatcher("/manterKit.jsp");
            view.forward(request, response);
        } catch (ServletException ex) {

        } catch (IOException ex) {

        } catch (ClassNotFoundException ex) {

        }
    }

    private void confirmarEditar(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("hiddenIdKit"));
        String nome = request.getParameter("txtNomeKit");
        String descricao = request.getParameter("txtDescricaoKit");
        String dataInicioRetirada = request.getParameter("txtDataInicioRetiradaKit");
        String dataFinalRetirada = request.getParameter("txtDataFinalRetiradaKit");
        String imagem = request.getParameter("fileImagemKit");
        String tipoChip = request.getParameter("optTipoChip");

        HttpSession session = request.getSession(true);
        Organizador organizador = (Organizador) session.getAttribute("organizador");

        try {
            Kit kit = new Kit(id, nome, descricao, imagem, tipoChip, dataInicioRetirada, dataFinalRetirada, organizador);
            kit.alterar();
            RequestDispatcher view = request.getRequestDispatcher("PesquisaKitController");
            view.forward(request, response);
        } catch (IOException ex) {
        } catch (SQLException ex) {
        } catch (ClassNotFoundException ex) {
        } catch (ServletException ex) {
        }
    }

}
