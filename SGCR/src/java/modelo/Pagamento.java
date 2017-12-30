/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author rafael
 */
public abstract class Pagamento {

    private int id;
    private Inscricao inscricao;
    private Corrida inscricaoCorrida;
    private int inscricaoId;
    private int inscricaoCorridaId;

    Pagamento(int id, Inscricao inscricao, Corrida inscricaoCorrida) {
        this.id = id;
        this.inscricao = inscricao;
        this.inscricaoCorrida = inscricaoCorrida;
    }

    Pagamento(Inscricao inscricao, Corrida inscricaoCorrida) {
        this.inscricao = inscricao;
        this.inscricaoCorrida = inscricaoCorrida;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Inscricao getInscricao() {
        return inscricao;
    }

    public void setInscricao(Inscricao inscricao) {
        this.inscricao = inscricao;
    }

    public int getInscricaoId() {
        return inscricaoId;
    }

    public void setInscricaoId(int inscricaoId) {
        this.inscricaoId = inscricaoId;
    }

    public int getInscricaoCorridaId() {
        return inscricaoCorridaId;
    }

    public void setInscricaoCorridaId(int inscricaoCorridaId) {
        this.inscricaoCorridaId = inscricaoCorridaId;
    }

    public Corrida getInscricaoCorrida() {
        return inscricaoCorrida;
    }

    public void setInscricaoCorrida(Corrida inscricaoCorrida) {
        this.inscricaoCorrida = inscricaoCorrida;
    }
    
    public abstract void confirmarPagamento();
}
