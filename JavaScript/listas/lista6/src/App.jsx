import Card from './components/Card'
function App() {

  return (
    <div className="home">
      <div className="geral">
        <Card
          img={'foto01.jpg'}
          nome={'Ana Bruck'}
          frase1={'"Eu recomendo a Leticia, pois o atendimento dela fez todo a diferença"'}
          frase2={'"A Escolha de um imovel, no nosso caso uma casa, não e uma tarefa fácil, A escolha de um profissional qualificado poupou o noss tempo e nos ajudou a encontrar o que realmente queriamos. A Leticia foi muito atenciosa e nos ajudou a encontrar o imovel que queriamos."'}
        />

        <Card
          img={'foto02.jpg'}
          nome={'Wilton Filho'}
          frase1={'"Eu recomendo a Leticia"'}
          frase2={'"A Escolha de um imovel, no nosso caso uma casa, não e uma tarefa fácil, A escolha de um profissional qualificado poupou o noss tempo e nos ajudou a encontrar o que realmente queriamos."'}
        />

        <Card
          img={'foto04.jpg'}
          nome={'Pedro Henrique'}
          frase1={'"Eu recomendo a Leticia, pois o atendimento dela fez todo a diferença"'}
          frase2={'" A Leticia foi muito atenciosa e nos ajudou a encontrar o imovel que queriamos."'}
        />
      </div>
    </div>
  )
}

export default App
