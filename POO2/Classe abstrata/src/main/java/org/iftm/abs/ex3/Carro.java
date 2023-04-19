package org.iftm.abs.ex3;

public class Carro extends Veiculo {
    public Carro(int velocidade) {
        super(velocidade);
    }

    @Override
    public void acelerar() {
        this.setVelocidade(this.getVelocidade() + 20);
    }
}

