let copiaTela = ""

let produtos = [

    // Informatica
    {
        // 0
        "segmento": "Informatica",
        "nome": "Notebook I7",
        "marca": "Dell",
        "valor": 5600,
        "estoque": 8,
        "img": "Notebook-I7.png"

    },

    {
        // 1
        "segmento": "Informatica",
        "nome": "Notebook Gamer Nitro",
        "marca": "Acer",
        "valor": 4300,
        "estoque": 11,
        "img": "NotebookGamer.png"
    },

    {
        // 2
        "segmento": "Informatica",
        "nome": "Computador IMac-27",
        "marca": "Apple",
        "valor": 15000,
        "estoque": 9,
        "img": "Computador-IMac27.png"

    },
    {
        // 3
        "segmento": "Informatica",
        "nome": "Iphone 13",
        "marca": "Apple",
        "valor": 5400,
        "estoque": 5,
        "img": "Iphone-13.png"
    },

    {
        // 4
        "segmento": "Informatica",
        "nome": "Galaxy S22",
        "marca": "Samsung",
        "valor": 4500,
        "estoque": 6,
        "img": "Galaxy-S22.png"

    },

    {
        // 5
        "segmento": "Informatica",
        "nome": "MI 11",
        "marca": "Xiaomi",
        "valor": 2000,
        "estoque": 4,
        "img": "MI-11.png"
    },

    {
        // 6
        "segmento": "Informatica",
        "nome": "Monitor Ultrawide-29",
        "marca": "LG",
        "valor": 1800,
        "estoque": 12,
        "img": "Monitor-Ultrawide-29.png"

    },

    {
        // 7
        "segmento": "Informatica",
        "nome": "Iphone 11",
        "marca": "Apple",
        "valor": 3700,
        "estoque": 8,
        "img": "Iphone-11.png"
    },

    {
        // 8
        "segmento": "Informatica",
        "nome": "Notebook Aspire",
        "marca": "Acer",
        "valor": 3100,
        "estoque": 4,
        "img": "Notebook-Aspire.png"
    },

    {
        // 9
        "segmento": "Informatica",
        "nome": "MacBook Pro",
        "marca": "Apple",
        "valor": 23000,
        "estoque": 3,
        "img": "MacBook-Pro.png"
    },
    // Vestuario
    {
        // 10
        "segmento": "Vestuario",
        "nome": "Tenis Cano Baixo",
        "marca": "Gucci",
        "valor": 5400,
        "estoque": 8,
        "img": "Tenis-Cano-Baixo.png"

    },

    {
        // 11
        "segmento": "Vestuario",
        "nome": "Sandália de Tiras",
        "marca": "Gucci",
        "valor": 5000,
        "estoque": 10,
        "img": "sandalia-tiras.png"
    },

    {
        // 12
        "segmento": "Vestuario",
        "nome": "Tênis Track",
        "marca": "Balenciaga",
        "valor": 9200,
        "estoque": 8,
        "img": "tenis-track.png"
    },

    {
        // 13
        "segmento": "Vestuario",
        "nome": "Tênis Slip-On",
        "marca": "Balenciaga",
        "valor": 6600,
        "estoque": 11,
        "img": "tenis-slip-on.png"
    },

    {
        // 14
        "segmento": "Vestuario",
        "nome": "Bota Pascal",
        "marca": "Dr.Martens",
        "valor": 2500,
        "estoque": 15,
        "img": "bota-pascal.png"

    },

    {
        // 15
        "segmento": "Vestuario",
        "nome": "Sandália Plataforma",
        "marca": "Dr.Martens",
        "valor": 1450,
        "estoque": 8,
        "img": "sandalia-dr-martens.png"

    },

    {
        // 16
        "segmento": "Vestuario",
        "nome": "Vestido Longo",
        "marca": "Sandro",
        "valor": 2550,
        "estoque": 20,
        "img": "vestido-longo-sandro.png"

    },

    {
        // 17
        "segmento": "Vestuario",
        "nome": "Bolero",
        "marca": "Rowen Rose",
        "valor": 7500,
        "estoque": 10,
        "img": "bolero.png"

    },

    {
        // 18
        "segmento": "Vestuario",
        "nome": "Vestido Curto",
        "marca": "Zimmermann",
        "valor": 7560,
        "estoque": 15,
        "img": "vestido-medio.png"
    },

    {
        // 19
        "segmento": "Vestuario",
        "nome": "Cropped",
        "marca": "Dolce Gabbana",
        "valor": 5530,
        "estoque": 17,
        "img": "dolce-gabbana-cropped.png"

    },

    // Casa
    {
        // 20
        "segmento": "Casa",
        "nome": "Conjunto de Moedor Temperos",
        "marca": "Mor",
        "valor": 60,
        "estoque": 40,
        "img": "moedor.png"
    },

    {
        // 21
        "segmento": "Casa",
        "nome": "Cadeira Acapulco",
        "marca": "MadeiraMadeira",
        "valor": 470,
        "estoque": 27,
        "img": "cadeira-acapulco.png"

    },
    {
        // 22
        "segmento": "Casa",
        "nome": "Banqueta Alta",
        "marca": "Mor",
        "valor": 560,
        "estoque": 40,
        "img": "banqueta-alta.png"
    },

    {
        // 23
        "segmento": "Casa",
        "nome": "Poltrona de Couro",
        "marca": "MKL",
        "valor": 2600,
        "estoque": 10,
        "img": "poltrona-couro.png"
    },

    {
        // 24
        "segmento": "Casa",
        "nome": "Mesa de centro",
        "marca": "Morada",
        "valor": 290,
        "estoque": 23,
        "img": "mesa-centro.png"
    },

    {
        // 25
        "segmento": "Casa e Decoração",
        "nome": "Colher de Bambu",
        "marca": "Emporium",
        "valor": 25,
        "estoque": 50,
        "img": "colher-bambu.png"
    },

    {
        // 26
        "segmento": "Casa e Decoração",
        "nome": "Cafeteira Italiana",
        "marca": "Casita",
        "valor": 100,
        "estoque": 40,
        "img": "cafeteira-italiana.png"

    },

    {
        // 27
        "segmento": "Casa e Decoração",
        "nome": "Prensa Francesa",
        "marca": "Oxford",
        "valor": 120,
        "estoque": 35,
        "img": "prensa-francesa.png"
    },


    {
        // 28
        "segmento": "Casa",
        "nome": "Ombrelone",
        "marca": "Outside",
        "valor": 920,
        "estoque": 26,
        "img": "ombrelone.png"
    },

    {
        // 29
        "segmento": "Casa",
        "nome": "Conjunto Mesa de Jantar",
        "marca": "MadeiraMadeira",
        "valor": 1100,
        "estoque": 24,
        "img": "mesa-jantar.png"
    }

]

