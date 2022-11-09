// Vetor de produtos
let vetor = [];

// Ao carregar a página HTML
window.onload = function(){
    // Armazenar os produtos no vetor e listar
    obterProdutos();
}

// Obter todos os produtos
function obterProdutos(){

    fetch("http://localhost:8080")
    .then(retorno => retorno.json())
    .then(produtos => vetor = produtos)
    .then(() => listarProdutos());

}

// Listar os produtos do vetor na tabela
function listarProdutos(){

    // Obter a tabela
    let tabela = document.getElementById("tabela");

    // Limpar conteúdos da tabela
    tabela.innerHTML = "";

    // Laço de repetição
    for(let i=0; i<vetor.length; i++){

        // Criar linha
        let linha = tabela.insertRow(-1);

        // Criar as colunas
        let colunaCodigo = linha.insertCell(0);
        let colunaNome = linha.insertCell(1);
        let colunaValor = linha.insertCell(2);
        let colunaSelecionar = linha.insertCell(3);

        // Dados das colunas
        colunaCodigo.innerText = vetor[i].codigo;
        colunaNome.innerText = vetor[i].nome;
        colunaValor.innerText = vetor[i].valor;
        colunaSelecionar.innerHTML = `<button onclick="selecionar(${vetor[i].codigo})" class="btn btn-success">Selecionar</button>`;

    }

}

// Cadastrar produtos
function cadastrar(){
    // Capturar o nome do produto e o valor
    let nome = document.getElementById("nome").value;
    let valor = parseInt(document.getElementById("valor").value);

    // Validações
    if(nome.length < 5){
        alert("O nome do produto deve possuir pelo menos 5 caracteres.");
    }else if(isNaN(valor)){
        alert("Informe um valor.");
    }else if(valor <= 0){
        alert("Informe um valor válido.");
    }else{
        let obj = {
            "nome":nome,
            "valor":valor
        }

        fetch("http://localhost:8080",{
            method:"POST",
            headers:{
                "accept":"application/json",
                "content-type":"application/json"
            },
            body:JSON.stringify(obj)
        })
        .then(retorno => retorno.json())
        .then(retorno_convertido => {
            vetor.push(retorno_convertido);
            listarProdutos();  
            
            // Limpar formulário
            formularioPadrao();
        });
    }
}

// Selecionar produto
function selecionar(codigo){
    fetch(`http://localhost:8080/${codigo}`)
    .then(retorno => retorno.json())
    .then(retorno_convertido => {

        // Ocultar o botão de cadastro
        document.getElementById("btnCadastrar").style.display="none";

        // Exibir os botões de alteração e exclusão
        document.getElementById("btnAlterar").style.display = "inline-block";
        document.getElementById("btnRemover").style.display = "inline-block";

        // Preencher os inputs
        document.getElementById("codigo").value = retorno_convertido.codigo;
        document.getElementById("nome").value = retorno_convertido.nome;
        document.getElementById("valor").value = retorno_convertido.valor;
    })
}

// Remover produto
function remover(){

    // Obter o código que está no input hidden
    let codigo = parseInt(document.getElementById("codigo").value);

    // Requisição na API
    fetch(`http://localhost:8080/${codigo}`,{method:"DELETE"})
    .then(() => {
        
        // Obter a posição do vetor referente ao produto que deverá ser removido
        let posicaoVetor = vetor.findIndex(objLinha => {
            return objLinha.codigo == codigo
        });

        // Remover produto do vetor
        vetor.splice(posicaoVetor, 1);

        // Atualizar a tabela
        listarProdutos();
        
        // Limpar formulário
        formularioPadrao();

    })

}


// Alterar produtos
function alterar(){
    // Capturar o nome do produto e o valor
    let codigo = parseInt(document.getElementById("codigo").value);
    let nome = document.getElementById("nome").value;
    let valor = parseInt(document.getElementById("valor").value);

    // Validações
    if(nome.length < 5){
        alert("O nome do produto deve possuir pelo menos 5 caracteres.");
    }else if(isNaN(valor)){
        alert("Informe um valor.");
    }else if(valor <= 0){
        alert("Informe um valor válido.");
    }else{
        let obj = {
            "codigo":codigo,
            "nome":nome,
            "valor":valor
        }

        fetch("http://localhost:8080",{
            method:"PUT",
            headers:{
                "accept":"application/json",
                "content-type":"application/json"
            },
            body:JSON.stringify(obj)
        })
        .then(retorno => retorno.json())
        .then(retorno_convertido => {

             // Obter a posição do vetor referente ao produto que deverá ser alterado
            let posicaoVetor = vetor.findIndex(objLinha => {
                return objLinha.codigo == codigo
            });

            // Alterar o produto no vetor
            vetor[posicaoVetor] = retorno_convertido;

            // Atualizar a tabela
            listarProdutos();   

            // Limpar formulário
            formularioPadrao();
        });
    }
}

// Função para limpar os campos e modificar a visibilidade dos botoes
function formularioPadrao(){

    // Limpar os inputs
    document.getElementById("codigo").value = "";
    document.getElementById("nome").value = "";
    document.getElementById("valor").value = "";

    // Visibilidade dos botões
    document.getElementById("btnCadastrar").style.display = "inline-block";
    document.getElementById("btnAlterar").style.display   = "none";
    document.getElementById("btnRemover").style.display   = "none";
}