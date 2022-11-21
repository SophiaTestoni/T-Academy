import { Component } from '@angular/core';
import { FormGroup, FormControl } from'@angular/forms';
import { Produto } from '../modelo/Produto';

@Component({
  selector: 'app-produto',
  templateUrl: './produto.component.html',
  styleUrls: ['./produto.component.css']
})
export class ProdutoComponent {

  //Vetor de produtos chamando a interface criada no modelo
  vetor:Produto[] = [];

  //Formulário
  //Criar para cada textarea
  formulario = new FormGroup({
    produto : new FormControl(),
    valor   : new FormControl()
  });

  //função para retornar os valores contidos no formulário
  testarFormulario():void{
    console.log(this.formulario.value);
  }

  //CADASTRAR um produto
  cadastrar():void{

  //Objeto do tipo Produto
  let p = new Produto;

  //Passar os dados do formulário para o objeto p
   p.produto = this.formulario.value.produto;
   p.valor = this.formulario.value.valor;

   //Cadastrar produto no vetor
   this.vetor.push(p);

   //limpar os campos do formulário
   this.formulario.reset();
  }

  //REMOVER um produto
  remover(posicao:number):void{

      //Excluir produto através da posição do vetor
      this.vetor.splice(posicao,1);

  }

}
