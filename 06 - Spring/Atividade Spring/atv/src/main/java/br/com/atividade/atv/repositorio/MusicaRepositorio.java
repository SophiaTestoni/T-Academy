package br.com.atividade.atv.repositorio;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.atividade.atv.modelo.MusicaModelo;

@Repository
public interface MusicaRepositorio extends CrudRepository<MusicaModelo, Long>{
    
}
