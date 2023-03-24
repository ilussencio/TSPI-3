package org.example;

public class Main {
    public static void main(String[] biblioteca) {
        Livro livro1 = new Livro("O Senhor dos Anéis", "J. R. R. Tolkien", true, 1954, 1170, "Allen & Unwin");
        Livro livro2 = new Livro("O Hobbit", "J. R. R. Tolkien", true, 1937, 310, "Allen & Unwin");
        Livro livro3 = new Livro("O Silmarillion", "J. R. R. Tolkien", true, 1977, 488, "Allen & Unwin");

        Revista revista1 = new Revista("Superinteressante", "Abril", true, 1, "Abril");
        Revista revista2 = new Revista("National Geographic", "Abril", true, 1, "Abril");
        Revista revista3 = new Revista("Veja", "Abril", true, 1, "Abril");

        DVD dvd1 = new DVD("Star Wars: Episódio IV - Uma Nova Esperança", "George Lucas", true, "Ficção científica", 121.0);
        DVD dvd2 = new DVD("Star Wars: Episódio V - O Império Contra-Ataca", "George Lucas", true, "Ficção científica", 124.0);
        DVD dvd3 = new DVD("Star Wars: Episódio VI - O Retorno de Jedi", "George Lucas", true, "Ficção científica", 131.0);

        Usuario usuario1 = new Usuario("João", "joao@gmail.com", "Rua A, 123");
        Usuario usuario2 = new Usuario("Maria", "maria@gmail.com", "Rua B, 456");
        Usuario usuario3 = new Usuario("Pedro", "pedro@gmail.com", "Rua C, 789");

        usuario1.emprestarItem(livro1);
        usuario1.emprestarItem(revista1);
        usuario1.emprestarItem(dvd1);
        usuario1.imprimirItensEmprestados();

        usuario2.emprestarItem(livro2);
        usuario2.emprestarItem(revista2);
        usuario2.emprestarItem(dvd2);
        usuario2.imprimirItensEmprestados();

        usuario3.emprestarItem(livro3);
        usuario3.emprestarItem(revista3);
        usuario3.emprestarItem(dvd3);
        usuario3.imprimirItensEmprestados();

        usuario1.devolverItem(livro1);
        usuario1.devolverItem(revista1);
        usuario1.imprimirItensEmprestados();

        usuario2.devolverItem(revista1);
        usuario2.devolverItem(dvd2);
        usuario2.imprimirItensEmprestados();

        usuario3.devolverItem(livro3);
        usuario3.devolverItem(dvd3);
        usuario3.imprimirItensEmprestados();
    }
}