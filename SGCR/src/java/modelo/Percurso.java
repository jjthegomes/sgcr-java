/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import dao.PercursoDAO;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.List;

/**
 *
 * @author RAJ
 */
public class Percurso {

    private int id;
    private String imagem;
    private String descricao;
    private Double quilometragem;
    private Organizador organizador;

    private int organizadorId;

    public Percurso(int id, String imagem, Double quilometragem, String descricao, Organizador organizador) {
        this.id = id;
        this.imagem = imagem;
        this.quilometragem = quilometragem;
        this.descricao = descricao;
        this.organizador = organizador;
    }

    public Percurso(String imagem, Double quilometragem, String descricao, Organizador organizador) {
        this.imagem = imagem;
        this.quilometragem = quilometragem;
        this.descricao = descricao;
        this.organizador = organizador;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Double getQuilometragem() {
        return quilometragem;
    }
    
    public String getQuilometragemFormatada() {
        DecimalFormat df = new DecimalFormat("0.##");
        String precoFormatado = df.format(this.quilometragem);
        return precoFormatado;
    }

    public void setQuilometragem(Double quilometragem) {
        this.quilometragem = quilometragem;
    }

    public Organizador getOrganizador() {
        return organizador;
    }

    public void setOrganizador(Organizador organizador) {
        this.organizador = organizador;
    }

    public int getOrganizadorId() {
        return organizadorId;
    }

    public void setOrganizadorId(int organizadorId) {
        this.organizadorId = organizadorId;
    }

    public static List<Percurso> obterPercursos() throws ClassNotFoundException {
        return PercursoDAO.obterPercursos();
    }

    public static List<Percurso> obterPercursos(int organizadorId) throws ClassNotFoundException {
        return PercursoDAO.obterPercursos(organizadorId);
    }

    public void gravar() throws SQLException, ClassNotFoundException {
        PercursoDAO.gravar(this);
    }
    
    public void gravarPercursoCorrida(Corrida corrida) throws SQLException, ClassNotFoundException {
        PercursoDAO.gravarPercursoCorrida(this, corrida);
    }

    public void alterar() throws SQLException, ClassNotFoundException {
        PercursoDAO.alterar(this);
    }

    public void excluir() throws SQLException, ClassNotFoundException {
        PercursoDAO.excluir(this);
    }

    public static Percurso obterPercurso(int id) throws ClassNotFoundException {
        return PercursoDAO.obterPercurso(id);
    }

    public static List<Percurso> obterPercursosCorrida(int corridaId) throws ClassNotFoundException {
        return PercursoDAO.obterPercursosCorrida(corridaId);
    }
    
    public static Percurso obterUltimoPercursoOrganizador(int organizadorId) throws ClassNotFoundException {
        return PercursoDAO.obterUltimoPercursoOrganizador(organizadorId);
    }
}
