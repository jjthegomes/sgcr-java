/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Atleta;
import modelo.Boleto;
import modelo.CartaoCredito;
import modelo.Corrida;
import modelo.Inscricao;
import modelo.Kit;
import modelo.Lote;
import modelo.Percurso;

/**
 *
 * @author rafael
 */
public class ManterInscricaoController extends HttpServlet {

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
        } else if (acao.equals("prepararExcluir")) {
            prepararExcluir(request, response);
        } else if (acao.equals("confirmarExcluir")) {
            confirmarExcluir(request, response);
        } else if (acao.equals("prepararEditar")) {
            prepararEditar(request, response);
        } else if (acao.equals("confirmarEditar")) {
            confirmarEditar(request, response);
        } else if (acao.equals("escolherCorrida")) {
            escolherCorrida(request, response);
        }
    }

    public void prepararIncluir(HttpServletRequest request, HttpServletResponse response) {
        try {
            int corridaId = Integer.parseInt(request.getParameter("corridaId"));
            request.setAttribute("corridaId", corridaId);
            request.setAttribute("operacao", "Incluir");
            request.setAttribute("atletas", Atleta.obterAtletas());
            request.setAttribute("percursos", Percurso.obterPercursos(corridaId));
            request.setAttribute("kits", Kit.obterKits(corridaId));
            request.setAttribute("lotes", Lote.obterLotes(corridaId));
            request.setAttribute("corrida", Corrida.obterCorrida(corridaId));

            Calendar hoje = Calendar.getInstance();
            ArrayList<Integer> anos = new ArrayList();
            anos.add(hoje.get(Calendar.YEAR));
            for (int i = anos.get(0) + 1; i < anos.get(0) + 15; i++) {
                anos.add(i);
            }
            request.setAttribute("anos", anos);

            RequestDispatcher view = request.getRequestDispatcher("/manterInscricao.jsp");
            view.forward(request, response);
        } catch (ServletException ex) {

        } catch (IOException ex) {

        } catch (ClassNotFoundException ex) {

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
        int id = Integer.parseInt(request.getParameter("txtIdInscricao"));
        int corridaId = Integer.parseInt(request.getParameter("corridaId"));

        int atletaId = Integer.parseInt(request.getParameter("optAtleta"));
        int percursoId = Integer.parseInt(request.getParameter("optPercurso"));
        int kitId = Integer.parseInt(request.getParameter("optKit"));
        int loteId = Integer.parseInt(request.getParameter("optLote"));

        try {
            Atleta atleta = Atleta.obterAtleta(atletaId);
            Percurso percurso = Percurso.obterPercurso(percursoId);
            Kit kit = Kit.obterKit(kitId, corridaId);
            Lote lote = Lote.obterLote(loteId);

            Inscricao inscricao = new Inscricao(id, atleta, percurso, kit, lote);
            inscricao.gravar();
            
            if (request.getParameter("formaPagamento").equals("cartaoCredito")) {
                int idCartaoCredito = Integer.parseInt(request.getParameter("idCartaoCredito"));
                String numeroCartaoCredito = request.getParameter("numeroCartaoCredito");
                String nomeTitularCartaoCredito = request.getParameter("nomeTitularCartaoCredito");
                String codigoSegurancaCartaoCredito = request.getParameter("codigoSegurancaCartaoCredito");
                String mesValidadeCartaoCredito = request.getParameter("mesValidadeCartaoCredito");
                String anoValidadeCartaoCredito = request.getParameter("anoValidadeCartaoCredito");
                String dataValidadeCartaoCredito = mesValidadeCartaoCredito + "/" + anoValidadeCartaoCredito;

                try {
                    CartaoCredito cartaoCredito = new CartaoCredito(idCartaoCredito, numeroCartaoCredito, codigoSegurancaCartaoCredito, dataValidadeCartaoCredito, nomeTitularCartaoCredito, inscricao);
                    cartaoCredito.gravar();
                } catch (SQLException | ClassNotFoundException ex) {
                }
                request.setAttribute("cartaoCredito", CartaoCredito.obterCartaoCredito(idCartaoCredito));
                
            } else if (request.getParameter("formaPagamento").equals("boleto")) {
                int idBoleto = Integer.parseInt(request.getParameter("idBoleto"));
                String nomeTitularBoleto = request.getParameter("nomeTitularBoleto");
                String cpfTitularBoleto = request.getParameter("cpfTitularBoleto");
                
                try {
                    Boleto boleto = new Boleto(idBoleto, nomeTitularBoleto, cpfTitularBoleto, inscricao);
                    boleto.gravar();
                } catch (SQLException | ClassNotFoundException ex) {
                }
                request.setAttribute("boleto", Boleto.obterBoleto(idBoleto));
            }
            
            request.setAttribute("formaPagamento", request.getParameter("formaPagamento"));
            request.setAttribute("atleta", Atleta.obterAtleta(atletaId));
            request.setAttribute("percurso", Percurso.obterPercurso(percursoId));
            request.setAttribute("kit", Kit.obterKit(kitId,corridaId));
            request.setAttribute("lote", Lote.obterLote(loteId));
            request.setAttribute("corrida", Corrida.obterCorrida(corridaId));
            request.setAttribute("inscricao", inscricao);
            
            RequestDispatcher view = request.getRequestDispatcher("/finalizarInscricao.jsp");
            view.forward(request, response);
        } catch (IOException | SQLException | ClassNotFoundException | ServletException ex) {
        }
    }

    private void prepararExcluir(HttpServletRequest request, HttpServletResponse response) {
        try {
            int corridaId = Integer.parseInt(request.getParameter("corridaId"));
            request.setAttribute("operacao", "Excluir");
            request.setAttribute("atletas", Atleta.obterAtletas());
            request.setAttribute("percursos", Percurso.obterPercursos(corridaId));
            request.setAttribute("kits", Kit.obterKits(corridaId));
            request.setAttribute("lotes", Lote.obterLotes(corridaId));
            int idInscricao = Integer.parseInt(request.getParameter("id"));

            request.setAttribute("corridaId", corridaId);
            request.setAttribute("corrida", Corrida.obterCorrida(corridaId));

            Inscricao inscricao = Inscricao.obterInscricao(idInscricao);
            request.setAttribute("inscricao", inscricao);
            RequestDispatcher view = request.getRequestDispatcher("/manterInscricao.jsp");
            view.forward(request, response);
        } catch (ServletException ex) {

        } catch (IOException ex) {

        } catch (ClassNotFoundException ex) {

        }
    }

    private void confirmarExcluir(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("txtIdInscricao"));
        String dataCompra = request.getParameter("txtDataCompraInscricao");
        String numeroPeito = request.getParameter("txtNumeroPeitoInscricao");
        Boolean pago = Boolean.parseBoolean(request.getParameter("optPago"));
        Boolean kitRetirado = Boolean.parseBoolean(request.getParameter("optKitRetirado"));
        String tempoLargada = request.getParameter("txtTempoLargada");
        String tempoChegada = request.getParameter("txtTempoChegada");

        Inscricao inscricao = new Inscricao(id, dataCompra, numeroPeito, pago, kitRetirado, tempoLargada, tempoChegada, null, null, null, null);

        try {
            inscricao.excluir();
            RequestDispatcher view = request.getRequestDispatcher("PesquisaInscricaoController");
            view.forward(request, response);
        } catch (IOException ex) {
        } catch (SQLException ex) {
        } catch (ClassNotFoundException ex) {
        } catch (ServletException ex) {
        }
    }

    private void prepararEditar(HttpServletRequest request, HttpServletResponse response) {
        try {
            int corridaId = Integer.parseInt(request.getParameter("corridaId"));
            request.setAttribute("operacao", "Editar");
            request.setAttribute("atletas", Atleta.obterAtletas());
            request.setAttribute("percursos", Percurso.obterPercursos(corridaId));
            request.setAttribute("kits", Kit.obterKits(corridaId));
            request.setAttribute("lotes", Lote.obterLotes(corridaId));
            request.setAttribute("corridaId", corridaId);

            request.setAttribute("corrida", Corrida.obterCorrida(corridaId));

            int idInscricao = Integer.parseInt(request.getParameter("id"));
            Inscricao inscricao = Inscricao.obterInscricao(idInscricao);
            request.setAttribute("inscricao", inscricao);
            RequestDispatcher view = request.getRequestDispatcher("/manterInscricao.jsp");
            view.forward(request, response);
        } catch (ServletException ex) {

        } catch (IOException ex) {

        } catch (ClassNotFoundException ex) {

        }
    }

    private void confirmarEditar(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("txtIdInscricao"));

        try {
            Inscricao thisInscricao = Inscricao.obterInscricao(id);

            String dataCompra = thisInscricao.getDataCompra();
            String numeroPeito = thisInscricao.getNumeroPeito();
            Boolean pago = thisInscricao.isPago();
            Boolean kitRetirado = thisInscricao.isKitRetirado();
            String tempoLargada = thisInscricao.getTempoLargada();
            String tempoChegada = thisInscricao.getTempoChegada();

            int atletaId = Integer.parseInt(request.getParameter("optAtleta"));
            int percursoId = Integer.parseInt(request.getParameter("optPercurso"));
            int kitId = Integer.parseInt(request.getParameter("optKit"));

            int corridaId = Integer.parseInt(request.getParameter("corridaId"));
            try {
                request.setAttribute("corridaId", corridaId);
                request.setAttribute("corrida", Corrida.obterCorrida(corridaId));
            } catch (NullPointerException | NumberFormatException ex) {

            }

            int loteId = Integer.parseInt(request.getParameter("optLote"));
            Atleta atleta = Atleta.obterAtleta(atletaId);
            Percurso percurso = Percurso.obterPercurso(percursoId);
            Kit kit = Kit.obterKit(kitId, corridaId);
            Lote lote = Lote.obterLote(loteId);

            Inscricao inscricao = new Inscricao(id, dataCompra, numeroPeito, pago, kitRetirado, tempoLargada, tempoChegada, atleta, percurso, kit, lote);
            inscricao.alterar();
            RequestDispatcher view = request.getRequestDispatcher("PesquisaInscricaoController");
            view.forward(request, response);
        } catch (IOException ex) {
        } catch (SQLException ex) {
        } catch (ClassNotFoundException ex) {
        } catch (ServletException ex) {
        }
    }

    private void escolherCorrida(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setAttribute("corridas", Corrida.obterCorridas());
            RequestDispatcher view = request.getRequestDispatcher("/escolherCorridaInscricao.jsp");
            view.forward(request, response);
        } catch (IOException ex) {
        } catch (ClassNotFoundException ex) {
        } catch (ServletException ex) {
        }
    }

}
