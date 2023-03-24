package iftm;

public class Programa {
    public static void main(String[] args){
        Pessoa pessoa1 = new Pessoa("João","Medeiros");
        Funcionario pessoa2 = new Funcionario("Leonardo","Messias", 100, 1000.0);
        Professor pessoa3 = new Professor("Antônio","Silva", 200, 1500.0);

        System.out.println(pessoa1.getNomeCompleto());
        System.out.println(pessoa2.getNomeCompleto());
        System.out.println(pessoa3.getNomeCompleto());

        System.out.println(pessoa2.getSalarioPrimeiraParcela());
        System.out.println(pessoa2.getSalarioSegundaParcela());
        System.out.println(pessoa3.getSalarioPrimeiraParcela());
        System.out.println(pessoa3.getSalarioSegundaParcela());

    }
}
