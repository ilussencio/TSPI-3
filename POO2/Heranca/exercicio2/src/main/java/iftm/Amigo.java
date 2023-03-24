package iftm;

public class Amigo extends Pessoa{
    private String diaDoAniversario;

    public Amigo(String nome, String sexo, int idade, String diaDoAniversario) {
        super(nome, sexo, idade);
        this.diaDoAniversario = diaDoAniversario;
    }

    public String getDiaDoAniversario() {
        return diaDoAniversario;
    }

    public void setDiaDoAniversario(String diaDoAniversario) {
        this.diaDoAniversario = diaDoAniversario;
    }
}
