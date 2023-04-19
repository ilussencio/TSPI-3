package org.iftm.polimorfismo.ex4;

public class App {
    public static void main(String[] args){
        Funcionario funcionario = new Funcionario(1000, 8);
        System.out.println(funcionario.calcularSalario());

        Assistente assistente = new Assistente(1000, 8);
        System.out.println(assistente.calcularSalario());

        Gerente gerente = new Gerente(1000, 8);
        System.out.println(gerente.calcularSalario());
    }
}
