package br.com.projeto.loja.repositorio;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.projeto.loja.modelo.LojaModelo;

@Repository
public interface LojaRepositorio extends CrudRepository<LojaModelo, Long> {
    
}
