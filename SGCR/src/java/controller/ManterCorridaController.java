/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import modelo.Corrida;
import modelo.Kit;
import modelo.Lote;
import modelo.Organizador;
import modelo.Percurso;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author RAJ
 */
@MultipartConfig
public class ManterCorridaController extends HttpServlet {

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
            //HttpSession session = request.getSession(true);
            //Organizador organizador = (Organizador) session.getAttribute("organizador");

            request.setAttribute("operacao", "Incluir");

            RequestDispatcher view
                    = request.getRequestDispatcher("/manterCorrida.jsp");
            view.forward(request, response);
        } catch (ServletException ex) {
        } catch (IOException ex) {
        }
    }

    public void confirmarIncluir(HttpServletRequest request, HttpServletResponse response) {
        String nome = request.getParameter("txtNomeCorrida");
        int maxPessoa = Integer.parseInt(request.getParameter("txtMaxPessoaCorrida"));
        String horario = request.getParameter("txtHorarioCorrida");
        String data = request.getParameter("txtDataCorrida");
        String rua = request.getParameter("txtRuaCorrida");
        String cep = request.getParameter("txtCepCorrida");
        String numero = request.getParameter("txtNumeroCorrida");
        String cidade = request.getParameter("txtCidadeCorrida");
        String estado = request.getParameter("txtEstadoCorrida");
        String bairro = request.getParameter("txtBairroCorrida");
        String descricao = request.getParameter("txtDescricaoCorrida");
        String dataInicioRetiradaKit = request.getParameter("txtDataInicioRetiradaKit");
        String dataFinalRetiradaKit = request.getParameter("txtDataFinalRetiradaKit");

//        String banner = request.getParameter("txtBannerCorrida");
        String edicao = "1";
        boolean ativo = true;

        HttpSession session = request.getSession(true);
        Organizador organizador = (Organizador) session.getAttribute("organizador");

        try {
            Corrida corrida = new Corrida(nome, maxPessoa, horario, data,
                    "", rua, cep, numero, cidade, estado, bairro, descricao, edicao, ativo, dataInicioRetiradaKit, dataFinalRetiradaKit, organizador);
            corrida.gravar();

            corrida = Corrida.obterUltimaCorridaOrganizador(organizador.getId());

//    Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">
//    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
//    InputStream fileContent = filePart.getInputStream();
            //kit
            String[] arrayNomeKit = request.getParameterValues("txtNomeKit");
            String[] arrayPrecoKit = request.getParameterValues("txtPrecoKit");
            String[] arrayTipoChipKit = request.getParameterValues("txtTipoChipKit");
            String[] arrayDescricaoKit = request.getParameterValues("txtDescricaoKit");

            String[] arrayImagemKit = uploadFiles(request, response);

            for (int i = 0; i < arrayNomeKit.length; i++) {
                String imagemKit = arrayImagemKit[i];
                String nomeKit = arrayNomeKit[i];
                Double precoKit = Double.parseDouble(arrayPrecoKit[i]);
                String tipoChipKit = arrayTipoChipKit[i];
                String descricaoKit = arrayDescricaoKit[i];

                Kit kit = new Kit(nomeKit, descricaoKit, imagemKit, tipoChipKit, precoKit, organizador);

                kit.gravar();
                Kit kitTemp = Kit.obterUltimoKitOrganizador(organizador.getId());
                kitTemp.setPreco(kit.getPreco());
                kit = kitTemp;
                kit.gravarKitCorrida(corrida);
            }

            //percurso
            String[] arrayQuilometragemPercurso = request.getParameterValues("txtQuilometragemPercurso");
            String[] arrayDescricaoPercurso = request.getParameterValues("txtDescricaoPercurso");

            for (int i = 0; i < arrayQuilometragemPercurso.length; i++) {
                Double quilometragemPercurso = Double.parseDouble(arrayQuilometragemPercurso[i]);
                String descricaoPercurso = arrayDescricaoPercurso[i];

                Percurso percurso = new Percurso(quilometragemPercurso, descricaoPercurso, organizador);
                percurso.gravar();
                percurso = Percurso.obterUltimoPercursoOrganizador(organizador.getId());
                percurso.gravarPercursoCorrida(corrida);
            }

            //lote
            String[] arrayTipoLote = request.getParameterValues("txtTipoLote");
            String[] arrayPrecoLote = request.getParameterValues("txtPrecoLote");
            String[] arrayDataInicioLote = request.getParameterValues("txtDataInicioLote");
            String[] arrayDataTerminoLote = request.getParameterValues("txtDataTerminoLote");

            for (int i = 0; i < arrayTipoLote.length; i++) {
                String tipoLote = arrayTipoLote[i];
                Double precoLote = Double.parseDouble(arrayPrecoLote[i]);
                String dataInicio = arrayDataInicioLote[i];
                String dataTermino = arrayDataTerminoLote[i];

                Lote lote = new Lote(tipoLote, precoLote, dataInicio, dataTermino, corrida);
                lote.gravar();
            }

            RequestDispatcher view
                    = request.getRequestDispatcher("PesquisaCorridaController");
            view.forward(request, response);
        } catch (IOException ex) {
        } catch (SQLException ex) {
        } catch (ClassNotFoundException ex) {
        } catch (ServletException ex) {
        }
    }

    public String[] uploadFiles(HttpServletRequest request, HttpServletResponse response) {
        /*Identifica se o formulario é do tipo multipart/form-data*/
        String[] files = null;
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                /*Faz o parse do request*/
                List<Part> fileParts = request.getParts().stream().filter(part -> "txtImagemKit".equals(part.getName())).collect(Collectors.toList());

                
                int i = 0;
                for (Part filePart : fileParts) {
//                    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
//                    InputStream fileContent = filePart.getInputStream();

                    Calendar hoje = Calendar.getInstance();
                    String fileName = "IMG-" + hoje.get(Calendar.YEAR) + "-" + (hoje.get(Calendar.MONTH) + 1) + "-" + hoje.get(Calendar.DAY_OF_MONTH) + "_" + hoje.get(Calendar.HOUR_OF_DAY) + "-" + hoje.get(Calendar.MINUTE) + "-" + hoje.get(Calendar.SECOND) + "_" + hoje.get(Calendar.MILLISECOND);
                    String path = "imagesUpload/kit";
                    File uploadPath = new File(request.getServletContext().getRealPath(path));
                    File file = new File(uploadPath, fileName);
                    try (InputStream input = filePart.getInputStream()) {
                        Files.copy(input, file.toPath());
                    }
                       
                    files[i] = path + fileName;
                    i++;
                    
//                    filePart.write(request.getServletContext().getRealPath("imagesUpload/kit") + File.separator + fileName);
                }
//                /*Escreve o arquivo na pasta */
//                for (FileItem item : multiparts) {
//                    if (!item.isFormField()) {
//                        Calendar hoje = Calendar.getInstance();
//                        String fileName = "IMG-" + hoje.get(Calendar.YEAR) + "-" + (hoje.get(Calendar.MONTH) + 1) + "-" + hoje.get(Calendar.DAY_OF_MONTH) + "_" + hoje.get(Calendar.HOUR_OF_DAY) + "-" + hoje.get(Calendar.MINUTE) + "-" + hoje.get(Calendar.SECOND) + "_" + hoje.get(Calendar.MILLISECOND);
//                        request.setAttribute("caminhoRelativo", request.getServletContext().getRealPath("imagesUpload/kit") + File.separator + fileName);
//                        item.write(new File(request.getServletContext().getRealPath("imagesUpload/kit") + File.separator + fileName));
//                    }
//                }
                request.setAttribute("message", "Arquivo carregado com sucesso");
            } catch (Exception ex) {
                request.setAttribute("message", "Upload de arquivo falhou devido a " + ex);
            }

        } else {
            request.setAttribute("message", "Desculpe este Servlet lida apenas com pedido de upload de arquivos");
        }
        return files;
    }

    public void prepararExcluir(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setAttribute("operacao", "Excluir");
            request.setAttribute("organizadores", Organizador.obterOrganizadores());

            int id = Integer.parseInt(request.getParameter("id"));
            Corrida corrida = Corrida.obterCorrida(id);

            request.setAttribute("corrida", corrida);
            RequestDispatcher view = request.getRequestDispatcher("/manterCorrida.jsp");
            view.forward(request, response);

        } catch (ServletException ex) {
        } catch (IOException ex) {
        } catch (ClassNotFoundException ex) {
        }
    }

    public void confirmarExcluir(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("hiddenIdCorrida"));
        String nomeCorrida = request.getParameter("txtNomeCorrida");
        int maxPessoa = Integer.parseInt(request.getParameter("txtMaxPessoaCorrida"));
        String horario = request.getParameter("txtHorarioCorrida");
        String data = request.getParameter("txtDataCorrida");
        String banner = request.getParameter("txtBannerCorrida");
        String rua = request.getParameter("txtRuaCorrida");
        String cep = request.getParameter("txtCepCorrida");
        String numero = request.getParameter("txtNumeroCorrida");
        String cidade = request.getParameter("txtCidadeCorrida");
        String estado = request.getParameter("txtEstadoCorrida");
        String bairro = request.getParameter("txtBairroCorrida");
        String descricao = request.getParameter("txtDescricaoCorrida");
        String edicao = request.getParameter("hiddenEdicao");
        boolean ativo = Boolean.parseBoolean(request.getParameter("txtAtivoCorrida"));
        String dataInicioRetiradaKit = request.getParameter("txtDataInicioRetiradaKit");
        String dataFinalRetiradaKit = request.getParameter("txtDataFinalRetiradaKit");

        HttpSession session = request.getSession(true);
        Organizador organizador = (Organizador) session.getAttribute("organizador");

        try {

            Corrida corrida = new Corrida(id, nomeCorrida, maxPessoa, horario, data,
                    banner, rua, cep, numero, cidade, estado, bairro, descricao, edicao, ativo, dataInicioRetiradaKit, dataFinalRetiradaKit, organizador);
            corrida.excluir();
            RequestDispatcher view = request.getRequestDispatcher("PesquisaCorridaController");
            view.forward(request, response);
        } catch (IOException ex) {
        } catch (SQLException ex) {
        } catch (ClassNotFoundException ex) {
        } catch (ServletException ex) {

        }
    }

    public void prepararEditar(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setAttribute("operacao", "Editar");
            request.setAttribute("organizadores", Organizador.obterOrganizadores());

            int id = Integer.parseInt(request.getParameter("id"));
            Corrida corrida = Corrida.obterCorrida(id);
            request.setAttribute("percursos", Percurso.obterPercursosCorrida(id));
            request.setAttribute("kits", Kit.obterKitsCorrida(id));
            request.setAttribute("lotes", Lote.obterLotes(id));
            request.setAttribute("corrida", corrida);
            RequestDispatcher view = request.getRequestDispatcher("/manterCorrida.jsp");
            view.forward(request, response);

        } catch (ServletException ex) {
        } catch (IOException ex) {
        } catch (ClassNotFoundException ex) {
        }
    }

    public void confirmarEditar(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("hiddenIdCorrida"));
        String nome = request.getParameter("txtNomeCorrida");
        int maxPessoas = Integer.parseInt(request.getParameter("txtMaxPessoaCorrida"));
        String horario = request.getParameter("txtHorarioCorrida");
        String data = request.getParameter("txtDataCorrida");
