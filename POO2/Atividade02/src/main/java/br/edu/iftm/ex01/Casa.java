package br.edu.iftm.ex01;

public class Casa {
    Pessoa proprietario;
    Endereco endereco;

    public Casa() {
    }

    public Casa(Pessoa proprietario, Endereco endereco) {
        this.proprietario = proprietario;
        this.endereco = endereco;
    }

    public Pessoa getProprietario() {
        return proprietario;
    }

    public void setProprietario(Pessoa proprietario) {
        this.proprietario = proprietario;
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }
}
