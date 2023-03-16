const getTextServer = () => {
    var filename = "user.json"
    let res = fetch(filename)
    .then(response => response.json())
    .then(dados => {
        document.getElementById("textServer").innerHTML = dados.usuario
        document.getElementById("textServer").innerHTML += " "+dados.idade
    })
    .catch(error => console.log(error))
}