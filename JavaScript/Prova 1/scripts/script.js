const json = ["./data/geladeira.json","./data/celular.json"]
var dados = []

const start = () => {
    getProducts()

    count = 0
    setInterval(() => {
        if(count >= dados.length) count = 0
        renderProduct(dados[count])
        count ++
    }, 1000);
}

const change = () => {
    getProducts()
}

const renderProduct = (product) => {
    document.getElementById("slides").innerHTML = `
    <p>
        <h2>${product.marca}</h2>
        <p>${product.modelo}</p>
        <p>${product.valor}</p>
        <img src='${product.img}' width="200px" height="200px"/>
    </p>`;
}

const getProducts = async () => {
    dados = []
    opt = document.getElementById("opt").value
    await fetch(json[opt])
    .then(response => response.json())
    .then(data => {
        data.forEach(element => {
            dados.push(element)
        });
    })
    .catch(error => console.log(error))
}