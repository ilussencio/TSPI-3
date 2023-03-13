package br.iftm;

public class Peixe extends Animal{
    private String caracteristicas;


    public Peixe(String nome, float comprimento, int numeroPatas, String cor, String ambiente, float velocidadeMedia, String caracteristicas) {
        super(nome, comprimento, numeroPatas, cor, ambiente, velocidadeMedia);
        this.caracteristicas = caracteristicas;
    }

    public void dadosPeixe(){
        System.out.println("Nome: "+ this.getNome() + "\n" +
                "comprimento: "+ this.getComprimento() + "\n" +
                "numeroPatas: "+ this.getNumeroPatas() + "\n" +
                "cor: "+ this.getCor() + "\n" +
                "ambiente: "+ this.getAmbiente() + "\n" +
                "velocidadeMedia: "+ this.getVelocidadeMedia() + "\n" +
                "caracteristicas: "+ this.getCaracteristicas() + "\n");
    }

    public String getCaracteristicas() {
        return caracteristicas;
    }

    public void setCaracteristicas(String caracteristicas) {
        this.caracteristicas = caracteristicas;
    }
}
