import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
 
//Criar variáveis
//cria a variável e dá uma tipagem para ela
texto:string = 'Hello Angular!';
exibir:boolean = true;
//Para eu definir que o array aceita somente texto, tipar ele
nomes:string[] = ['Aline', 'Bianca', 'Caio', 'Gustavo','Viviane'];
//Array de objetos
clientes:any[] = [
{'nome':'Aline', 'idade':23},
{'nome':'Bianca', 'idade':34},
{'nome':'Caio', 'idade':17},
{'nome':'Gustavo', 'idade':22},
{'nome':'Viviane', 'idade':16},
];

//Função para exibir uma mensagem
//Boa prática informar o tipo de retorno (void, string, number, etc)
mensagem():void{
  alert('Hello World!');
}

//Função para exibir ou ocultar o quadrado criado no css
exibirOcultar():void{
  //se estiver true, vai ficar false
  //quando estiver false vai ficar true
  this.exibir = !this.exibir;
}





}
