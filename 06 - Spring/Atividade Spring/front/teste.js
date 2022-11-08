//Vetor de produtos
let vetor = [];

// Ao carregar a página HTML
window.onload = function(){

    //Armazenar os produtos no vetor
  
    obterMusicas();

}

// ---------------------------------------   MUSICAS   --------------------------------------------------

// Obter todos as musicas
function obterMusicas(){
    fetch("http://localhost:8080/musicas")
    .then(retornoMusicas => retornoMusicas.json())
    .then(musicas => vetor = musicas)
    .then(() => listarMusicas());

    // O erro de CORS foi corrigido no back-end com o @CrossOrigin(origins = "*" no ProdutoControle
    //Desse jeito com o * ele aceita entrar em qlqr porta (incluindo a 8080).
}

// Listar os produtos do vetor na tabela
function listarMusicas(){
    // Obter elemento de tabela (id)
    let tabela = document.getElementById("tabelaMusicas");

    // Limpar conteúdos da tabela
    tabela.innerHTML = "";

    // Laço de repetição
    for (let i = 0; i < vetor.length; i++) {

        //criar linha
        let linha = tabela.insertRow(-1);

        //Criar colunas
        let colunaCodigo = linha.insertCell(0);
        let colunaNome = linha.insertCell(1);
        let colunaLink = linha.insertCell(2);
        let colunaMusica = linha.insertCell(3);
        let colunaSelecionar = linha.insertCell(4);

        // Dados das colunas
        colunaCodigo.innerText = vetor[i].id;
        colunaNome.innerText = vetor[i].musica;
        colunaLink.innerText = vetor[i].link;
        colunaMusica.innerText = vetor[i].am;
        colunaSelecionar.innerHTML = `<button class="btn btn-success">Selecionar</button>`;
    }

}