//        String banner = request.getParameter("txtBannerCorrida");
        String rua = request.getParameter("txtRuaCorrida");
        String cep = request.getParameter("txtCepCorrida");
        String numero = request.getParameter("txtNumeroCorrida");
        String cidade = request.getParameter("txtCidadeCorrida");
        String estado = request.getParameter("txtEstadoCorrida");
        String bairro = request.getParameter("txtBairroCorrida");
        String descricao = request.getParameter("txtDescricaoCorrida");
        String edicao = request.getParameter("hiddenEdicao");
        boolean ativo = Boolean.parseBoolean(request.getParameter("txtAtivoCorrida"));
        String dataInicioRetiradaKit = request.getParameter("txtDataInicioRetiradaKit");
        String dataFinalRetiradaKit = request.getParameter("txtDataFinalRetiradaKit");

        HttpSession session = request.getSession(true);
        Organizador organizador = (Organizador) session.getAttribute("organizador");

        try {
            Corrida corrida = new Corrida(id, nome, maxPessoas, horario, data,
                    "", rua, cep, numero, cidade, estado, bairro, descricao, edicao, ativo, dataInicioRetiradaKit, dataFinalRetiradaKit, organizador);
            corrida.alterar();
            RequestDispatcher view = request.getRequestDispatcher("PesquisaCorridaController");
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
