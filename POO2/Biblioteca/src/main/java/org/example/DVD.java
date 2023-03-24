package org.example;

public class DVD extends Item{
    private String genero;
    private double duracao;

    public DVD(String titulo, String autor, boolean emprestado, String genero, double duracao) {
        super(titulo, autor, emprestado);
        this.genero = genero;
        this.duracao = duracao;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public double getDuracao() {
        return duracao;
    }

    public void setDuracao(double duracao) {
        this.duracao = duracao;
    }

    @Override
    public String toString() {
        return "DVD{" +
                "genero='" + genero + '\'' +
                ", duracao=" + duracao +
                '}';
    }
}
