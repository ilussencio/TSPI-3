import Paragrafo from "./Paragrafo"

export default function App() {
  function showPaineis(total){
    const vet = [];
    for(let i = 0; i < total; i++)
      vet.push(<Paragrafo />);
    
    return vet;
  }
  return (
    <div>
      {showPaineis(5000)}
    </div>
  )
}