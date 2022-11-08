package br.com.crud.produto.controle;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import br.com.crud.produto.modelo.ProdutoModelo;
import br.com.crud.produto.repositorio.ProdutoRepositorio;

@RestController
@CrossOrigin(origins = "*")
public class ProdutoControle {
    //Injeção de dependência - acesso a todas as funcionalidades do repositório - @AUTOWIRED
    @Autowired
    private ProdutoRepositorio pr;
  
    @GetMapping("") // SELECT - seleção
    //Iterable -> ele cria o objeto, executa e exclui da memória 
    public Iterable<ProdutoModelo> listar(){
        return pr.findAll();
    }

    //PostMapping é para cadastrar no DB - No corpo da requisição está enviando algum objeto
    @PostMapping("") // CADASTRAR
    public ProdutoModelo cadastrar(@RequestBody ProdutoModelo obj){
        return pr.save(obj);
    }

    @PutMapping("") //ATUALIZA - Caso passe um dado que não existe, ele cadastra mas se passar o objeto completo
    // ele vai vai alterar
    public ProdutoModelo alterar(@RequestBody ProdutoModelo obj){
        return pr.save(obj);
    }

    @DeleteMapping("{codigo}") // DELETE -- o deleteMapping não retorna parametros
    public void remover(@PathVariable int codigo){
        pr.deleteById(codigo);
    }

    @GetMapping("{codigo}") // FILTRO - COMO UM WHERE
    public Optional<ProdutoModelo> filtrar(@PathVariable int codigo){
        return pr.findById(codigo);

    }
}
