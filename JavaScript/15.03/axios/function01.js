const getTextServer = () => {
    var filename = "user.json"
    axios.get(filename)
    .then((response) => {
        if(response.status == 200){
            document.getElementById("textServer").innerHTML = response.data.usuario
            document.getElementById("textServer").innerHTML += " "+response.data.idade
        }
        
    })
    .catch((error) => console.log(error))
}