
// vetor
let dados = [];

// Ao carregar o projeto
window.onload = function(){
    
    if(localStorage.getItem("vetor") != undefined){
        dados = JSON.parse(localStorage.getItem("vetor"));
    }

selecionar();
}

// Função para atualizar o vetor no localStorage
function ls(){
    localStorage.setItem("vetor", JSON.stringify(dados));
}

function cadastrar(){

    let nome = document.getElementById("nome");
    let nascimento = document.getElementById("nascimento");
    let email = document.getElementById("email");
    let tel = document.getElementById("tel");
    let alerta = document.getElementById("alerta");
    

      // remover as classes alert-danger e alert-success, senão elas não irão se sobrepor
      alerta.classList.remove("alert-danger");
      alerta.classList.remove("alert-success");

    // condicional
    if(nome.value == ""){
        alerta.innerHTML = "Por gentileza, informar um nome";
        alerta.classList.add("alert-danger");
        nome.focus();
        
    }else if(nascimento.value == ""){
        alerta.innerHTML = "Por gentileza, informar a data de nascimento";
        alerta.classList.add("alert-danger");
        nascimento.focus();
    }else if(email.value == ""){
        alerta.innerHTML = "Por gentileza, informar o email para cadastro"
        alerta.classList.add("alert-danger");
        email.focus();

    }else if(tel.value == ""){
        alerta.innerHTML = "Por gentileza, informar o telefone cadastro"
        alerta.classList.add("alert-danger");
        tel.focus();

    }else{
        alerta.innerHTML = "Cadastro realizado com sucesso!";
        alerta.classList.add("alert-success");

        let obj = {
            "nome":nome.value,
            "nascimento":nascimento.value,
            "email":email.value,
            "tel":tel.value
        }

        let aniversario = new Date(nascimento.value);
        let dataCorrente = new Date();

        if (aniversario.getMonth() == dataCorrente.getMonth()) {
            verificarAniversariante(obj, aniversario)
        }

    dados.push(obj);
    selecionar();

    }
    ls();

    // limpar os inputs
    nome.value = "";
    nascimento.value = "";
    email.value = "";
    tel.value = "";
}

function verificarAniversariante(obj, aniversario) {
    let tabelaAniversariante = document.getElementById("tabelaAniversariante")

    let linha = tabelaAniversariante.insertRow(-1);
    let col1 = linha.insertCell(0);
    let col2 = linha.insertCell(1);

    col1.innerHTML = obj.nome
    col2.innerHTML = obj.nascimento

    let dataCorrente = new Date()

    if (aniversario.getDate() + 1 < dataCorrente.getDate()) {
        col1.classList.add("fezAniversario");
    }
    else if (aniversario.getDate() + 1 == dataCorrente.getDate()) {
        col1.classList.add("aniversariante");
    }
    else {
        col1.classList.add("faraAniversario");
    }
}

function selecionar(){
//  TBODY
    let tabela = document.getElementById("tabela");

    tabela.innerHTML = "";
    
    // laço de repetição - criar linha de tabela
    for(let i=0; i<dados.length; i++){
 
    let linha = tabela.insertRow(-1);
    
    // criar linha da coluna
    let col1 = linha.insertCell(0);
    let col2 = linha.insertCell(1);
    let col3 = linha.insertCell(2);
    let col4 = linha.insertCell(3);
    let col5 = linha.insertCell(4);
    let col6 = linha.insertCell(5);
    let col7 = linha.insertCell(6);
    
    // conteúdo das colunas
    col1.innerHTML = i+1;
    col2.innerHTML = dados[i].nome;
    col3.innerHTML = dados[i].nascimento;
    col4.innerHTML = dados[i].email;
    col5.innerHTML = dados[i].tel;
    col6.innerHTML = `<button class="btn btn-warning" onclick="alterar(${i})">Alterar</button>`
    col7.innerHTML = `<button class="btn btn-danger" onclick="remover(${i})">Remover</button>`

        }
    }

    // Função para remover usuário do vetor
function remover(indice){
    dados.splice(indice,1);
    selecionar();
    ls();
}


