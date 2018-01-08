/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Calendar;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author rafael
 */
@WebServlet("/upload")
public class UploaderController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public UploaderController() {
        super();
    }

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        /*Obtem o caminho relatorio da pasta img*/
        String path = request.getServletContext().getRealPath("imagesUpload/kit") + File.separator;

        File files = new File(path);
        response.setContentType("image/jpeg");

        /*Mostra o arquivo que está na pasta img onde foi realizado o upload*/
        for (String file : files.list()) {
            File f = new File(path + file);
            BufferedImage bi = ImageIO.read(f);
            OutputStream out = response.getOutputStream();
            ImageIO.write(bi, "jpg", out);
            out.close();
        }
    }

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        /*Identifica se o formulario é do tipo multipart/form-data*/
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                /*Faz o parse do request*/
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

                /*Escreve a o arquivo na pasta img*/
                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {
                        Calendar hoje = Calendar.getInstance();
                        String fileName = "IMG-" + hoje.get(Calendar.YEAR) + "-" + (hoje.get(Calendar.MONTH) + 1) + "-" + hoje.get(Calendar.DAY_OF_MONTH) + "_" + hoje.get(Calendar.HOUR_OF_DAY) + "-" + hoje.get(Calendar.MINUTE) + "-" + hoje.get(Calendar.SECOND) + "_" + hoje.get(Calendar.MILLISECOND);
                        request.setAttribute("caminhoRelativo", request.getServletContext().getRealPath("imagesUpload/kit") + File.separator + fileName);
                        item.write(new File(request.getServletContext().getRealPath("imagesUpload/kit") + File.separator + fileName));
                    }
                }

                request.setAttribute("message", "Arquivo carregado com sucesso");
            } catch (Exception ex) {
                request.setAttribute("message", "Upload de arquivo falhou devido a " + ex);
            }

        } else {
            request.setAttribute("message", "Desculpe este Servlet lida apenas com pedido de upload de arquivos");
        }

        request.getRequestDispatcher("/upload.jsp").forward(request, response);
    }

}
