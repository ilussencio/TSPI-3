package org.example;

public class Main {
    public static void main(String[] args) {
        EquipamentoSonoro eq = new EquipamentoSonoro(false, 10, true);
        System.out.println(eq.getLigado());
        eq.Liga();
        System.out.println(eq.getLigado());
        System.out.println(eq.getVolume());

    }
}