function addCarrinho(produto, valor, qtd, posicao) {

    let quantiaDesejada = document.getElementById("qtd" + posicao).value;

    let p = produtos[posicao];
    if (p.estoque < quantiaDesejada) {
        alert("quantia insuficiente!")
        return;
    }
    let itemCarrinho = { nome: produto, qtd: qtd, posicao: posicao, valor: valor };
    localStorage.setItem("produto" + posicao, JSON.stringify(itemCarrinho))
    alert("Produto adicionado ao carrinho!");
}

function listarProdutosRandom() {
    // Obter o local onde serão exibidos todos os produtos
    let listarProdutos = document.getElementById("listarProdutos")
    let numeroGerado = [];

    let indiceTeste = 0;
    for (var i = 0; i < 12; i++) {
        let repetido = false;
        indiceTeste = Math.floor(Math.random() * produtos.length);
        for (var j = 0; j < numeroGerado.length; j++) {
            if (numeroGerado[j] == indiceTeste) {
                repetido = true;
            }
        }
        if (!repetido) {
            numeroGerado.push(indiceTeste);
        }
        else {
            i--;
        }
    }
    // Laço de repetição
    for (let i = 0; i < 12; i++) {

        let indiceAtual = numeroGerado[i];

        // Criar uma nova coluna
        let coluna = document.createElement("div");
        coluna.classList.add("col-3");

        // Criar o card
        let card = document.createElement("div");
        card.classList.add("card", "prod");

        // Criar o título
        let titulo = document.createElement("h1");
        titulo.innerText = produtos[indiceAtual].nome;

        // Criar imagem do produto
        let imagem = document.createElement("img");
        imagem.src = "imagem/" + produtos[indiceAtual].img;
        imagem.alt = produtos[indiceAtual].nome;

        // Criar o valor do produto
        let valor = document.createElement("p");
        valor.innerText = produtos[indiceAtual].valor.toLocaleString('pt-br', { style: 'currency', currency: 'BRL' });
        let botao = document.createElement("button")
        botao.innerText = "Adicionar no carrinho";
        //função pra criar dados dinamicamente
        botao.onclick = function () {
            addCarrinho(produtos[indiceAtual].nome, produtos[indiceAtual].valor, document.getElementById("qtd" + indiceAtual).value, indiceAtual);
        }

        let inputType = document.createElement("input");
        inputType.placeholder = "Informe a quantidade desejada"
        inputType.id = "qtd" + indiceAtual;
        inputType.type = "number";

        // Atribuir os dados do produto no card
        card.appendChild(imagem);
        card.appendChild(titulo);
        card.appendChild(valor);
        card.appendChild(inputType)
        card.appendChild(botao)

        // Adicionar o card na coluna
        coluna.appendChild(card);

        // Adicionar a coluna na linha do grid
        listarProdutos.appendChild(coluna);

        copiaTela = listarProdutos.innerHTML;
    }

}

