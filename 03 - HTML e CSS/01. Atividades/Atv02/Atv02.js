function enviar(){

    let avista = document.getElementById("avista");
    let precoTotal = document.getElementById("precoTotal")

    if(precoTotal >= 100 && avista){
    precoTotal = (parseFloat(precoTotal.value) * 0.9);
    }

    document.getElementById("retorno").innerHTML = precoTotal
}

