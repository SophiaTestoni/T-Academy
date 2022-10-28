// vetor
    let dados = [];

// Ao carregar o projeto
window.onload = function(){
    dados = JSON.parse(localStorage.getItem("vetor"));
selecionar();
}

// Função para atualizar o vetor no localStorage
function ls(){
localStorage.setItem("vetor", JSON.stringify(dados));
}

// Função para efetuar o cadastro de usuários
function cadastrar(){

// manipular elementos html
    let nome = document.getElementById("nome");
    let cidade = document.getElementById("cidade");
    let alerta = document.getElementById("alerta");

    // remover as classes alert-danger e alert-success, senão elas não irão se sobrepor
        alerta.classList.remove("alert-danger");
        alerta.classList.remove("alert-success");

    // condicional
    if(nome.value == ""){
        alerta.innerHTML = "Por gentileza, informar o seu nome";
        alerta.classList.add("alert-danger");
        nome.focus();
    }else if(cidade.value == ""){
        alerta.innerHTML = "Por gentileza, informar a sua cidade";
        alerta.classList.add("alert-danger");
        cidade.focus();

    }else{
    // mensagem de cadastro
        alerta.innerHTML = "Cadastro realizado com sucesso!";
        alerta.classList.add("alert-success");

    // Criar objeto JSON
    let obj = {
        "nome":nome.value,
        "cidade":cidade.value
    }

    // cadastrar no vetor
    dados.push(obj);
    
    // Atualizar a tabela de usuário
    selecionar();
    }

    // Chamando o localStorage
    ls();
}
// Função para listar os dados dos usuários
function selecionar(){

// obter o TBODY
let tabela = document.getElementById("tabela");

// Limpar os conteúdos da tabela
tabela.innerHTML = "";

// laço de repetição
for(let i=0; i<dados.length; i++){
// criar linha de tabela
// -1 significa que vai ser criada uma linha nova ao final da tabela
let linha = tabela.insertRow(-1);

// criar linha da coluna
let col1 = linha.insertCell(0);
let col2 = linha.insertCell(1);
let col3 = linha.insertCell(2);
let col4 = linha.insertCell(3);

// conteúdo das colunas
col1.innerHTML = i+1;
col2.innerHTML = dados[i].nome;
col3.innerHTML = dados[i].cidade;
// col4.innerHTML = "<button class='btn btn-danger' onclick='remover("+i+")'>Remover</button>";
col4.innerHTML = `<button class="btn btn-danger" onclick="remover(${i})">Remover</button>`
    }
}

// Função para remover usuário do vetor
function remover(indice){
    dados.splice(indice,1);
    selecionar(); 
    ls();
}