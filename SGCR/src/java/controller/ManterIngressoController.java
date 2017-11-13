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
import modelo.Corrida;
import modelo.Ingresso;

/**
 *
 * @author straby
 */
public class ManterIngressoController extends HttpServlet {

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
                        if (acao.equals("prepararEditar")){
                            prepararEditar(request, response);
                        } else {
                            if (acao.equals("confirmarEditar")){
                                confirmarEditar(request, response);
                            }
                        }
                    }
                }

            }
        }
    }

    public void confirmarIncluir(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("txtIdIngresso"));
        String tipo = request.getParameter("txtTipoIngresso");
        double preco = Double.parseDouble(request.getParameter("txtPrecoIngresso"));
        String dataInicio = request.getParameter("txtDataInicioIngresso");
        String dataFinal = request.getParameter("txtDataFinalIngresso");
        int quantidade = Integer.parseInt(request.getParameter("txtQuantidadeIngresso"));
        int corridasId = Integer.parseInt(request.getParameter("optCorrida"));

        try {
            Corrida corrida = Corrida.obterCorrida(corridasId);
            Ingresso ingresso = new Ingresso(id, tipo, preco, dataInicio, dataFinal, quantidade, corrida);
            ingresso.gravar();

            RequestDispatcher view
                    = request.getRequestDispatcher("PesquisaIngressoController");
            view.forward(request, response);
        } catch (IOException ex) {
        } catch (SQLException ex) {
        } catch (ClassNotFoundException ex) {
        } catch (ServletException ex) {
        }
    }

    public void prepararIncluir(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setAttribute("operacao", "Incluir");
            //Para chave estrangeira
            request.setAttribute("corridas", Corrida.obterCorridas());
            RequestDispatcher view
                    = request.getRequestDispatcher("/manterIngresso.jsp");
            view.forward(request, response);
        } catch (ServletException ex) {
        } catch (IOException ex) {
        } catch (ClassNotFoundException ex) {
        }
        //catch(ClassNotFoundException ex){ }
    }
    
      public void prepararEditar(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setAttribute("operacao", "Editar");
            request.setAttribute("corridas", Corrida.obterCorridas());

            int id = Integer.parseInt(request.getParameter("id"));
            Ingresso ingresso = Ingresso.obterIngresso(id);

            request.setAttribute("ingresso", ingresso);
            RequestDispatcher view = request.getRequestDispatcher("/manterIngresso.jsp");
            view.forward(request, response);

        } catch (ServletException ex) {
        } catch (IOException ex) {
        } catch (ClassNotFoundException ex) {
        }
    }

    public void confirmarEditar(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("txtIdIngresso"));
        String tipo = request.getParameter("txtTipoIngresso");
        double preco = Double.parseDouble(request.getParameter("txtPrecoIngresso"));
        String dataInicio = request.getParameter("txtDataInicioIngresso");
        String dataFinal = request.getParameter("txtDataFinalIngresso");
        int quantidade = Integer.parseInt(request.getParameter("txtQuantidadeIngresso"));
        int corridasId = Integer.parseInt(request.getParameter("optCorrida"));

        try {
            Corrida corrida = Corrida.obterCorrida(corridasId);
            Ingresso ingresso = new Ingresso(id, tipo, preco, dataInicio, dataFinal, quantidade, corrida);

            ingresso.alterar();
            RequestDispatcher view = request.getRequestDispatcher("PesquisaIngressoController");
            view.forward(request, response);
        } catch (IOException ex) {
        } catch (SQLException ex) {
        } catch (ClassNotFoundException ex) {
        } catch (ServletException ex) {
        }

    }

    public void prepararExcluir(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setAttribute("operacao", "Excluir");
            request.setAttribute("corridas", Corrida.obterCorridas());

            int id = Integer.parseInt(request.getParameter("id"));
            Ingresso ingresso = Ingresso.obterIngresso(id);

            request.setAttribute("ingresso", ingresso);
            RequestDispatcher view = request.getRequestDispatcher("/manterIngresso.jsp");
            view.forward(request, response);

        } catch (ServletException ex) {
        } catch (IOException ex) {
        } catch (ClassNotFoundException ex) {
        }
    }

    public void confirmarExcluir(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("txtIdIngresso"));
        String tipo = request.getParameter("txtTipoIngresso");
        double preco = Double.parseDouble(request.getParameter("txtPrecoIngresso"));
        String dataInicio = request.getParameter("txtDataInicioIngresso");
        String dataFinal = request.getParameter("txtDataFinalIngresso");
        int quantidade = Integer.parseInt(request.getParameter("txtQuantidadeIngresso"));
        int corridasId = Integer.parseInt(request.getParameter("optCorrida"));

        try {
            //Corrida corrida = Corrida.obterCorrida(corridasId);
            Ingresso ingresso = new Ingresso(id, tipo, preco, dataInicio, dataFinal, quantidade, null);

            ingresso.excluir();
            RequestDispatcher view = request.getRequestDispatcher("PesquisaIngressoController");
            view.forward(request, response);
        } catch (IOException ex) {
        } catch (SQLException ex) {
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
