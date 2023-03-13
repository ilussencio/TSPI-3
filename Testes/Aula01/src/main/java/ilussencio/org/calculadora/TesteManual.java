package ilussencio.org.calculadora;

public class TesteManual {
    public static void main(String[] IFTM){
        Calculadora calc = new Calculadora();
        int entrada1 = 5;
        int entrada2 = 10;
        int resultadoEsperado = 15;

        int resultadoObtido = calc.somar(entrada1,entrada2);
        if(resultadoObtido == resultadoEsperado) {
            System.out.println("Passou no teste!");
        }else{
            System.out.println("Não passou no teste!");
        }

    }


}
