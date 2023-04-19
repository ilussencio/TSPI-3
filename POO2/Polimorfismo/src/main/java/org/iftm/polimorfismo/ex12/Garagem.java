package org.iftm.polimorfismo.ex12;

public class Garagem {
    public Garagem() {
    }

    public void estacionar(Veiculo veiculo){
        veiculo.ligar();
        veiculo.desligar();
    }
}
