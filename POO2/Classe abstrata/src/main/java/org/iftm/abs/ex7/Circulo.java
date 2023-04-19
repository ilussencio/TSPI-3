package org.iftm.abs.ex7;

public class Circulo extends Figura{
    public Circulo(double l) {
        super(l);
    }

    @Override
    public double calcularArea() {
        return Math.PI * (super.getL() * super.getL());
    }
}
