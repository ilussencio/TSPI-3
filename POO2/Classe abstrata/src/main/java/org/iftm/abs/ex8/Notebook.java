package org.iftm.abs.ex8;

public class Notebook extends Computador{

    public Notebook(boolean status) {
        super(status);
    }

    @Override
    public void iniciar() {
        super.setStatus(true);
        System.out.println("Lindo o notebook");
    }
}
