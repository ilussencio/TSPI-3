package br.edu.iftm;

import java.util.Date;

public class Main {
    public static void main(String[] args) {
        Usuario usr1 = new Usuario();
        usr1.setNome("Lucas Ilussencio da silva");
        usr1.setEmail("ilussencio@gmail.com");
        usr1.setTelefone("34123456");

        Usuario usr2 = new Usuario();
        usr2.setNome("Marcos Vinicius");
        usr2.setEmail("marcos.vinicius@gmail.com");
        usr2.setTelefone("34123456");

        Categoria urgente = new Categoria("Urgente","Vermelho");
        Categoria normal = new Categoria("Normal","Verde");

        Tarefa tr1 = new Tarefa();
        tr1.setStatus("Pendente");
        tr1.setRecorrencia("mensal");
        tr1.setDataIncio(new Date("2023/01/01"));
        tr1.setDataFim(new Date("2023/02/01"));
        tr1.setNome("Fazer task 01");
        tr1.setCategoria(urgente);

        Tarefa tr2 = new Tarefa();
        tr2.setStatus("Pendente");
        tr2.setRecorrencia("semanal");
        tr2.setDataIncio(new Date("2023/01/01"));
        tr2.setDataFim(new Date("2023/02/01"));
        tr2.setNome("Fazer task 02");
        tr2.setCategoria(normal);

        usr1.getTarefas().add(tr1);
        usr1.getTarefas().add(tr2);

        usr2.getTarefas().add(tr2);
        usr2.getTarefas().add(tr2);

        System.out.println(usr1);
        System.out.println(usr2);
    }
}