package org.example;

import java.util.ArrayList;
import java.util.List;

public class Usuario {
    private String nome;
    private String email;
    private String endereco;
    private ArrayList<Item> itensEmprestados;

    public Usuario(String nome, String email, String endereco) {
        this.nome = nome;
        this.email = email;
        this.endereco = endereco;
        this.itensEmprestados = new ArrayList<Item>();
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public void emprestarItem(Item item) {
        if (item.isEmprestado()) {
            item.setEmprestado(false);
            itensEmprestados.add(item);
            System.out.println("O item \"" + item.getTitulo() + "\" foi emprestado para " + nome);
        } else {
            System.out.println("O item \"" + item.getTitulo() + "\" não está disponível para empréstimo.");
        }
    }
    public void devolverItem(Item item) {
        if (itensEmprestados.contains(item)) {
            item.setEmprestado(true);
            itensEmprestados.remove(item);
            System.out.println("O item \"" + item.getTitulo() + "\" foi devolvido por " + nome);
        } else {
            System.out.println("O item \"" + item.getTitulo() + "\" não foi emprestado por " + nome);
        }
    }

    public void imprimirItensEmprestados() {
        System.out.println("Itens emprestados por " + nome + ":");
        for (Item item : itensEmprestados) {
            System.out.println("- " + item.getTitulo());
        }
        System.out.println();
    }

    @Override
    public String toString() {
        return "Usuario{" +
                "nome='" + nome + '\'' +
                ", email='" + email + '\'' +
                ", endereco='" + endereco + '\'' +
                ", itensEmprestados=" + itensEmprestados +
                '}';
    }
}
