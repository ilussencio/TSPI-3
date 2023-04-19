package org.iftm.polimorfismo.ex5;

public class App {
    public static void main(String[] args){
        Produto vestuario = new Vestuario(100);
        System.out.println(vestuario.calcularDesconto());

        Produto eletronico = new Eletronico(100);
        System.out.println(eletronico.calcularDesconto());

        Produto produto = new Produto(100);
        System.out.println(produto.calcularDesconto());
    }
}
