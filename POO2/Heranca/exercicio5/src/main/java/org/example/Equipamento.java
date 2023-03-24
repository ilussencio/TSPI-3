package org.example;

public class Equipamento {
    private Boolean ligado;

    public Equipamento(Boolean ligado) {
        this.ligado = ligado;
    }

    public Boolean getLigado() {
        return ligado;
    }

    public void setLigado(Boolean ligado) {
        this.ligado = ligado;
    }

    public void Liga(){
        this.ligado = true;
    }

    public void Desliga(){
        this.ligado = false;
    }


}
