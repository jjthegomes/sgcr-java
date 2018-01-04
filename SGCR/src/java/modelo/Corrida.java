/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import dao.CorridaDAO;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author RAJ
 */
public class Corrida {

    private int id;
    private String nome;
    private int maxPessoa;
    private String horario;
    private String data;
    private String banner;
    private String logradouro;
    private String cep;
    private String numero;
    private String cidade;
    private String estado;
    private String bairro;
    private String descricao;
    private String regulamento;
    private String edicao;
    private boolean ativo;
    private Organizador organizador;

    private int organizadorId;

    public Corrida() {

    }

    public Corrida(int id, String nome, int maxPessoa, String horario, String data, String banner, String logradouro,
            String cep, String numero, String cidade, String estado, String bairro, String descricao, String regulamento,
            String edicao, boolean ativo, Organizador organizador) {
        this.id = id;
        this.nome = nome;
        this.maxPessoa = maxPessoa;
        this.horario = horario;
        this.data = data;
        this.banner = banner;
        this.logradouro = logradouro;
        this.cep = cep;
        this.numero = numero;
        this.cidade = cidade;
        this.estado = estado;
        this.bairro = bairro;
        this.descricao = descricao;
        this.regulamento = regulamento;
        this.organizador = organizador;
        this.edicao = edicao;
        this.ativo = ativo;
    }

    public Corrida(String nome, int maxPessoa, String horario, String data, String banner, String logradouro,
            String cep, String numero, String cidade, String estado, String bairro, String descricao, String regulamento,
            String edicao, boolean ativo, Organizador organizador) {
        this.nome = nome;
        this.maxPessoa = maxPessoa;
        this.horario = horario;
        this.data = data;
        this.banner = banner;
        this.logradouro = logradouro;
        this.cep = cep;
        this.numero = numero;
        this.cidade = cidade;
        this.estado = estado;
        this.bairro = bairro;
        this.descricao = descricao;
        this.regulamento = regulamento;
        this.organizador = organizador;
        this.edicao = edicao;
        this.ativo = ativo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getMaxPessoa() {
        return maxPessoa;
    }

    public void setMaxPessoa(int maxPessoa) {
        this.maxPessoa = maxPessoa;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getBanner() {
        return banner;
    }

    public void setBanner(String banner) {
        this.banner = banner;
    }

    public String getLogradouro() {
        return logradouro;
    }

    public void setLogradouro(String logradouro) {
        this.logradouro = logradouro;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
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

    public String getEdicao() {
        return edicao;
    }

    public void setEdicao(String edicao) {
        this.edicao = edicao;
    }

    public boolean isAtivo() {
        return ativo;
    }

    public void setAtivo(boolean ativo) {
        this.ativo = ativo;
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

    public static List<Corrida> obterCorridas() throws ClassNotFoundException {
        return CorridaDAO.obterCorridas();
    }

    public static List<Corrida> obterCorridas(int organizadorId) throws ClassNotFoundException {
        return CorridaDAO.obterCorridas(organizadorId);
    }

    public void gravar() throws ClassNotFoundException, SQLException {
        CorridaDAO.gravar(this);
    }

    public void alterar() throws ClassNotFoundException, SQLException {
        CorridaDAO.alterar(this);
    }

    public void excluir() throws ClassNotFoundException, SQLException {
        CorridaDAO.excluir(this);
    }

    public static Corrida obterCorrida(int id) throws ClassNotFoundException {
        return CorridaDAO.obterCorrida(id);
    }

    public static List<Corrida> buscaCorridas(String nome) throws ClassNotFoundException {
        return CorridaDAO.buscaCorridas(nome);
    }

    public static Corrida obterUltimaCorrida(int id) throws ClassNotFoundException {
        return CorridaDAO.obterUltimaCorrida(id);
    }

    public static Corrida obterUltimaCorridaOrganizador(int organizadorId) throws ClassNotFoundException {
        return CorridaDAO.obterUltimaCorridaOrganizador(organizadorId);
    }
}
