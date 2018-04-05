/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;

/**
 *
 * @author ariel
 */
public class RelatorioController extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, JRException {
        response.setContentType("text/html;charset=UTF-8");
        String acao = request.getParameter("acao");
        if (acao.equals("gerarRelatorioOrganizadores")) {
            gerarRelatorioOrganizadores(request, response);
        } else if (acao.equals("gerarRelatorioCorridasPorOrganizador")) {
            gerarRelatorioCorridasPorOrganizador(request, response);
        } else if (acao.equals("gerarRelatorioAtletas")) {
            gerarRelatorioAtletas(request, response);
        } else if (acao.equals("gerarRelatorioAtletasPorCorrida")) {
            gerarRelatorioAtletasPorCorrida(request, response);
        }  else if (acao.equals("gerarRelatorioAtletas")) {
            gerarRelatorioAtletas(request, response);
        }else if (acao.equals("gerarRelatorioAtletasInadimplentes")) {
            gerarRelatorioAtletasInadimplentes(request, response);
        }else if (acao.equals("gerarRelatorioBoleto")) {
            gerarRelatorioBoleto(request, response);
        }else if (acao.equals("gerarRelatorioCartao")) {
            gerarRelatorioCartao(request, response);
        }else if (acao.equals("gerarRelatorioTodosPagamentos")) {
            gerarRelatorioTodosPagamentos(request, response);
        }else if (acao.equals("gerarRelatorioCorridasParticipadas")) {
            gerarRelatorioCorridasParticipadas(request, response);
        }else if (acao.equals("gerarRelatorioRelatorioTodosPagamentosAtleta")) {
            gerarRelatorioRelatorioTodosPagamentosAtleta(request, response);
        }
    }

    public void gerarRelatorioOrganizadores(HttpServletRequest request, HttpServletResponse response) throws JRException, IOException {
        Connection conexao = null;
        String relatorio = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexao = DriverManager.getConnection("jdbc:mysql://localhost/SGCR", "root", "");
            HashMap parametros = new HashMap();
            // parametros.put("PAR_codCurso", Integer.parseInt(request.getParameter("txtCodCurso")));
            relatorio = getServletContext().getRealPath("/relatorio") + "/report_organizador.jasper";
            JasperPrint jp = JasperFillManager.fillReport(relatorio, parametros, conexao);
            byte[] relat = JasperExportManager.exportReportToPdf(jp);
            response.setHeader("Content-Disposition", "attachment;filename=report_organizador.pdf");
            response.setContentType("application/pdf");
            response.getOutputStream().write(relat);
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (!conexao.isClosed()) {
                    conexao.close();
                }
            } catch (SQLException ex) {
            }
        }
    }

    public void gerarRelatorioCorridasPorOrganizador(HttpServletRequest request, HttpServletResponse response) throws JRException, IOException {
        Connection conexao = null;
        String relatorio = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexao = DriverManager.getConnection("jdbc:mysql://localhost/SGCR", "root", "");
            HashMap parametros = new HashMap();
//            int id = Integer.parseInt(request.getParameter("id"));
            parametros.put("P_idOrganizador", Integer.parseInt(request.getParameter("organizadorId")));
            relatorio = getServletContext().getRealPath("/relatorio") + "/report_corridaOrganizador.jasper";
            JasperPrint jp = JasperFillManager.fillReport(relatorio, parametros, conexao);
            byte[] relat = JasperExportManager.exportReportToPdf(jp);
            response.setHeader("Content-Disposition", "attachment;filename=relatorioCorridasOrganizador.pdf");
            response.setContentType("application/pdf");
            response.getOutputStream().write(relat);
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (!conexao.isClosed()) {
                    conexao.close();
                }
            } catch (SQLException ex) {
            }
        }
    }
    
    public void gerarRelatorioAtletas(HttpServletRequest request, HttpServletResponse response) throws JRException, IOException {
        Connection conexao = null;
        String relatorio = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexao = DriverManager.getConnection("jdbc:mysql://localhost/SGCR", "root", "");
            HashMap parametros = new HashMap();
            // parametros.put("PAR_codCurso", Integer.parseInt(request.getParameter("txtCodCurso")));
            relatorio = getServletContext().getRealPath("/relatorio") + "/report_atleta.jasper";
            JasperPrint jp = JasperFillManager.fillReport(relatorio, parametros, conexao);
            byte[] relat = JasperExportManager.exportReportToPdf(jp);
            response.setHeader("Content-Disposition", "attachment;filename=report_atleta.pdf");
            response.setContentType("application/pdf");
            response.getOutputStream().write(relat);
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (!conexao.isClosed()) {
                    conexao.close();
                }
            } catch (SQLException ex) {
            }
        }
    }
    
    public void gerarRelatorioAtletasPorCorrida(HttpServletRequest request, HttpServletResponse response) throws JRException, IOException {
        Connection conexao = null;
        String relatorio = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexao = DriverManager.getConnection("jdbc:mysql://localhost/SGCR", "root", "");
            HashMap parametros = new HashMap();
//            int id = Integer.parseInt(request.getParameter("id"));
            parametros.put("P_corridaid", Integer.parseInt(request.getParameter("corridaId")));
            relatorio = getServletContext().getRealPath("/relatorio") + "/report_atletaCorrida.jasper";
            JasperPrint jp = JasperFillManager.fillReport(relatorio, parametros, conexao);
            byte[] relat = JasperExportManager.exportReportToPdf(jp);
            response.setHeader("Content-Disposition", "attachment;filename=relatorioAtletasCorrida.pdf");
            response.setContentType("application/pdf");
            response.getOutputStream().write(relat);
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (!conexao.isClosed()) {
                    conexao.close();
                }
            } catch (SQLException ex) {
            }
        }
    }
    
    public void gerarRelatorioAtletasKit(HttpServletRequest request, HttpServletResponse response) throws JRException, IOException {
        Connection conexao = null;
        String relatorio = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexao = DriverManager.getConnection("jdbc:mysql://localhost/SGCR", "root", "");
            HashMap parametros = new HashMap();
            // parametros.put("PAR_codCurso", Integer.parseInt(request.getParameter("txtCodCurso")));
            relatorio = getServletContext().getRealPath("/relatorio") + "/report_atletaKit.jasper";
            JasperPrint jp = JasperFillManager.fillReport(relatorio, parametros, conexao);
            byte[] relat = JasperExportManager.exportReportToPdf(jp);
            response.setHeader("Content-Disposition", "attachment;filename=report_atletaKit.pdf");
            response.setContentType("application/pdf");
            response.getOutputStream().write(relat);
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (!conexao.isClosed()) {
                    conexao.close();
                }
            } catch (SQLException ex) {
            }
        }
    }
    
    //***inicio****
    
    
    public void gerarRelatorioAtletasInadimplentes(HttpServletRequest request, HttpServletResponse response) throws JRException, IOException {
        Connection conexao = null;
        String relatorio = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexao = DriverManager.getConnection("jdbc:mysql://localhost/SGCR", "root", "");
            HashMap parametros = new HashMap();
            parametros.put("P_corridaid", Integer.parseInt(request.getParameter("corridaId")));
            relatorio = getServletContext().getRealPath("/relatorio") + "/report_corredoresInadimplentes.jasper";
            JasperPrint jp = JasperFillManager.fillReport(relatorio, parametros, conexao);
            byte[] relat = JasperExportManager.exportReportToPdf(jp);
            response.setHeader("Content-Disposition", "attachment;filename=report_organizador.pdf");
            response.setContentType("application/pdf");
            response.getOutputStream().write(relat);
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (!conexao.isClosed()) {
                    conexao.close();
                }
            } catch (SQLException ex) {
            }
        }
    }
    public void gerarRelatorioBoleto(HttpServletRequest request, HttpServletResponse response) throws JRException, IOException {
        Connection conexao = null;
        String relatorio = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexao = DriverManager.getConnection("jdbc:mysql://localhost/SGCR", "root", "");
            HashMap parametros = new HashMap();
            parametros.put("P_corridaId", Integer.parseInt(request.getParameter("corridaId")));
            relatorio = getServletContext().getRealPath("/relatorio") + "/report_pagamentoBoleto.jasper";
            JasperPrint jp = JasperFillManager.fillReport(relatorio, parametros, conexao);
            byte[] relat = JasperExportManager.exportReportToPdf(jp);
            response.setHeader("Content-Disposition", "attachment;filename=report_organizador.pdf");
            response.setContentType("application/pdf");
            response.getOutputStream().write(relat);
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (!conexao.isClosed()) {
                    conexao.close();
                }
            } catch (SQLException ex) {
            }
        }
    }
    public void gerarRelatorioCartao(HttpServletRequest request, HttpServletResponse response) throws JRException, IOException {
        Connection conexao = null;
        String relatorio = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexao = DriverManager.getConnection("jdbc:mysql://localhost/SGCR", "root", "");
            HashMap parametros = new HashMap();
            parametros.put("P_corridaId", Integer.parseInt(request.getParameter("corridaId")));
            relatorio = getServletContext().getRealPath("/relatorio") + "/report_pagamentoCartao.jasper";
            JasperPrint jp = JasperFillManager.fillReport(relatorio, parametros, conexao);
            byte[] relat = JasperExportManager.exportReportToPdf(jp);
            response.setHeader("Content-Disposition", "attachment;filename=report_organizador.pdf");
            response.setContentType("application/pdf");
            response.getOutputStream().write(relat);
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (!conexao.isClosed()) {
                    conexao.close();
                }
            } catch (SQLException ex) {
            }
        }
    }
    public void gerarRelatorioTodosPagamentos(HttpServletRequest request, HttpServletResponse response) throws JRException, IOException {
        Connection conexao = null;
        String relatorio = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexao = DriverManager.getConnection("jdbc:mysql://localhost/SGCR", "root", "");
            HashMap parametros = new HashMap();
            parametros.put("P_corridaId", Integer.parseInt(request.getParameter("corridaId")));
            relatorio = getServletContext().getRealPath("/relatorio") + "/report_organizadorPagamento.jasper";
            JasperPrint jp = JasperFillManager.fillReport(relatorio, parametros, conexao);
            byte[] relat = JasperExportManager.exportReportToPdf(jp);
            response.setHeader("Content-Disposition", "attachment;filename=report_organizador.pdf");
            response.setContentType("application/pdf");
            response.getOutputStream().write(relat);
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (!conexao.isClosed()) {
                    conexao.close();
                }
            } catch (SQLException ex) {
            }
        }
    }
    public void gerarRelatorioCorridasParticipadas(HttpServletRequest request, HttpServletResponse response) throws JRException, IOException {
        Connection conexao = null;
        String relatorio = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexao = DriverManager.getConnection("jdbc:mysql://localhost/SGCR", "root", "");
            HashMap parametros = new HashMap();
            parametros.put("P_corridaId", Integer.parseInt(request.getParameter("corridaId")));
            relatorio = getServletContext().getRealPath("/relatorio") + "/report_atletaCorrida.jasper";
            JasperPrint jp = JasperFillManager.fillReport(relatorio, parametros, conexao);
            byte[] relat = JasperExportManager.exportReportToPdf(jp);
            response.setHeader("Content-Disposition", "attachment;filename=report_organizador.pdf");
            response.setContentType("application/pdf");
            response.getOutputStream().write(relat);
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (!conexao.isClosed()) {
                    conexao.close();
                }
            } catch (SQLException ex) {
            }
        }
    }
    public void gerarRelatorioRelatorioTodosPagamentosAtleta(HttpServletRequest request, HttpServletResponse response) throws JRException, IOException {
        Connection conexao = null;
        String relatorio = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexao = DriverManager.getConnection("jdbc:mysql://localhost/SGCR", "root", "");
            HashMap parametros = new HashMap();
            parametros.put("P_corridaId", Integer.parseInt(request.getParameter("corridaId")));
            relatorio = getServletContext().getRealPath("/relatorio") + "/report_pagamentoAtleta.jasper";
            JasperPrint jp = JasperFillManager.fillReport(relatorio, parametros, conexao);
            byte[] relat = JasperExportManager.exportReportToPdf(jp);
            response.setHeader("Content-Disposition", "attachment;filename=report_organizador.pdf");
            response.setContentType("application/pdf");
            response.getOutputStream().write(relat);
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (!conexao.isClosed()) {
                    conexao.close();
                }
            } catch (SQLException ex) {
            }
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
            Logger.getLogger(RelatorioController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (JRException ex) {
            Logger.getLogger(RelatorioController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(RelatorioController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (JRException ex) {
            Logger.getLogger(RelatorioController.class.getName()).log(Level.SEVERE, null, ex);
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
