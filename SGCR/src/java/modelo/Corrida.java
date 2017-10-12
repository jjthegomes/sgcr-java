/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import dao.CorridaDAO;
import java.util.List;

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
    private String rua;
    private String cep;
    private String cidade;
    private String estado;
    private String bairro;
    private String descricao;
    private String regulamento;
    private Organizador organizador;
    
    private int organizadoresId;

    public Corrida() {
        
    }

    public Corrida(int id, String nomeCorrida, int maxPessoas, String horarioInicio, String horarioFinal, String banner, String rua, String cep, String cidade, String estado, String bairro, String descricao, String regulamento, Organizador organizador) {
        this.id = id;
        this.nomeCorrida = nomeCorrida;
        this.maxPessoas = maxPessoas;
        this.horarioInicio = horarioInicio;
        this.horarioFinal = horarioFinal;
        this.banner = banner;
        this.rua = rua;
        this.cep = cep;
        this.cidade = cidade;
        this.estado = estado;
        this.bairro = bairro;
        this.descricao = descricao;
        this.regulamento = regulamento;
        this.organizador = organizador;
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

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
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

    public Organizador getOrganizador() {
        return organizador;
    }

    public void setOrganizador(Organizador organizador) {
        this.organizador = organizador;
    }
      

    public int getOrganizadoresId() {
        return organizadoresId;
    }

    public void setOrganizadoresId(int organizadoresId) {
        this.organizadoresId = organizadoresId;
    } 
    
        public static List<Corrida> obterCorridas() throws ClassNotFoundException{
        return CorridaDAO.obterCorridas();
    }
}
