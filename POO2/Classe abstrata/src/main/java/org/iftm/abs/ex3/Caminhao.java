package org.iftm.abs.ex3;

public class Caminhao extends Veiculo {
    public Caminhao(int velocidade) {
        super(velocidade);
    }

    @Override
    public void acelerar() {
        this.setVelocidade(this.getVelocidade() + 30);
    }
}
