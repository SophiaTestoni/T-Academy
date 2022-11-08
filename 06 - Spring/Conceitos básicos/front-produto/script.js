//Vetor de produtos
let ve

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


    //cadastrar produtos
function cadastrar() {
    // capturar o nome do produto e valor
    let nome = document.getElementById("nome").value;
    let valor = parseInt(document.getElementById("valor").value);

    // validacoes
    if(nome.length < 5) {
        alert("O nome do produto deve possuir pelo menos 5 caracteres.");
    } else if(valor <= 0) {
        alert("Inform um valor válido.");
    } else if(isNaN(valor)) {
        alert("Inform um valor.");
    } else {
        let obj = {
            "nome": nome,
            "valor": valor
        }

        fetch("http://localhost:8080", {
            method: "POST",
            headers: {
                "accept":"application/json",
                "content-type":"application/json"
            },
            body: JSON.stringify(obj)
        })
        .then(retorno => retorno.json())
        .then(retornoConvertido => {
            vetor.push(retornoConvertido);
            listarProdutos();
        });
    }
}

// selecionar produto
function selecionar(codigo) {
    fetch(`http://localhost:8080/${codigo}`)
    .then(retorno => retorno.json())
    .then(retornoConvertido => {
        // ocultar o botao de cadastro
        document.getElementById("btnCadastrar").style.display="none";

        // exibir botões de alteração e exclusão
        document.getElementById("btnAlterar").style.display="inline-block";
        document.getElementById("btnRemover").style.display="inline-block";

        //preencher os inputs
        document.getElementById("codigo").value = retornoConvertido.codigo;
        document.getElementById("nome").value = retornoConvertido.nome;
        document.getElementById("valor").value = retornoConvertido.valor;
    });

    // limpar formulário
    formularioPadrao();
}

// remover produto
function remover() {
    let codigo = parseInt(document.getElementById("codigo").value);

    // requisição na API
    fetch(`http://localhost:8080/${codigo}`, {method:"DELETE"})
    .then(() => {

        //obter a posição do vetor referente ao produto que deverá ser removido
        let posicaoVetor = vetor.findIndex(objLinha => {
            return objLinha.codigo == codigo
        });

        // remover produto do vetor
        vetor.splice(posicaoVetor, 1);

        //atualizar tabela
        listarProdutos();

        // limpar formulário
        formularioPadrao();
    })

}

//alterar produtos
function alterar() {
    // capturar o nome do produto e valor
    let codigo = parseInt(document.getElementById("codigo").value);
    let nome = document.getElementById("nome").value;
    let valor = parseInt(document.getElementById("valor").value);

    // validacoes
    if(nome.length < 5) {
        alert("O nome do produto deve possuir pelo menos 5 caracteres.");
    } else if(valor <= 0) {
        alert("Inform um valor válido.");
    } else if(isNaN(valor)) {
        alert("Inform um valor.");
    } else {
        let obj = {
            "codigo":codigo,
            "nome": nome,
            "valor": valor
        }

        fetch("http://localhost:8080", {
            method: "PUT",
            headers: {
                "accept":"application/json",
                "content-type":"application/json"
            },
            body: JSON.stringify(obj)
        })
        .then(retorno => retorno.json())
        .then(retornoConvertido => {

            // obter posição do vetor referente ao produto que deverá ser alterado
            let posicaoVetor = vetor.findIndex(objLinha => {
                return objLinha.codigo == codigo
            });

            // alterar o produto no vetor
            vetor[posicaoVetor] = retornoConvertido;

            // atualizar a tabela
            listarProdutos();

            // limpar formulário
            formularioPadrao();
        });
    }
}

// função para limpar os campos e modificar a visibilidade dos botões
function formularioPadrao() {

    //limpar inputs
    document.getElementById("codigo").value = "";
    document.getElementById("nome").value = "";
    document.getElementById("valor").value = "";

    // visibilidade botões
    document.getElementById("btnCadastrar").style.display = "inline-block";
    document.getElementById("btnAlterar").style.display = "none";
    document.getElementById("btnRemover").style.display = "none";
}
}

