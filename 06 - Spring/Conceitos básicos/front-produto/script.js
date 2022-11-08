//Vetor de produtos
let vetor = [];

// Ao carregar a página HTML
window.onload = function(){

    //Armazenar os produtos no vetor
    obterProdutos();

  
}

// Obter todos os produtos
function obterProdutos(){
    fetch("http://localhost:8080")
    .then(retorno => retorno.json())
    .then(produtos => vetor = produtos)
    .then(() => listarProdutos());

    // O erro de CORS foi corrigido no back-end com o @CrossOrigin(origins = "*" no ProdutoControle
    //Desse jeito com o * ele aceita entrar em qlqr porta (incluindo a 8080).
}

// Listar os produtos do vetor na tabela
function listarProdutos(){
    // Obter elemento de tabela (id)
    let tabela = document.getElementById("tabela");

    // Limpar conteúdos da tabela
    tabela.innerHTML = "";

    // Laço de repetição
    for (let i = 0; i < vetor.length; i++) {

        //criar linha
        let linha = tabela.insertRow(-1);

        //Criar colunas
        let colunaCodigo = linha.insertCell(0);
        let colunaNome = linha.insertCell(1);
        let colunaValor = linha.insertCell(2);
        let colunaSelecionar = linha.insertCell(3);

        // Dados das colunas
        colunaCodigo.innerText = vetor[i].codigo;
        colunaNome.innerText = vetor[i].nome;
        colunaValor.innerText = vetor[i].valor;
        colunaSelecionar.innerHTML = `<button class="btn btn-success">Selecionar</button>`;
    }

}

