package org.iftm.polimorfismo.ex4;

public class Assistente extends Funcionario{

    public Assistente(double salario, double horasTrabalhadas) {
        super(salario, horasTrabalhadas);
    }

    @Override
    public double calcularSalario(){
        return super.calcularSalario() + 100;
    }
}
