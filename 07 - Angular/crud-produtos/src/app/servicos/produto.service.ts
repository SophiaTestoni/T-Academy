import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Produto } from '../modelo/Produto';

@Injectable({
  providedIn: 'root'
})
export class ProdutoService {

  //Construtor
  constructor(private http:HttpClient) { }

  //Selecionar todos os produtos da API
  selecionar(){
    //na hora de retornar, retorna um json de produtos e não um json de objetos
    return this.http.get<Produto[]>('http://localhost:3000/produtos');
  }

  //Remover produto através do ID
  remover(id:number){
    return this.http.delete('http://localhost:3000/produtos/'+id);
  }

  //Cadastrar um produto
  cadastrar(p:Produto){           // Acessando a url , passando um obj completo
    return this.http.post<Produto>('http://localhost:3000/produtos/', p);
  // esse p é lá da instância no produto.component.ts
  }

}
