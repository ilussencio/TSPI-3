const getTextServer = () => {
    var xhttp = new XMLHttpRequest();
    //var filename = "db.txt";
    var filename = "user.json";
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            // Typical action to be performed when the document is ready:
            //document.getElementById("textServer").innerHTML = xhttp.responseText;
            //document.getElementById("textServer").innerHTML = xhttp.responseText;
            console.log(JSON.parse(xhttp.responseText).usuario)
        }
    };
    xhttp.open("GET", filename, true);
    xhttp.send();
}