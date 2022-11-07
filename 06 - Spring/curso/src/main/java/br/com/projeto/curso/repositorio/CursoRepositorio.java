package br.com.projeto.curso.repositorio;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.projeto.curso.modelo.CursoModelo;

@Repository
public interface CursoRepositorio extends CrudRepository<CursoModelo, Long> {

    //Retorna a quantidade de cursos com determinado nome
    int countByNome(String nome);

    //Retorna a quantidade de cursos com determinado código
    int countByCodigo (long codigo);
    
}
