function acao(codigo){
    // escolha
    switch(parseInt(codigo)){
        case 1:
            document.getElementById("texto").innerText = "Blumenau é uma cidade legal de morar";
        break;
        case 2:
            document.getElementById("texto").innerText = "Florianópolis tem praias bonitas";
        break;
        case 3:
            document.getElementById("texto").innerText = "Balneário Camboriú tem prédios altos";
        break;

        default:
        document.getElementById("texto").innerText = "";
    }
}