package br.edu.iftm.ex10;

public class Main {
    public static void main(String[] esron){
        Pessoa pessoa1 = new Pessoa();
        pessoa1.setNome("Lucas Ilussencio da silva");
        pessoa1.setCpf("12345678912");
        pessoa1.setIdade(25);

        Pessoa pessoa2 = new Pessoa();
        pessoa2.setNome("Esron Ferreira");
        pessoa2.setCpf("12345678912");
        pessoa2.setIdade(32);

        System.out.println(pessoa1.toString());
        System.out.println(pessoa2.toString());
    }
}
