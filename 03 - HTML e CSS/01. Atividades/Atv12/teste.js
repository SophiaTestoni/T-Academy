let dados = []

function cadastrar() {
    let nome = document.getElementById('nome').value
    let data = document.getElementById('data').value
    let email = document.getElementById('email').value
    let telefone = document.getElementById('telefone').value 

    if (nome == '') {
        alert('Favor infomrar um nome.')
    }
    else if (data == '') {
        alert('Favor informar uma data.')
    }
    else if (email == '') {
        alert('Favor informar um E-mail.')
    }
    else if (telefone == '') {
        alert('Favor informar um telefone.')
    }
    else {
        let obj = {
            'nome': nome,
            'data': data,
            'email': email,
            'telefone': telefone
        }
    
        dados.push(obj)
        selecionar()

        let aniversario = new Date(data)
        let dataCorrente = new Date()

        if (aniversario.getMonth() == dataCorrente.getMonth()) {
            selecionarAniversariante(obj, aniversario)
        }
    }
}

function selecionarAniversariante(obj, aniversario) {
    let tabelaAniversariante = document.getElementById('tabelaAniversariante')

    let linha = tabelaAniversariante.insertRow(-1)
    let col1 = linha.insertCell(0)
    let col2 = linha.insertCell(1)

    col1.innerHTML = obj.nome
    col2.innerHTML = obj.data

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

function selecionar() {
    let tabela = document.getElementById('tabela')

    tabela.innerHTML = ''

    for (let i = 0; i < dados.length; i++) {
        let linha = tabela.insertRow(-1)

        let col1 = linha.insertCell(0)
        let col2 = linha.insertCell(1)
        let col3 = linha.insertCell(2)
        let col4 = linha.insertCell(3)
        let col5 = linha.insertCell(4)

        col1.innerHTML = dados[i].nome
        col2.innerHTML = dados[i].data 
        col3.innerHTML = dados[i].email
        col4.innerHTML = dados[i].telefone
        col5.innerHTML = "<button class='botao' onclick='remover(" + i + ")'>Remover</button>"
    }
}

function ls() {
    localStorage.setItem('vetor', JSON.stringify(dados))
}

function remover(indice) {
    dados.splice(indice, 1)
    selecionar()
    ls()
}