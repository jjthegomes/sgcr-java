
package modelo;


/**
 *
 * @author RAJ
 */
public abstract class UsuarioComum extends Usuario{

    private String nome;
    private String dataNascimento;
    private boolean sexo;
    private String cpf;
    private String cep;
    private String rua;
    private String bairro;
    private String complemento;
    private String numero;
    private String cidade;
    private String estado;
    private String telefone;
    private String celular;

    public UsuarioComum(String nome, String dataNascimento, boolean sexo, String cpf, String cep, String rua, String bairro, String complemento, String numero, String cidade, String estado, String telefone, String celular, int id, String email, String senha) {
        super(id, email, senha);
        this.nome = nome;
        this.dataNascimento = dataNascimento;
        this.sexo = sexo;
        this.cpf = cpf;
        this.cep = cep;
        this.rua = rua;
        this.bairro = bairro;
        this.complemento = complemento;
        this.numero = numero;
        this.cidade = cidade;
        this.estado = estado;
        this.telefone = telefone;
        this.celular = celular;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(String dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public boolean isSexo() {
        return sexo;
    }

    public void setSexo(boolean sexo) {
        this.sexo = sexo;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
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

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
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

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

 
}
