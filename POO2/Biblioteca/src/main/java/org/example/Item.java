package org.example;

public class Item {
    private String titulo;
    private String autor;
    private boolean emprestado;

    public Item() {
    }

    public Item(String titulo, String autor, boolean emprestado) {
        this.titulo = titulo;
        this.autor = autor;
        this.emprestado = emprestado;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public boolean isEmprestado() {
        return emprestado;
    }

    public void setEmprestado(boolean emprestado) {
        this.emprestado = emprestado;
    }

    public void emprestar() {
        this.emprestado = false;
    }

    public void devolver() {
        this.emprestado = true;
    }

    @Override
    public String toString() {
        return "Item{" +
                "titulo='" + titulo + '\'' +
                ", autor='" + autor + '\'' +
                ", emprestado=" + emprestado +
                '}';
    }
}
