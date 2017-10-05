
package modelo;


/**
 *
 * @author RAJ
 */
public class UsuarioComum extends Usuario{

    private String nomeComepleto;
    private String dataNascimento;
    private boolean sexo;
    private String cpf;
    private String cep;
    private String rua;
    private String bairro;
    private String complemento;
    private String numero;
    private String cidade;
    private boolean statusAtivo;
    private String telefone;
    private String celular;

    public UsuarioComum(String nomeComepleto, String dataNascimento, boolean sexo, String cpf, String cep, String rua, String bairro, String complemento, String numero, String cidade, boolean statusAtivo, String telefone, String celular, int id, String email, String senha) {
        super(id, email, senha);
        this.nomeComepleto = nomeComepleto;
        this.dataNascimento = dataNascimento;
        this.sexo = sexo;
        this.cpf = cpf;
        this.cep = cep;
        this.rua = rua;
        this.bairro = bairro;
        this.complemento = complemento;
        this.numero = numero;
        this.cidade = cidade;
        this.statusAtivo = statusAtivo;
        this.telefone = telefone;
        this.celular = celular;
    }

    
    public String getNomeComepleto() {
        return nomeComepleto;
    }

    public void setNomeComepleto(String nomeComepleto) {
        this.nomeComepleto = nomeComepleto;
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

    public boolean isStatusAtivo() {
        return statusAtivo;
    }

    public void setStatusAtivo(boolean statusAtivo) {
        this.statusAtivo = statusAtivo;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getCeulular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    /*
    public boolean cadastrar(){
    public boolean 
    public boolean 
    public boolean 
    public boolean 
    
     */
}
