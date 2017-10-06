/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author RAJ
 */
public class Pontuacao {
    private int id;
    private int pontuacao;
    private Corrida corrida;
    private int corridasId;

    public Pontuacao(int id, int pontuacao, Corrida corrida) {
        this.id = id;
        this.pontuacao = pontuacao;
        this.corrida = corrida;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPontuacao() {
        return pontuacao;
    }

    public void setPontuacao(int pontuacao) {
        this.pontuacao = pontuacao;
    }

    public int getCorridasId() {
        return corridasId;
    }

    public void setCorridasId(int corridasId) {
        this.corridasId = corridasId;
    }  
}