window.onload = function () {
    if (window.location.pathname.toLowerCase().indexOf("carrinho") != -1) {

        let elementTableCarrinho = document.getElementById("tableCarrinho");

        let htmlTabelaCarrinho = " <thead><tr><th>Codigo</th><th>Nome</th><th>Quantidade</th><th>Preço</th></tr></thead>"
        let total = 0;
        for (var i = 0; i < localStorage.length; i++) {
            var key = localStorage.key(i);
            var value = JSON.parse(localStorage.getItem(key));
            total += value.qtd * value.valor;
            htmlTabelaCarrinho += `<tr><td>${value.posicao}</td><td>${value.nome}</td><td> <input type='text' id='qtd${value.posicao}' value='${value.qtd}'</td><td>${value.valor.toLocaleString('pt-br', { style: 'currency', currency: 'BRL' })}</td><td><button onclick='atualizarQtd(${value.posicao})'>Atualizar Quantidade</button><button onclick='removerCarrinho(${value.posicao})'>Remover</button></td></tr>`;
        }
        elementTableCarrinho.innerHTML = htmlTabelaCarrinho;
        document.getElementById("totalRodape").innerHTML = "Total: " + total.toLocaleString('pt-br', { style: 'currency', currency: 'BRL' })
    }
    else {
        var dadosPesquisaSegmento = window.location.search;
        if (dadosPesquisaSegmento == "") {
            listarProdutosRandom();
        }
        else {
            const params = new URLSearchParams(dadosPesquisaSegmento);
            let segmento = params.get('seg');
            busca_produtos(segmento)
        }
    }
}

function atualizarQtd(posicao) {
    let novaQtd = document.getElementById("qtd" + posicao).value;
    let estoqueMax = produtos[posicao].estoque;

    if (novaQtd > estoqueMax) {
        alert("Estoque insuficiente!")
    }
    else {
        let produtoAtualizado = JSON.parse(localStorage.getItem("produto" + posicao));
        produtoAtualizado.qtd = novaQtd;
        localStorage.removeItem("produto" + posicao);
        localStorage.setItem("produto" + posicao, JSON.stringify(produtoAtualizado));
        alert("Item carrinho atualizado!")
        window.location.reload();
    }
}

