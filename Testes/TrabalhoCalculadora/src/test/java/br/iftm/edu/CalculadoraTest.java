package br.iftm.edu;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

class CalculadoraTest {
    @Test
    public void testConstrutorVazio(){
        Calculadora calc = new Calculadora();
        Assertions.assertEquals(0,calc.getMemoria());
    }

    @Test
    public void testeParametro(){
        Calculadora calc = new Calculadora(10);
        Assertions.assertEquals(10,calc.getMemoria());
    }
    @Test
    public void testeParametroMenosDez(){
        Calculadora calc = new Calculadora(-10);
        Assertions.assertEquals(-10,calc.getMemoria());
    }

    @Test
    public void testeParametroDez(){
        Calculadora calc = new Calculadora(10);
        Assertions.assertEquals(10,calc.getMemoria());
    }

    @Test
    public void testeSomar(){
        Calculadora calc = new Calculadora(20);
        calc.somar(-10);
        Assertions.assertEquals(10,calc.getMemoria());
    }

    @Test
    public void testeSubtrair(){
        Calculadora calc = new Calculadora(20);
        calc.subtrair(10);
        Assertions.assertEquals(10,calc.getMemoria());
    }

    @Test
    public void testeMultiplicar(){
        Calculadora calc = new Calculadora(10);
        calc.multiplicar(2);
        Assertions.assertEquals(20,calc.getMemoria());
    }

    @Test
    public void testeDividirPorZero() throws Exception{
        Calculadora calc = new Calculadora(10);

        Assertions.assertThrows(
                Exception.class,
                () -> calc.dividir(0));
    }

    @Test
    public void testeDividirPorPositivo() throws Exception {
        Calculadora calc = new Calculadora(10);
        calc.dividir(2);
        Assertions.assertEquals(5,calc.getMemoria());
    }

    @Test
    public void testeExponencialUm() throws Exception{
        Calculadora calc = new Calculadora(2);
        calc.exponenciar(1);
        Assertions.assertEquals(2,calc.getMemoria());
    }

    @Test
    public void testeExponencialDez() throws Exception{
        Calculadora calc = new Calculadora(2);
        calc.exponenciar(10);
        Assertions.assertEquals(1024,calc.getMemoria());
    }

    @Test
    public void testeExponencialMaiorQueDez() throws Exception{
        Calculadora calc = new Calculadora(2);
        Assertions.assertThrows(
                Exception.class,
                () -> calc.exponenciar(11));
    }

    @Test
    public void testeZerarMemoria() throws Exception{
        Calculadora calc = new Calculadora(2);
        calc.zerarMemoria();
        Assertions.assertEquals(0,calc.getMemoria());
    }




}





















