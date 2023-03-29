package org.iftm.polimorfismo.ex1;

public class App {
    public static void main(String[] args){
        Pessoa p1 = new Pessoa("João");
        p1.apresentar();
        Aluno a1 = new Aluno("Maria", "Engenharia");
        a1.apresentar();
        Professor prof1 = new Professor("José", "Engenharia de Software");
        prof1.apresentar();
    }
}
