/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import dao.PercursoDAO;
import java.sql.SQLException;
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

    public Percurso(int id, String imagem, String descricao, Double quilometragem) {
        this.id = id;
        this.imagem = imagem;
        this.descricao = descricao;
        this.quilometragem = quilometragem;
    }

    public Percurso(String imagem, String descricao, Double quilometragem) {
        this.imagem = imagem;
        this.descricao = descricao;
        this.quilometragem = quilometragem;
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

    public void setQuilometragem(Double quilometragem) {
        this.quilometragem = quilometragem;
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

    public void alterar() throws SQLException, ClassNotFoundException {
        PercursoDAO.alterar(this);
    }

    public void excluir() throws SQLException, ClassNotFoundException {
        PercursoDAO.excluir(this);
    }

    public static Percurso obterPercurso(int id) throws ClassNotFoundException {
        return PercursoDAO.obterPercurso(id);
    }
}
