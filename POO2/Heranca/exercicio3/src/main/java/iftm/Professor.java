package iftm;

public class Professor extends Funcionario {

    public Professor(String nome, String sobrenome, int matricula, double salario) {
        super(nome, sobrenome, matricula, salario);
    }
    @Override
    public double getSalarioPrimeiraParcela(){
       return this.getSalario();
   }
   @Override
   public double getSalarioSegundaParcela(){
       return 0.0;
   }


}
