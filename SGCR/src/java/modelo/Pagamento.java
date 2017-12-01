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
    private int inscricaoId;
    
    Pagamento(int id, Inscricao inscricao) {
        this.id = id;
        this.inscricao = inscricao;
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
    
    public abstract void confirmarPagamento();
}
