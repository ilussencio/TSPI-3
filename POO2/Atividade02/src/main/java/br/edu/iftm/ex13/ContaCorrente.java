package br.edu.iftm.ex13;

public class ContaCorrente {
    private String nome;
    private String senha;
    private double saldo = 0;

    public ContaCorrente() {
    }

    public void cadastrarSenha(String senha){
        this.senha = senha;
    }
    public void alterarSenha(String senhaAntiga, String novaSenha){
        if(senhaAntiga.equals(this.senha)){
            System.out.println("Senha alterada com sucesso!");
            this.senha = novaSenha;

        }else{
            System.out.println("Senha antiga invalida!");
        }
    }
    public void credito(double valor, String senha){
        if(this.senha.equals(senha)) {
            this.saldo += valor;
            System.out.println("CREDITO: +" + valor);
        }
        else {
            System.out.println("Senha incorreta!");
        }
    }

    public void debito(double valor, String senha){
        if(this.senha.equals(senha)){
            this.saldo -= valor;
            System.out.println("DEBITO: -"+valor);
        }else {
            System.out.println("Senha incorreta!");
        }
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getSaldo() {
        return saldo;
    }
}
