package br.com.projeto.pessoa.controle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import br.com.projeto.pessoa.modelo.PessoaModelo;
import br.com.projeto.pessoa.repositorio.PessoaRepositorio;

@RestController // controlador do projeto
public class PessoaControle {

    @Autowired
    private PessoaRepositorio acao;

    @PostMapping("")
    public PessoaModelo cadastrar(@RequestBody PessoaModelo obj){
        return acao.save(obj);

    }
    @GetMapping("")
    public Iterable<PessoaModelo> listar(){
        return acao.findAll();
    }

    //Método para contar registros na tabela
    @GetMapping("/contar")
    public long contarRegistros(){
        return acao.count();
    }

    //Após criar o método no repositório, aqui é possível listar pela idade passada pela URL com o pathVariable
    //Funciona como um WHERE
    @GetMapping("/listarIdade/{idade}")
    public Iterable<PessoaModelo> listarPessoasIdade(@PathVariable int idade){
        return acao.findByIdade(idade);
    }

    //Após criar o método no repositório, possível mostrar os nomes em ordem alfabética
    @GetMapping("/ordenarNomeASC")
    public Iterable<PessoaModelo>ordernarNomeASC(){
        return acao.findByOrderByNome();
    }
    //Após criar o método no repositório, possível mostrar os nomes em ordem decrescente
    @GetMapping("/ordenarNomeDESC")
    public Iterable<PessoaModelo>ordernarNomeDESC(){
        return acao.findByOrderByNomeDesc();
    }

    //Listando nome de pessoas por uma certa idade de (Z-A), conforme criado no repositório.
    @GetMapping("/idadeNome/{idade}")
    public Iterable<PessoaModelo> idadeNome(@PathVariable int idade){
        return acao.findByIdadeOrderByNomeDesc(idade);
    }

    @GetMapping("/nomeContem/{termo}")
    public Iterable<PessoaModelo> nomeContem(@PathVariable String termo){
        return acao.findByNomeContaining(termo);
    }

    @GetMapping("/nomeInicia/{termo}")
    public Iterable<PessoaModelo> nomeInicia(@PathVariable String termo){
        return acao.findByNomeStartsWith(termo);
    }

    @GetMapping("/nomeFinaliza/{termo}")
    public Iterable<PessoaModelo> nomeFinaliza(@PathVariable String termo){
        return acao.findByNomeEndsWith(termo);
    }

    @GetMapping("/somaIdades")
    public int somaIdades(){
        return acao.somaIdades();
    }

    @GetMapping("/idadeSuperior/{idade}")
    public Iterable<PessoaModelo> idadeSuperior(@PathVariable int idade){
        return acao.idadeSuperior(idade);
    }

}
