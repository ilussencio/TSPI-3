package org.iftm.abs.ex11;

public abstract class Conta {
    private double saldo;

    public Conta(double saldo) {
        this.saldo = saldo;
    }

    public double getSaldo() {
        return saldo;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }

    public double sacar(double valor){

        if(valor <= saldo)
            saldo -= valor;

        return saldo;
    }
}
