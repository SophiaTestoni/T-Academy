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
        colunaMusica.innerText = vetor[i].id_artista;
        colunaSelecionar.innerHTML = `<button onclick="selecionar(${vetor[i].id})" class="btn btn-success">Selecionar</button>`;
    }

}

//cadastrar músias
function cadastrar() {
    let musica = document.getElementById("musica").value;
    let link = document.getElementById("link").value;

    // Validações
    if(musica.length < 2) {
        alert("O nome da música deve possuir pelo menos dois caracteres.");
    } else {
        let obj = {
            "musica": musica,
            "link": link
        }

        fetch("http://localhost:8080/musicas", {
            method: "POST",
            headers: {
                "accept":"application/json",
                "content-type":"application/json"
            },
            body: JSON.stringify(obj)
        })
        .then(retornoMusicas => retornoMusicas.json())
        .then(retornoConvertido => {
            vetor.push(retornoConvertido);
            listarMusicas();
        });
    }
}

function selecionar(id){
    fetch(`http://localhost:8080/musicas/${id}`)
    .then(retornoMusicas => retornoMusicas.json())
    .then(retorno_convertido => {

        // Ocultar o botão de cadastro
        document.getElementById("btnCadastrar").style.display="none";

        // Exibir os botões de alteração e exclusão
        document.getElementById("btnAlterar").style.display = "inline-block";
        document.getElementById("btnRemover").style.display = "inline-block";

        // Preencher os inputs
        document.getElementById("id").value = retorno_convertido.id;
        document.getElementById("musica").value = retorno_convertido.musica;
        document.getElementById("link").value = retorno_convertido.link;
    })
}

function remover() {
    let id = parseInt(document.getElementById("id").value);

    // Requisição na API 
    fetch(`http://localhost:8080/musicas/remover/${id}`, {method:"DELETE"})
    .then(() => {

        //obtendo a posição do vetor referente a musica que será removido
        let posicaoVetor = vetor.findIndex(objLinha => {
            return objLinha.id == id
        });

        // removendo produto do vetor
        vetor.splice(posicaoVetor, 1);

        //atualizando tabela
        listarMusicas();

        // limpando formulário
        formularioPadrao();
    })

}

function alterar() {
    let id = parseInt(document.getElementById("id").value);
    let musica = document.getElementById("musica").value;
    let link = document.getElementById("link").value

    // Validação
    if(musica.length < 2) {
        alert("O nome da musica deve possuir pelo menos dois caracteres.");
    } else {
        let obj = {
            "id":id,
            "musica": musica,
            "link":link
        }

        fetch("http://localhost:8080/musicas/alterarMusica", {
            method: "PUT",
            headers: {
                "accept":"application/json",
                "content-type":"application/json"
            },
            body: JSON.stringify(obj)
        })
        .then(retornoMusicas => retornoMusicas.json())
        .then(retornoConvertido => {

            let posicaoVetor = vetor.findIndex(objLinha => {
                return objLinha.id == id
            });
            vetor[posicaoVetor] = retornoConvertido;

            listarMusicas();
            formularioPadrao();
        });
    }
}

// função para limpar os campos e modificar a visibilidade dos botões
function formularioPadrao() {

    //limpar inputs
    document.getElementById("id").value = "";
    document.getElementById("musica").value = "";
    document.getElementById("link").value = "";

    // visibilidade botões
    document.getElementById("btnCadastrar").style.display = "inline-block";
    document.getElementById("btnAlterar").style.display = "none";
    document.getElementById("btnRemover").style.display = "none";
}

function pesquisarMusica(){
    let musica = document.getElementById("searchbar").value;
    fetch(`http://localhost:8080/musicas/pesquisa/${musica}`)
    .then(retornoMusicas => retornoMusicas.json())
    .then(musicas => vetor = musicas)
    .then(() => listarMusicas());
  
}
