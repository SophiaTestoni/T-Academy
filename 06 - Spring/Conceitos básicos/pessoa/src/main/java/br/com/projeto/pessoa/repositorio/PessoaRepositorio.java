package br.com.projeto.pessoa.repositorio;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.projeto.pessoa.modelo.PessoaModelo;

//todo repositório é uma interface
//utilizando a anotation para que o sistema saiba que esse terá o padrão de todo sql
//primeira vem a crud para trabalhar com a pessoaModelo e depois o long chega na casa dos milhoes de linhas (mais que o integer)
@Repository
public interface PessoaRepositorio extends CrudRepository<PessoaModelo, Long> {

    // Retornar todos os registros com uma determinada idade.
    Iterable<PessoaModelo>findByIdade(int idade);
    
    //Listar os registros através da coluna nome (A-Z)
    Iterable<PessoaModelo>findByOrderByNome();

    //Listar os registros através da coluna nome (Z-A)
    Iterable<PessoaModelo>findByOrderByNomeDesc();

    //Listar todas as pessoas com uma determinada idade em ordem decrescente de nome (Z-A)
    Iterable<PessoaModelo>findByIdadeOrderByNomeDesc(int idade);

    //Listar pessoas onde o nome possui determinado termo (LIKE)
    // O Containing vai verificar se contém algum termo, sem ele só buscaria exatamente o termo escrito pesquisado
    Iterable<PessoaModelo>findByNomeContaining(String termo);

    //Listar pessoas onde o nome inicia com determinado termo
    Iterable<PessoaModelo>findByNomeStartsWith(String termo);

    //Listar pessoas onde o nome finaliza com determinado termo
    Iterable<PessoaModelo>findByNomeEndsWith(String termo);

    //Metodo para retornar a soma das idades (SUM) - PESQUISAR SOBRE >>JPQL<<
    @Query(value = "SELECT SUM(idade) FROM pessoas", nativeQuery = true) // para criar o próprio SQL
    int somaIdades();

    //Método para retornar pessoas com idade superior a 25 anos
    @Query(value = "SELECT * FROM pessoas WHERE idade >= :idade", nativeQuery = true) // os : busca a variável passada no parâmetro
    // em algumas versões precisa usar ? == idade >= ?
    Iterable<PessoaModelo> idadeSuperior(int idade);

}