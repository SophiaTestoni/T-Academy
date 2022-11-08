//Vetor de produtos
let vetor = [];

// Ao carregar a página HTML
window.onload = function(){

    //Armazenar os produtos no vetor
    obterArtistas();
    

}


// ---------------------------------------   ARTISTAS --------------------------------------------------

// Obter todos os artistas
function obterArtistas(){
    fetch("http://localhost:8080/artistas")
    .then(retornoArtistas => retornoArtistas.json())
    .then(artistas => vetor = artistas)
    .then(() => listarArtistas());

    // O erro de CORS foi corrigido no back-end com o @CrossOrigin(origins = "*" no ArtistaControle
    //Desse jeito com o * ele aceita entrar em qlqr porta (incluindo a 8080).
}

// Listar os produtos do vetor na tabela
function listarArtistas(){
    // Obter elemento de tabela (id)
    let tabela = document.getElementById("tabelaArtistas");

    // Limpar conteúdos da tabela
    tabela.innerHTML = "";

    // Laço de repetição
    for (let i = 0; i < vetor.length; i++) {

        //criar linha
        let linha = tabela.insertRow(-1);

        //Criar colunas
        let colunaCodigo = linha.insertCell(0);
        let colunaNome = linha.insertCell(1);
        let colunaSelecionar = linha.insertCell(2);

        // Dados das colunas
        colunaCodigo.innerText = vetor[i].id;
        colunaNome.innerText = vetor[i].artista;
        colunaSelecionar.innerHTML = `<button class="btn btn-success">Selecionar</button>`;
    }

}

//cadastrar artistas
function cadastrar() {
    // capturar o nome do produto e valor
    let artista = document.getElementById("artista").value;

    // validacoes
    if(artista.length < 5) {
        alert("O nome do artista deve possuir pelo menos 5 caracteres.");
    } else {
        let obj = {
            "artista": artista
        }

        fetch("http://localhost:8080/artistas", {
            method: "POST",
            headers: {
                "accept":"application/json",
                "content-type":"application/json"
            },
            body: JSON.stringify(obj)
        })
        .then(retornoArtistas => retornoArtistas.json())
        .then(retornoConvertido => {
            vetor.push(retornoConvertido);
            listarArtistas();
        });
    }
}