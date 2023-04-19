package org.iftm.polimorfismo.ex3;

public class Veiculo {
    private int velocidade;

    public Veiculo(int velocidade) {
        this.velocidade = velocidade;
    }

    public int getVelocidade() {
        return velocidade;
    }

    public void setVelocidade(int velocidade) {
        this.velocidade = velocidade;
    }

    public void acelerar(){
        this.velocidade += 10;
    }
}
