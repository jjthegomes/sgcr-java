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
    private Double quilometragem;
    private Corrida corrida;

    private int corridaId;

    public Percurso(int id, String imagem, Double quilometragem, Corrida corrida) {
        this.id = id;
        this.imagem = imagem;
        this.quilometragem = quilometragem;
        this.corrida = corrida;
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

    public Double getQuilometragem() {
        return quilometragem;
    }

    public void setQuilometragem(Double quilometragem) {
        this.quilometragem = quilometragem;
    }

    public Corrida getCorrida() {
        return corrida;
    }

    public void setCorrida(Corrida corrida) {
        this.corrida = corrida;
    }

    public int getCorridaId() {
        return corridaId;
    }

    public void setCorridaId(int corridaId) {
        this.corridaId = corridaId;
    }

    public static List<Percurso> obterPercursos() throws ClassNotFoundException {
        return PercursoDAO.obterPercursos();
    }

    public static List<Percurso> obterPercursos(int corridaId) throws ClassNotFoundException {
        return PercursoDAO.obterPercursos(corridaId);
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
