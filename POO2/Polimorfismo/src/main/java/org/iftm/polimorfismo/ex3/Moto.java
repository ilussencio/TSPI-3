package org.iftm.polimorfismo.ex3;

public class Moto extends Veiculo {
    public Moto(int velocidade) {
        super(velocidade);
    }

    @Override
    public void acelerar() {
        this.setVelocidade(this.getVelocidade() + 15);
    }
}

