package org.example;

public class Revista extends Item{
    private int numero;
    private String editora;

    public Revista(String titulo, String autor, boolean emprestado, int numero, String editora) {
        super(titulo, autor, emprestado);
        this.numero = numero;
        this.editora = editora;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getEditora() {
        return editora;
    }

    public void setEditora(String editora) {
        this.editora = editora;
    }

    @Override
    public String toString() {
        return "Revista{" +
                "numero=" + numero +
                ", editora='" + editora + '\'' +
                '}';
    }
}
