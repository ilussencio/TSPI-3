package iftm;

public class Poupanca extends Conta{
    private int diaRendimento;

    public Poupanca(double saldo, int diaRendimento) {
        super(saldo);
        this.diaRendimento = diaRendimento;
    }

    public int getDiaRendimento() {
        return diaRendimento;
    }

    public void setDiaRendimento(int diaRendimento) {
        this.diaRendimento = diaRendimento;
    }

    @Override
    public void setSaldo(double saldo) {
        if(saldo > 0)
            super.setSaldo(saldo);
    }

    public void sacar(double valor){
        if(valor > 0 && valor <= this.getSaldo())
            super.sacar(valor);
    }
}
