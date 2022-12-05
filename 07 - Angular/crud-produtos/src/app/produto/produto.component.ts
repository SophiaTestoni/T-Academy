import { Component } from '@angular/core';
import { FormGroup, FormControl } from'@angular/forms';
import { Produto } from '../modelo/Produto';
import { ProdutoService } from '../servicos/produto.service';


@Component({
  selector: 'app-produto',
  templateUrl: './produto.component.html',
  styleUrls: ['./produto.component.css']
})
export class ProdutoComponent {

  //Construtor para ter acesso a classe de serviço
  constructor(private servico:ProdutoService){}

  //Vetor de produtos chamando a interface criada no modelo
  vetor:Produto[] = [];

  //Formulário
  //Criar para cada textarea
  formulario = new FormGroup({
    produto : new FormControl(),
    valor   : new FormControl()
  });

  //Método de inicialização = executa após carregar todo o componente) - similar o window.onload
  ngOnInit(){
    this.selecionar();
  }

  //função para retornar os valores contidos no formulário
  testarFormulario():void{
    console.log(this.formulario.value);
  };

  //CADASTRAR um produto
  cadastrar():void{

  //Objeto do tipo Produto
  let p = new Produto;

  //Passar os dados do formulário para o objeto p
   p.produto = this.formulario.value.produto;
   p.valor = this.formulario.value.valor;

   //Executar o serviço
   this.servico.cadastrar(p)
   .subscribe(retorno =>{
  
    //Cadastrar produto no vetor
   this.vetor.push(retorno);

   //limpar os campos do formulário
   this.formulario.reset();
   })
  }

  //REMOVER um produto
  remover(id:number):void{

    //Remover o produto do back-end
    this.servico.remover(id)
    .subscribe(() => {})
      
    //Posição do vetor que está determinado o ID
    let pesquisaID = this.vetor.findIndex(obj => {return obj.id === id});

    //Remover produto do vetor
    this.vetor.splice(pesquisaID,1);

  }

  //Obter todos os produtos que estão na API
  selecionar():void{
    this.servico.selecionar()
    //pegar a info json e converter para um dado legível para o programa
    .subscribe({
      next: retorno => this.vetor = retorno,
      error: () => alert("Falha ao listar")
    });
  }
}
