package org.iftm.abs.ex8;

public class Desktop extends Computador{
    public Desktop(boolean status) {
        super(status);
    }

    @Override
    public void iniciar() {
        super.setStatus(true);
        System.out.println("Iniciando Desktop!");
    }
}
