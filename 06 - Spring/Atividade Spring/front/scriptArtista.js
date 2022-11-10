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
        colunaSelecionar.innerHTML = `<button onclick="selecionar(${vetor[i].id})" class="btn btn-success">Selecionar</button>`;
     
    }
}

//cadastrar artistas
function cadastrar() {
    let artista = document.getElementById("artista").value;

    // Validações
    if(artista.length < 2) {
        alert("O nome do artista deve possuir pelo menos dois caracteres.");
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

function selecionar(id){
    fetch(`http://localhost:8080/artistas/${id}`)
    .then(retornoArtistas => retornoArtistas.json())
    .then(retorno_convertido => {

        // Ocultar o botão de cadastro
        document.getElementById("btnCadastrar").style.display="none";

        // Exibir os botões de alteração e exclusão
        document.getElementById("btnAlterar").style.display = "inline-block";
        document.getElementById("btnRemover").style.display = "inline-block";

        // Preencher os inputs
        document.getElementById("id").value = retorno_convertido.id;
        document.getElementById("artista").value = retorno_convertido.artista;
    })
}

function remover() {
    let id = parseInt(document.getElementById("id").value);

    // Requisição na API 
    fetch(`http://localhost:8080/artistas/remover/${id}`, {method:"DELETE"})
    .then(() => {

        //obtendo a posição do vetor referente ao artista que será removido
        let posicaoVetor = vetor.findIndex(objLinha => {
            return objLinha.id == id
        });

        // removendo produto do vetor
        vetor.splice(posicaoVetor, 1);

        //atualizando tabela
        listarArtistas();

        // limpando formulário
        formularioPadrao();
    })

}

//ALTERAR ARTISTA
function alterar() {
    let id = parseInt(document.getElementById("id").value);
    let artista = document.getElementById("artista").value;

    // Validação
    if(id.length < 2) {
        alert("O nome do artista deve possuir pelo menos dois caracteres.");
    } else {
        let obj = {
            "id":id,
            "artista": artista
        }

        fetch("http://localhost:8080/artistas/alterarArtista", {
            method: "PUT",
            headers: {
                "accept":"application/json",
                "content-type":"application/json"
            },
            body: JSON.stringify(obj)
        })
        .then(retornoArtistas => retornoArtistas.json())
        .then(retornoConvertido => {

            let posicaoVetor = vetor.findIndex(objLinha => {
                return objLinha.id == id
            });
            vetor[posicaoVetor] = retornoConvertido;

            listarArtistas();
            formularioPadrao();
        });
    }
}

// função para limpar os campos e modificar a visibilidade dos botões
function formularioPadrao() {

    //limpar inputs
    document.getElementById("id").value = "";
    document.getElementById("artista").value = "";

    // visibilidade botões
    document.getElementById("btnCadastrar").style.display = "inline-block";
    document.getElementById("btnAlterar").style.display = "none";
    document.getElementById("btnRemover").style.display = "none";
}

