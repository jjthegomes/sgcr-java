/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Atleta;

/**
 *
 * @author straby
 */
public class ManterAtletaController extends HttpServlet {

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

    public void prepararIncluir(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setAttribute("operacao", "Incluir");
            //Para chave estrangeira
            //request.setAttribute("atletas", Administrador.obterAdministradores());
            RequestDispatcher view
                    = request.getRequestDispatcher("/manterAtleta.jsp");
            view.forward(request, response);
        } catch (ServletException ex) {
        } catch (IOException ex) {
        }
        //catch(ClassNotFoundException ex){ }
    }

    public void confirmarIncluir(HttpServletRequest request, HttpServletResponse response) {
        String apelido = request.getParameter("txtApelidoAtleta");
        String tamanhoCamisa = request.getParameter("optTamanhoCamisa");

        String nome = request.getParameter("txtNomeAtleta");
        String dataNascimento = request.getParameter("txtDataNascimentoAtleta");
        String sexo = request.getParameter("txtSexoAtleta");
        String cpf = request.getParameter("txtCpfAtleta");
        String cep = request.getParameter("txtCepAtleta");
        String rua = request.getParameter("txtRuaAtleta");
        String bairro = request.getParameter("txtBairroAtleta");
        String complemento = request.getParameter("txtComplementodAtleta");
        String numero = request.getParameter("txtNumeroAtleta");
        String cidade = request.getParameter("txtCidadeAtleta");
        String estado = request.getParameter("txtEstadoAtleta");
        String telefone = request.getParameter("txtTelefoneAtleta");
        String celular = request.getParameter("txtCelularAtleta");

        int id = Integer.parseInt(request.getParameter("txtIdAtleta"));
        String email = request.getParameter("txtEmailAtleta");
        String senha = request.getParameter("txtSenhaAtleta");

        try {

            Atleta atleta = new Atleta(apelido, tamanhoCamisa, nome, dataNascimento,
                    sexo, cpf, cep, rua, bairro, complemento, numero, cidade, estado,
                    telefone, celular, id, email, senha);
            atleta.gravar();
            RequestDispatcher view
                    = request.getRequestDispatcher("PesquisaAtletaController");
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
            //Para chave estrangeira
            //request.setAttribute("administradores", Administrador.obterAdministradores());
            int id = Integer.parseInt(request.getParameter("id"));

            Atleta atleta = Atleta.obterAtleta(id);
            request.setAttribute("atleta", atleta);

            RequestDispatcher view = request.getRequestDispatcher("/manterAtleta.jsp");
            view.forward(request, response);
        } catch (ServletException ex) {
        } catch (IOException ex) {
        } catch (ClassNotFoundException ex) {
        }
    }

    public void confirmarExcluir(HttpServletRequest request, HttpServletResponse response) {
        String apelido = request.getParameter("txtApelidoAtleta");
        String tamanhoCamisa = request.getParameter("optTamanhoCamisa");

        String nome = request.getParameter("txtNomeAtleta");
        String dataNascimento = request.getParameter("txtDataNascimentoAtleta");
        String sexo = request.getParameter("txtSexoAtleta");
        String cpf = request.getParameter("txtCpfAtleta");
        String cep = request.getParameter("txtCepAtleta");
        String rua = request.getParameter("txtRuaAtleta");
        String bairro = request.getParameter("txtBairroAtleta");
        String complemento = request.getParameter("txtComplementodAtleta");
        String numero = request.getParameter("txtNumeroAtleta");
        String cidade = request.getParameter("txtCidadeAtleta");
        String estado = request.getParameter("txtEstadoAtleta");
        String telefone = request.getParameter("txtTelefoneAtleta");
        String celular = request.getParameter("txtCelularAtleta");

        int id = Integer.parseInt(request.getParameter("txtIdAtleta"));
        String email = request.getParameter("txtEmailAtleta");
        String senha = request.getParameter("txtSenhaAtleta");

        Atleta atleta = new Atleta(apelido, tamanhoCamisa, nome, dataNascimento,
                sexo, cpf, cep, rua, bairro, complemento, numero, cidade, estado,
                telefone, celular, id, email, senha);
        try {
            atleta.excluir();
            RequestDispatcher view = request.getRequestDispatcher("PesquisaAtletaController");
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
            //Para chave estrangeira
            //request.setAttribute("administradores", Administrador.obterAdministradores());
            int id = Integer.parseInt(request.getParameter("id"));

            Atleta atleta = Atleta.obterAtleta(id);
            request.setAttribute("atleta", atleta);

            RequestDispatcher view = request.getRequestDispatcher("/manterAtleta.jsp");
            view.forward(request, response);
        } catch (ServletException ex) {
        } catch (IOException ex) {
        } catch (ClassNotFoundException ex) {
        }
    }

    public void confirmarEditar(HttpServletRequest request, HttpServletResponse response) {
        String apelido = request.getParameter("txtApelidoAtleta");
        String tamanhoCamisa = request.getParameter("optTamanhoCamisa");

        String nome = request.getParameter("txtNomeAtleta");
        String dataNascimento = request.getParameter("txtDataNascimentoAtleta");
        String sexo = request.getParameter("txtSexoAtleta");
        String cpf = request.getParameter("txtCpfAtleta");
        String cep = request.getParameter("txtCepAtleta");
        String rua = request.getParameter("txtRuaAtleta");
        String bairro = request.getParameter("txtBairroAtleta");
        String complemento = request.getParameter("txtComplementodAtleta");
        String numero = request.getParameter("txtNumeroAtleta");
        String cidade = request.getParameter("txtCidadeAtleta");
        String estado = request.getParameter("txtEstadoAtleta");
        String telefone = request.getParameter("txtTelefoneAtleta");
        String celular = request.getParameter("txtCelularAtleta");

        int id = Integer.parseInt(request.getParameter("txtIdAtleta"));
        String email = request.getParameter("txtEmailAtleta");
        String senha = request.getParameter("txtSenhaAtleta");

        Atleta atleta = new Atleta(apelido, tamanhoCamisa, nome, dataNascimento,
                sexo, cpf, cep, rua, bairro, complemento, numero, cidade, estado,
                telefone, celular, id, email, senha);
        try {
            atleta.alterar();
            RequestDispatcher view = request.getRequestDispatcher("PesquisaAtletaController");
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
