package org.iftm.polimorfismo.ex9;

public class Quadrado extends Forma{
    public Quadrado(double l) {
        super(l);
    }

    @Override
    public double calcularArea() {
        return super.getL() * super.getL();
    }
}
