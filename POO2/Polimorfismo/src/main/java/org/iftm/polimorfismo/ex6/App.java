package org.iftm.polimorfismo.ex6;

public class App {
    public static void main(String[] args){
        Poupanca poupanca = new Poupanca(1000, true);
        poupanca.verificarConta();

        ContaCorrent contaCorrent = new ContaCorrent(1000, true);
        contaCorrent.verificarConta();
    }
}
