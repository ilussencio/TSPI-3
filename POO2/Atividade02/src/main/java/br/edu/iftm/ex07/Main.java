package br.edu.iftm.ex07;

public class Main {
    public static void main(String[] rodolfo){
        Funcionario f1 = new Funcionario("João", 20, 3.5);
        Funcionario f2 = new Funcionario("Mateus", 40, 5.5);
        Funcionario f3 = new Funcionario("Lucas", 40, 13.5);

        System.out.println(f1.toString());
        System.out.println(f2.toString());
        System.out.println(f3.toString());
    }
}
