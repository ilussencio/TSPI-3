package br.edu.iftm.ex05;

import java.util.Scanner;

public class Main {
    public static void main(String[] iftm){
        Scanner scanner = new Scanner(System.in);
        String pl1 = scanner.next();
        String pl2 = scanner.next();

        System.out.println((pl1.equals(pl2))?"Igual!":"Diferente!");
    }
}
