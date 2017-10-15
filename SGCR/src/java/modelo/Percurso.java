/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import dao.PercursoDAO;
import java.util.List;

/**
 *
 * @author RAJ
 */
public class Percurso {

    private int id;
    private String imagemPercurso;
    private Double quilometragem;
    private Corrida corrida;

    private int corridasId;

    public Percurso(int id, String imagemPercurso, Double quilometragem, Corrida corrida) {
        this.id = id;
        this.imagemPercurso = imagemPercurso;
        this.quilometragem = quilometragem;
        this.corrida = corrida;
    } 

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImagemPercurso() {
        return imagemPercurso;
    }

    public void setImagemPercurso(String imagemPercurso) {
        this.imagemPercurso = imagemPercurso;
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

    public int getCorridasId() {
        return corridasId;
    }

    public void setCorridasId(int corridasId) {
        this.corridasId = corridasId;
    }
    
    public static List<Percurso> obterPercursos() throws ClassNotFoundException {
        return PercursoDAO.obterPercursos();
    }

}
