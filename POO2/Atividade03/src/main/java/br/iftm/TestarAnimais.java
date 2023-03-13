package br.iftm;

public class TestarAnimais {
    public static void main(String[] aleluias){
        Mamifero camelo = new Mamifero("Camelo",150,4,"amarelo","terra",2,"Capim e agua");
        Peixe tubarao = new Peixe("Tubarão", 300,0,"Cinzento","Mar",(float) 1.5,"Barbatanas e cauda");
        Mamifero ursocanada = new Mamifero("Urso do canadá", 180, 4, "Vermelho","Terra",(float) 0.5,"Mel");

        camelo.dadosMamifero();
        tubarao.dadosPeixe();
        ursocanada.dadosMamifero();
    }
}
