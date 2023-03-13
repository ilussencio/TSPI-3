package br.edu.iftm.ex13;

public class Main {
    public static void main(String[] reverse){
        ContaCorrente conta = new ContaCorrente();
        conta.setNome("Lucas Ilussencio da Silva");
        conta.cadastrarSenha("senha123");

        conta.alterarSenha("senha1234","senha12345");
        conta.alterarSenha("senha123","senha12345");
        conta.credito(500,"senha12345");
        conta.debito(25,"senha12345");
        conta.credito(500,"senha1234");
        conta.debito(25,"senha1235");
        System.out.println("Saldo: "+conta.getSaldo());
    }
}
