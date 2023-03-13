package br.iftm;

public class Mamifero extends Animal{
    private String alimento;

    public Mamifero(String nome, float comprimento, int numeroPatas, String cor, String ambiente, float velocidadeMedia, String alimento) {
        super(nome, comprimento, numeroPatas, cor, ambiente, velocidadeMedia);
        this.alimento = alimento;
    }

    public void dadosMamifero(){
        System.out.println("Nome: "+ this.getNome() + "\n" +
                "comprimento: "+ this.getComprimento() + "\n" +
                "numeroPatas: "+ this.getNumeroPatas() + "\n" +
                "cor: "+ this.getCor() + "\n" +
                "ambiente: "+ this.getAmbiente() + "\n" +
                "velocidadeMedia: "+ this.getVelocidadeMedia() + "\n" +
                "alimento: "+ this.getAlimento() + "\n");
    }

    public String getAlimento() {
        return alimento;
    }

    public void setAlimento(String alimento) {
        this.alimento = alimento;
    }
}