function removerCarrinho(posicao) {
    localStorage.removeItem("produto" + posicao);
    alert("Produto removido do carrinho!");
    window.location.reload();
}

// Possível buscar produtos por nome, marca ou segmento
function busca_produtos(segmento) {

    let input = "";
    if (segmento != "") {
        input = segmento;
    }
    else {
        input = document.getElementById("searchbar").value
    }

    input = input.toLowerCase();

    if (input.length == 0) {
        listarProdutos.innerHTML = copiaTela
    }
    else {
        listarProdutos.innerHTML = "";

        if (input == "all") {
            for (let i = 0; i < produtos.length; i++) {
                    // Criar uma nova coluna
                    let coluna = document.createElement("div");
                    coluna.classList.add("col-3");

                    // Criar o card
                    let card = document.createElement("div");
                    card.classList.add("card", "prod");

                    // Criar o título
                    let titulo = document.createElement("h1");
                    titulo.innerText = produtos[i].nome;

                    // Criar imagem do produto
                    let imagem = document.createElement("img");
                    imagem.src = "imagem/" + produtos[i].img;
                    imagem.alt = produtos[i].nome;

                    // Criar o valor do produto
                    let valor = document.createElement("p");
                    valor.innerText = produtos[i].valor.toLocaleString('pt-br', { style: 'currency', currency: 'BRL' });
                    let botao = document.createElement("button")
                    botao.innerText = "Adicionar no carrinho";
                    //função pra criar dados dinamicamente
                botao.onclick = function () {
                        addCarrinho(produtos[i].nome, produtos[i].valor, document.getElementById("qtd" + i).value, i);
                    }

                    let inputType = document.createElement("input");
                    inputType.placeholder = "Informe a quantidade desejada"
                    inputType.id = "qtd" + i;
                    inputType.type = "number";

                    // Atribuir os dados do produto no card
                    card.appendChild(imagem);
                    card.appendChild(titulo);
                    card.appendChild(valor);
                    card.appendChild(inputType)
                    card.appendChild(botao)

                    // Adicionar o card na coluna
                    coluna.appendChild(card);

                    // Adicionar a coluna na linha do grid
                    listarProdutos.appendChild(coluna);
            }
        }
        else {
            for (let i = 0; i < produtos.length; i++) {
                if (produtos[i].segmento.toLowerCase().indexOf(input) != -1 || produtos[i].marca.toLowerCase().indexOf(input) != -1 || produtos[i].nome.toLowerCase().indexOf(input) != -1) {

                    // Criar uma nova coluna
                    let coluna = document.createElement("div");
                    coluna.classList.add("col-3");

                    // Criar o card
                    let card = document.createElement("div");
                    card.classList.add("card", "prod");

                    // Criar o título
                    let titulo = document.createElement("h1");
                    titulo.innerText = produtos[i].nome;

                    // Criar imagem do produto
                    let imagem = document.createElement("img");
                    imagem.src = "imagem/" + produtos[i].img;
                    imagem.alt = produtos[i].nome;

                    // Criar o valor do produto
                    let valor = document.createElement("p");
                    valor.innerText = produtos[i].valor.toLocaleString('pt-br', { style: 'currency', currency: 'BRL' });
                    let botao = document.createElement("button")
                    botao.innerText = "Adicionar no carrinho";
                    //função pra criar dados dinamicamente
                    botao.onclick = function () {
                        addCarrinho(produtos[i].nome, produtos[i].valor, document.getElementById("qtd" + i).value, i);
                    }

                    let inputType = document.createElement("input");
                    inputType.placeholder = "Informe a quantidade desejada"
                    inputType.id = "qtd" + i;
                    inputType.type = "number";

                    // Atribuir os dados do produto no card
                    card.appendChild(imagem);
                    card.appendChild(titulo);
                    card.appendChild(valor);
                    card.appendChild(inputType)
                    card.appendChild(botao)

                    // Adicionar o card na coluna
                    coluna.appendChild(card);

                    // Adicionar a coluna na linha do grid
                    listarProdutos.appendChild(coluna);
                }
            }

        }
    }
}


