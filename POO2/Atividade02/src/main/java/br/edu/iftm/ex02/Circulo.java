package br.edu.iftm.ex02;

public class Circulo {
    private int raio;

    public Circulo() {
    }

    public Circulo(int raio) {
        this.raio = raio;
    }

    public double area(){
        return  Math.PI * Math.pow(raio,2);
    }

    public double circunferencia(){
        return 2 * Math.PI * this.raio;
    }

    public int getRaio() {
        return raio;
    }

    public void setRaio(int raio) {
        this.raio = raio;
    }

    @Override
    public String toString() {
        return "Area: " + area() + " Circuferencia: "+circunferencia();
    }
}
