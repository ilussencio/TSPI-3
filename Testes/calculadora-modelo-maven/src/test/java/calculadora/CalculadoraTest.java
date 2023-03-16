package calculadora;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestTemplate;

import static org.junit.jupiter.api.Assertions.*;

class CalculadoraTest {
    @Test
    public void testarSomaDoisInteirosSucesso(){
        Calculadora calculadora = new Calculadora();
        int entradaNumeroUm = 10;
        int entradaNumeroDois = 10;
        int saidaEsperado = 20;
        int saidaObtioda = calculadora.somar(entradaNumeroUm,entradaNumeroDois);
        //Assign - Validar o resultado obtido
        Assertions.assertEquals(saidaEsperado,saidaObtioda);
    }


    @Test
    void testarSubtrairDoisInteirosSucesso() {
        Calculadora calculadora = new Calculadora();
        int entradaNumeroUm = 10;
        int entradaNumeroDois = 10;
        int saidaEsperado = 0;
        int saidaObtioda = calculadora.subtrair(entradaNumeroUm,entradaNumeroDois);
        //Assign - Validar o resultado obtido
        Assertions.assertEquals(saidaEsperado,saidaObtioda);
    }

    @Test
    void testarMultiplicarDoisInteirosSucesso() {
        Calculadora calculadora = new Calculadora();
        int entradaNumeroUm = 10;
        int entradaNumeroDois = 10;
        int saidaEsperado = 100;
        int saidaObtioda = calculadora.multiplicar(entradaNumeroUm,entradaNumeroDois);
        //Assign - Validar o resultado obtido
        Assertions.assertEquals(saidaEsperado,saidaObtioda);
    }

    @Test
    void testarDividirDoisInteirosSucesso() throws Exception{
        Calculadora calculadora = new Calculadora();
        int entradaNumeroUm = 10;
        int entradaNumeroDois = 2;
        int saidaEsperado = 5;
        int saidaObtioda = calculadora.dividir(entradaNumeroUm,entradaNumeroDois);
        //Assign - Validar o resultado obtido
        Assertions.assertEquals(saidaEsperado,saidaObtioda);
    }

    @Test
    void testarDividirPorZeroSucesso() throws Exception{
        Calculadora calculadora = new Calculadora();
        int entradaNumeroUm = 10;
        int entradaNumeroDois = 0;
        int saidaEsperado = 0;
        //int saidaObtioda = calculadora.dividir(entradaNumeroUm,entradaNumeroDois);

        Assertions.assertThrows(
                Exception.class,
                () -> calculadora.dividir(entradaNumeroUm,entradaNumeroDois));
        //Assign - Validar o resultado obtido
        //Assertions.assertEquals(saidaEsperado,saidaObtioda);
    }
}