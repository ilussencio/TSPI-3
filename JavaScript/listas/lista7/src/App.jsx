import Card from './components/Card'
function App() {

  const avaliacoes = [
    {
      img: 'foto01.jpg',
      nome: 'Ana Bruck',
      frase1: '"Eu recomendo a Leticia, pois o atendimento dela fez todo a diferença"',
      frase2: '"A Escolha de um imovel, no nosso caso uma casa, não e uma tarefa fácil, A escolha de um profissional qualificado poupou o noss tempo e nos ajudou a encontrar o que realmente queriamos. A Leticia foi muito atenciosa e nos ajudou a encontrar o imovel que queriamos."'
    },
    {
      img: 'foto02.jpg',
      nome: 'Wilton Filho',
      frase1: '"Eu recomendo a Leticia"',
      frase2: '"A Escolha de um imovel, no nosso caso uma casa, não e uma tarefa fácil, A escolha de um profissional qualificado poupou o noss tempo e nos ajudou a encontrar o que realmente queriamos."'
    },
    {
      img: 'foto03.jpg',
      nome: 'Patricia Santiago',
      frase1: '"Eu recomendo a Leticia, pois o atendimento dela fez todo a diferença"',
      frase2: '" A Leticia foi muito atenciosa e nos ajudou a encontrar o imovel que queriamos."'
    },
    {
      img: 'foto04.jpg',
      nome: 'Pedro Henrique',
      frase1: '"Eu recomendo a Leticia, pois o atendimento dela fez todo a diferença"',
      frase2: '" A Leticia foi muito atenciosa e nos ajudou a encontrar o imovel que queriamos."'
    },
    {
      img: 'foto05.jpg',
      nome: 'Maria Eduarda',
      frase1: '"Eu recomendo a Leticia, pois o atendimento dela fez todo a diferença"',
      frase2: '" A Leticia foi muito atenciosa e nos ajudou a encontrar o imovel que queriamos."'
    }
  ]
  const renderAvaliacoes = () => {
    let dados = []
    for(let i = 0; i < 3; i++){
      dados.push(avaliacoes.splice( Math.floor(Math.random() * (avaliacoes.length - 0) + 0), 1)[0])
    }
    return dados.map((item) => <Card img={item.img} nome={item.nome} frase1={item.frase1} frase2={item.frase2} />)
  }

  return (
    <div className="home">
      <div className="geral">
        {renderAvaliacoes()}
      </div>
    </div>
  )
}

export default App
