export default function Card(props) {
    return (
        <div className="container">
            <img className="foto" src={"./img/"+props.img} alt="Foto 01" />
            <div className="subContainer">
                <h1 className="title">{props.nome}</h1>
                <p className="frase1">
                    {props.frase1}
                </p>

                <p className="frase2">
                    {props.frase2}
                </p>
            </div>
        </div>
    )
}