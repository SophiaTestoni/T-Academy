function verificar(){
let mes = document.getElementById("mes").value;
let dia = document.getElementById("dia").value;
let resultado = "Informe uma data válida";

if(mes > 12 && dia > 31 || mes < 1 && dia < 1){
    resultado;

}else if(mes == 3 && dia >=21 || mes == 4 && dia <=19){
    resultado = ("Áries");
    document.getElementById("foto").innerHTML="<img src='imagem/aries.png'width=40%>";

}else if(mes == 4 && dia >=21 || mes == 5 && dia  <=20){
    resultado = ("Touro");
    document.getElementById("foto").innerHTML="<img src='imagem/taurus.png'width=40%>";

}else if(mes == 5 && dia >=21 || mes == 6 && dia <=20){
    resultado = ("Gêmeos");
    document.getElementById("foto").innerHTML="<img src='imagem/gemini.png'width=40%>";

}else if(mes == 6 && dia >=21 || mes == 7 && dia <=22){
    resultado = ("Câncer");
    document.getElementById("foto").innerHTML="<img src='imagem/cancer.png'width=40%>";

}else if(mes == 7 && dia >=23 || mes == 8 && dia <=22){
    resultado = ("Leão");
    document.getElementById("foto").innerHTML="<img src='imagem/leo.png'width=40%>";

}else if(mes == 8 && dia >=23 || mes == 9 && dia <=22){
    resultado = ("Virgem");
    document.getElementById("foto").innerHTML="<img src='imagem/virgo.png'width=40%>";

}else if(mes == 9 && dia >=23 || mes == 10 && dia <= 22){
    resultado = ("Libra");
    document.getElementById("foto").innerHTML="<img src='imagem/libra.png'width=40%>";

}else if(mes == 10 && dia >=23 || mes == 11 && dia <=21){
    resultado = ("Escorpião");
    document.getElementById("foto").innerHTML="<img src='imagem/scorpio.png'width=40%>";

}else if(mes == 11 && dia >=22 || mes == 12 && dia <=21){
    resultado = ("Sagitário");
    document.getElementById("foto").innerHTML="<img src='imagem/sagittarius.png'width=40%>";

}else if(mes == 12 && dia >=22 || mes == 1 && dia <=20){
    resultado = ("Capricórnio");
    document.getElementById("foto").innerHTML="<img src='imagem/capricorn.png'width=40%>";

}else if(mes == 1 && dia >=21 || mes == 2 && dia <=19){
    resultado = ("Aquário");
    document.getElementById("foto").innerHTML="<img src='imagem/aquarius.png'width=40%>";

}else if(mes == 2 && dia >=19 || mes == 3 && dia <=20){
    resultado = ("Peixes");
    document.getElementById("foto").innerHTML="<img src='imagem/pisces.png'width=40%>";

}
document.getElementById("mensagem").innerHTML = resultado;
}