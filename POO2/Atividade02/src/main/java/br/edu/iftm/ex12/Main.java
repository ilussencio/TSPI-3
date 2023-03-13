package br.edu.iftm.ex12;

public class Main {
    public static void main(String[] cibele){
        Calculo calculo = new Calculo();

        calculo.credito(50);
        calculo.debito(20);
        System.out.println("Saldo = "+calculo.getSaldo());
    }
}
