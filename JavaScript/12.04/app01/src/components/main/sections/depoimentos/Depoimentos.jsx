import TituloSection from "../TituloSection";
import AvaliacaoClientes from "./AvaliacaoClientes";


export default function Depoimentos() {

    const avaliacoes = [
        {
            foto: "foto01.jpg",
            nome: "Ana Bruck",
            avaliacao01: "Gostei muito dos pordutos e serviços",
            avaliacao02: "Chamei a empresa para fazer um orçamento e eles me atenderam muito bem",
        },
        {
            foto: "foto02.jpg",
            nome: "Dani Shutz",
            avaliacao01: "Liguei para a empresa e eles me atenderam muito bem",
            avaliacao02: "Ja estou fazendo um orçamento",
        },
        {
            foto: "foto03.jpg",
            nome: "Bia Wolf",
            avaliacao01: "Estou muito satisfeita com os serviços",
            avaliacao02: "A empresa me atendeu muito bem",
        }
    ]

    const render = () => {
        return avaliacoes.map((item) => <AvaliacaoClientes foto={item.foto} nome={item.nome} avaliacao01={item.avaliacao01} avaliacao02={item.avaliacao02} />)
    }

    return (
        <section>
            <TituloSection
                titulo={"Clientes felizes, Novos Amigos"}
                subtitulo={"DEPOIMENTOS DE ALGUNS CLIENTES REAIS"}
            />
            <div className="depoimentos">
                {render()}
            </div>


        </section>

    )
}