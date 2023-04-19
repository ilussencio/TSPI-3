package org.iftm.abs.ex7;

public class App {
    public static void main(String[] args){
        Circulo circulo = new Circulo(5);
        System.out.println(circulo.calcularArea());

        Quadrado quadrado = new Quadrado(5);
        System.out.println(quadrado.calcularArea());

        Retangulo retangulo = new Retangulo(5,10);
        System.out.println(retangulo.calcularArea());
    }
}
