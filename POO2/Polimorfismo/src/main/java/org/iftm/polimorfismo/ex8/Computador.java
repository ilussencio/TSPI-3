package org.iftm.polimorfismo.ex8;

public class Computador {

    private boolean status;

    public Computador(boolean status) {
        this.status = status;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public void iniciar(){
        this.status = true;
        System.out.println("Computador Ligado");
    }
}
