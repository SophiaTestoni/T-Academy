package br.com.exemplo02.repositorio;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.exemplo02.modelo.PostagemModelo;

@Repository
public interface PostagemRepositorio extends CrudRepository<PostagemModelo, Long>{
    
}
