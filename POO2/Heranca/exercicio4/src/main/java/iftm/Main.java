package iftm;

public class Main {
    public static void main(String[] args) {
        Conta conta = new Conta(0);
        Poupanca poupanca = new Poupanca(0, 10);
        conta.depositar(10000);
        conta.sacar(15000);
        poupanca.depositar(15000);
        poupanca.sacar(20000);
        System.out.println("Saldo conta: " + conta.getSaldo());
        System.out.println("Saldo poupança: " + poupanca.getSaldo());
        }
}