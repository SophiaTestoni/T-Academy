// vetor
let dados = [];

function cadastrar(){

    let produto = document.getElementById("produto");
    let marca = document.getElementById("marca");
    let valor = document.getElementById("valor");
    let alerta = document.getElementById("alerta");

      // remover as classes alert-danger e alert-success, senão elas não irão se sobrepor
      alerta.classList.remove("alert-danger");
      alerta.classList.remove("alert-success");

    // condicional
    if(produto.value == ""){
        alerta.innerHTML = "Por gentileza, informar o nome do produto";
        alerta.classList.add("alert-danger");
        produto.focus();
    }else if(marca.value == ""){
        alerta.innerHTML = "Por gentileza, informar o nome da marca";
        alerta.classList.add("alert-danger");
        marca.focus();
    }else if(valor.value == ""){
        alerta.innerHTML = "Por gentileza, informar o valor do produto"
        alerta.classList.add("alert-danger");
        valor.focus();

    }else{
    // mensagem de cadastro
        alerta.innerHTML = "Cadastro realizado com sucesso!";
        alerta.classList.add("alert-success");

        let obj = {
            "produto":produto.value,
            "marca":marca.value,
            "valor":valor.value
        }

    // cadastrar no vetor
    dados.push(obj);
    
    // Atualizar a tabela de usuário
    selecionar();

    }
    var x = document.getElementById("tabela").rows.length;
    document.getElementById("result").innerHTML = "Localizado " + x + " linha(s) nessa tabela";

      // limpar os inputs
      produto.value = "";
      marca.value = "";
      valor.value = "";
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
    
    // conteúdo das colunas
    col1.innerHTML = i+1;
    col2.innerHTML = dados[i].produto;
    col3.innerHTML = dados[i].marca;
    col4.innerHTML = dados[i].valor;
        }
    }
