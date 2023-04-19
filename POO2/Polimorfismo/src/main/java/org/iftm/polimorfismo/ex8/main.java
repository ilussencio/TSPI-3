package org.iftm.polimorfismo.ex8;

public class main {
    public static void main(String[] args){
        Desktop desktop = new Desktop(false);
        desktop.iniciar();

        Notebook notebook = new Notebook(false);
        notebook.iniciar();

        Servidor servidor = new Servidor(false);
        servidor.iniciar();
    }
}