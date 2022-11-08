package br.com.exemplo02.repositorio;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.exemplo02.modelo.ComentarioModelo;

@Repository
public interface ComentarioRepositorio extends CrudRepository<ComentarioModelo, Long>{
    
}
