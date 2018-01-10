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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
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
import modelo.Organizador;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author rafael
 */

@MultipartConfig
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
//        String nome = request.getParameter("txtNomeKit");
//        String descricao = request.getParameter("txtDescricaoKit");
//        String imagem = request.getParameter("fileImagemKit");
//        String tipoChip = request.getParameter("optTipoChip");
        
        int corridaId = Integer.parseInt(request.getParameter("hiddenIdCorrida"));
        Double preco = Double.parseDouble(request.getParameter("precoKit"));
        String nome = request.getParameter("nomeKit");
        String descricao = request.getParameter("descricaoKit");
        String tipoChip = request.getParameter("optTipoChip");
        
        try {
            HttpSession session = request.getSession(true);
            Organizador organizador = (Organizador) session.getAttribute("organizador");

            ArrayList<String> arrayImagemKit = uploadFiles(request, response);
            
            String imagem = null;
            
            if(arrayImagemKit.isEmpty()) {
                imagem = "imagesUpload/kit/sem-imagem.gif";
            } else {
                imagem = arrayImagemKit.get(0);
            }

            Kit kit = new Kit(nome, descricao, imagem, tipoChip, preco, organizador);
            Corrida corrida = Corrida.obterCorrida(corridaId);
            kit.gravar();
            kit = Kit.obterUltimoKitOrganizador(organizador.getId());
            kit.gravarKitCorrida(corrida);
            RequestDispatcher view = request.getRequestDispatcher("PesquisaCorridaController");
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
        String imagem = request.getParameter("fileImagemKit");
        String tipoChip = request.getParameter("optTipoChip");

        HttpSession session = request.getSession(true);
        Organizador organizador = (Organizador) session.getAttribute("organizador");

        Kit kit = new Kit(id, descricao, nome, imagem, tipoChip, organizador);
        try {
            kit.excluir();
            RequestDispatcher view = request.getRequestDispatcher("PesquisaCorridaController");
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

    public ArrayList uploadFiles(HttpServletRequest request, HttpServletResponse response) {
        /*Identifica se o formulario é do tipo multipart/form-data*/

        ArrayList files = new ArrayList();

        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                /*Faz o parse do request*/
                List<Part> fileParts = request.getParts().stream().filter(part -> "imagemKitBD".equals(part.getName())).collect(Collectors.toList());

                for (Part filePart : fileParts) {
                    Calendar hoje = Calendar.getInstance();
                    String fileName = "IMG-" + hoje.get(Calendar.YEAR) + "-" + (hoje.get(Calendar.MONTH) + 1) + "-" + hoje.get(Calendar.DAY_OF_MONTH) + "_" + hoje.get(Calendar.HOUR_OF_DAY) + "-" + hoje.get(Calendar.MINUTE) + "-" + hoje.get(Calendar.SECOND) + "_" + hoje.get(Calendar.MILLISECOND);
                    String path = "imagesUpload/kit";
                    File uploadPath = new File(request.getServletContext().getRealPath(path));
                    File file = new File(uploadPath, fileName);
                    try (InputStream input = filePart.getInputStream()) {
                        Files.copy(input, file.toPath());
                    }

                    files.add(path + File.separator + fileName);
                }
                request.setAttribute("message", "Arquivo carregado com sucesso");
            } catch (Exception ex) {
                request.setAttribute("message", "Upload de arquivo falhou devido a " + ex);
            }
        } else {
            request.setAttribute("message", "Desculpe este Servlet lida apenas com pedido de upload de arquivos");
        }
        return files;
    }

    private void confirmarEditar(HttpServletRequest request, HttpServletResponse response) {
        int corridaId = Integer.parseInt(request.getParameter("hiddenIdCorrida"));
        int id = Integer.parseInt(request.getParameter("hiddenIdKit"));
        Double preco = Double.parseDouble(request.getParameter("precoKit"));
        String nome = request.getParameter("nomeKit");
        String descricao = request.getParameter("descricaoKit");
        String tipoChip = request.getParameter("optTipoChip");

        try {
            HttpSession session = request.getSession(true);
            Organizador organizador = (Organizador) session.getAttribute("organizador");

            ArrayList<String> arrayImagemKit = uploadFiles(request, response);
            
            String imagem = null;
            
            if(arrayImagemKit.isEmpty()) {
                Kit kitTemp = Kit.obterKit(id);
                imagem = kitTemp.getImagem();
            } else {
                imagem = arrayImagemKit.get(0);
            }

            Kit kit = new Kit(id, nome, descricao, imagem, tipoChip, preco, organizador);
            kit.alterarKitCorrida(corridaId);
            RequestDispatcher view = request.getRequestDispatcher("PesquisaCorridaController");
            view.forward(request, response);
        } catch (IOException ex) {
        } catch (SQLException ex) {
        } catch (ClassNotFoundException ex) {
        } catch (ServletException ex) {
        }
    }

}
