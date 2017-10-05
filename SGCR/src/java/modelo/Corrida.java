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
public class Corrida {
    private int id;
    private String nomeCorrida;
    private int maxPessoas;
    private String horarioInicio;
    private String horarioFinal;
    private String banner;
    private String cep;
    private String rua;
    private String bairro;
    private String numero;
    private String cidade;
    private String descricao;
    private String regulamento;
    private int organizadoresId;

    public Corrida() {
    }

    public Corrida(int id, String nomeCorrida, int maxPessoas, String horarioInicio, String horarioFinal, String banner, String cep, String rua, String bairro, String numero, String cidade, String descricao, String regulamento, int organizadoresId) {
        this.id = id;
        this.nomeCorrida = nomeCorrida;
        this.maxPessoas = maxPessoas;
        this.horarioInicio = horarioInicio;
        this.horarioFinal = horarioFinal;
        this.banner = banner;
        this.cep = cep;
        this.rua = rua;
        this.bairro = bairro;
        this.numero = numero;
        this.cidade = cidade;
        this.descricao = descricao;
        this.regulamento = regulamento;
        this.organizadoresId = organizadoresId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNomeCorrida() {
        return nomeCorrida;
    }

    public void setNomeCorrida(String nomeCorrida) {
        this.nomeCorrida = nomeCorrida;
    }

    public int getMaxPessoas() {
        return maxPessoas;
    }

    public void setMaxPessoas(int maxPessoas) {
        this.maxPessoas = maxPessoas;
    }

    public String getHorarioInicio() {
        return horarioInicio;
    }

    public void setHorarioInicio(String horarioInicio) {
        this.horarioInicio = horarioInicio;
    }

    public String getHorarioFinal() {
        return horarioFinal;
    }

    public void setHorarioFinal(String horarioFinal) {
        this.horarioFinal = horarioFinal;
    }

    public String getBanner() {
        return banner;
    }

    public void setBanner(String banner) {
        this.banner = banner;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getRegulamento() {
        return regulamento;
    }

    public void setRegulamento(String regulamento) {
        this.regulamento = regulamento;
    }

    public int getOrganizadoresId() {
        return organizadoresId;
    }

    public void setOrganizadoresId(int organizadoresId) {
        this.organizadoresId = organizadoresId;
    } 
    
}
