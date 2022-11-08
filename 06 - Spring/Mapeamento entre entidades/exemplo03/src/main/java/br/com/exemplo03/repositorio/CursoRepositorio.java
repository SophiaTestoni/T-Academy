package br.com.exemplo03.repositorio;

import org.springframework.data.repository.CrudRepository;

import br.com.exemplo03.modelo.CursoModelo;

public interface CursoRepositorio extends CrudRepository<CursoModelo, Long> {
    
}
