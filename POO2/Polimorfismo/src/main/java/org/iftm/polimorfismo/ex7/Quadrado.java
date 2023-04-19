package org.iftm.polimorfismo.ex7;

public class Quadrado extends Figura{
    public Quadrado(double l) {
        super(l);
    }

    @Override
    public double calcularArea() {
        return super.getL() * super.getL();
    }
}
