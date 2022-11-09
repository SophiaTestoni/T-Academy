package br.com.atividade.atv.repositorio;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.atividade.atv.modelo.ArtistaModelo;

@Repository
public interface ArtistaRepositorio extends CrudRepository<ArtistaModelo, Long> {

    ArtistaModelo findById(long id);

    Iterable<ArtistaModelo>findByArtistaContaining(String artista);
    
}
