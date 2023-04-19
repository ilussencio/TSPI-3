package org.iftm.polimorfismo.ex3;

public class App {
    public static void main(String[] args){
        Veiculo veiculo = new Veiculo(0);
        veiculo.acelerar();
        System.out.println(veiculo.getVelocidade());

        Moto moto = new Moto(0);
        moto.acelerar();
        System.out.println(moto.getVelocidade());

        Carro carro = new Carro(0);
        carro.acelerar();
        System.out.println(carro.getVelocidade());
    }
}
