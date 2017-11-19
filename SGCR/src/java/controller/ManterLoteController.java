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
import modelo.Lote;

/**
 *
 * @author straby
 */
public class ManterLoteController extends HttpServlet {

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
        int id = Integer.parseInt(request.getParameter("txtIdLote"));
        String tipo = request.getParameter("txtTipoLote");
        double preco = Double.parseDouble(request.getParameter("txtPrecoLote"));
        String dataInicio = request.getParameter("txtDataInicioLote");
        String dataFinal = request.getParameter("txtDataFinalLote");
        int quantidade = Integer.parseInt(request.getParameter("txtQuantidadeLote"));
        int corridasId = Integer.parseInt(request.getParameter("optCorrida"));

        try {
            Corrida corrida = Corrida.obterCorrida(corridasId);
            Lote ingresso = new Lote(id, tipo, preco, dataInicio, dataFinal, quantidade, corrida);
            ingresso.gravar();

            RequestDispatcher view
                    = request.getRequestDispatcher("PesquisaLoteController");
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
                    = request.getRequestDispatcher("/manterLote.jsp");
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
            Lote lote = Lote.obterLote(id);

            request.setAttribute("lote", lote);
            RequestDispatcher view = request.getRequestDispatcher("/manterLote.jsp");
            view.forward(request, response);

        } catch (ServletException ex) {
        } catch (IOException ex) {
        } catch (ClassNotFoundException ex) {
        }
    }

    public void confirmarEditar(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("txtIdLote"));
        String tipo = request.getParameter("txtTipoLote");
        double preco = Double.parseDouble(request.getParameter("txtPrecoLote"));
        String dataInicio = request.getParameter("txtDataInicioLote");
        String dataFinal = request.getParameter("txtDataFinalLote");
        int quantidade = Integer.parseInt(request.getParameter("txtQuantidadeLote"));
        int corridasId = Integer.parseInt(request.getParameter("optCorrida"));

        try {
            Corrida corrida = Corrida.obterCorrida(corridasId);
            Lote ingresso = new Lote(id, tipo, preco, dataInicio, dataFinal, quantidade, corrida);

            ingresso.alterar();
            RequestDispatcher view = request.getRequestDispatcher("PesquisaLoteController");
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
            Lote lote = Lote.obterLote(id);

            request.setAttribute("lote", lote);
            RequestDispatcher view = request.getRequestDispatcher("/manterLote.jsp");
            view.forward(request, response);

        } catch (ServletException ex) {
        } catch (IOException ex) {
        } catch (ClassNotFoundException ex) {
        }
    }

    public void confirmarExcluir(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("txtIdLote"));
        String tipo = request.getParameter("txtTipoLote");
        double preco = Double.parseDouble(request.getParameter("txtPrecoLote"));
        String dataInicio = request.getParameter("txtDataInicioLote");
        String dataFinal = request.getParameter("txtDataFinalLote");
        int quantidade = Integer.parseInt(request.getParameter("txtQuantidadeLote"));
        int corridasId = Integer.parseInt(request.getParameter("optCorrida"));

        try {
            //Corrida corrida = Corrida.obterCorrida(corridasId);
            Lote lote = new Lote(id, tipo, preco, dataInicio, dataFinal, quantidade, null);

            lote.excluir();
            RequestDispatcher view = request.getRequestDispatcher("PesquisaLoteController");
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
