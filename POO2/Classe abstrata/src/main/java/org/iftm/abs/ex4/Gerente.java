package org.iftm.abs.ex4;

public class Gerente extends Funcionario{

    public Gerente(double salario, double horasTrabalhadas) {
        super(salario, horasTrabalhadas);
    }

    @Override
    public double calcularSalario(){
        return super.calcularSalario() + 200;
    }
}

