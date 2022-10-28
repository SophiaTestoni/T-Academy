
function enviar(){
    let numero1 = document.getElementById("numero1");
    let numero2 = document.getElementById("numero2");

    media = (parseFloat(numero1.value) + parseFloat(numero2.value))/2;
    // alert(media);
    document.getElementById("retorno").innerHTML = media
 }



