package br.com.crud.produto.repositorio;

import org.springframework.data.repository.CrudRepository;

import br.com.crud.produto.modelo.ProdutoModelo;

// todo repositório é uma interface obrigatóriamente
public interface ProdutoRepositorio extends CrudRepository<ProdutoModelo,Integer>{
    
}
