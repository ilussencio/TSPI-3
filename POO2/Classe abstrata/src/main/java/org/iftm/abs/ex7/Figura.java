package org.iftm.abs.ex7;

public abstract class Figura {
    private double l;

    public Figura(double l) {
        this.l = l;
    }

    public double getL() {
        return l;
    }

    public void setL(double l) {
        this.l = l;
    }

    public double calcularArea(){
        return l;
    }
}
