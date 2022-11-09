package br.com.atividade.atv.repositorio;

import org.springframework.data.repository.CrudRepository;

import br.com.atividade.atv.modelo.PlaylistModelo;

public interface PlaylistRepositorio extends CrudRepository<PlaylistModelo, Long> {
    
}
