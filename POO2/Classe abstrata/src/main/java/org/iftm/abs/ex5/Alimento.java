package org.iftm.abs.ex5;

public class Alimento extends Produto{
    public Alimento(double preco) {
        super(preco);
    }

    @Override
    public double calcularDesconto(){
        return this.getPreco() * 0.1;
    }
}
