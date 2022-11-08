package br.com.exemplo01.repositorio;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.exemplo01.modelo.ColaboradorModelo;

@Repository
public interface ColaboradorRepositorio extends CrudRepository<ColaboradorModelo, Long> {
    
}
