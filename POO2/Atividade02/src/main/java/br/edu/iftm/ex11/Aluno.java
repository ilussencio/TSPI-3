package br.edu.iftm.ex11;

public class Aluno {
    private String nome;
    private double n1;
    private double n2;

    public Aluno() {
    }

    public Aluno(String nome, double n1, double n2) {
        this.nome = nome;
        this.n1 = n1;
        this.n2 = n2;
    }

    public double media(){
        return (n1+n2) / 2;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getN1() {
        return n1;
    }

    public void setN1(double n1) {
        this.n1 = n1;
    }

    public double getN2() {
        return n2;
    }

    public void setN2(double n2) {
        this.n2 = n2;
    }

    @Override
    public String toString() {
        return "Aluno: "+nome+ " | Media: "+media();
    }
}
