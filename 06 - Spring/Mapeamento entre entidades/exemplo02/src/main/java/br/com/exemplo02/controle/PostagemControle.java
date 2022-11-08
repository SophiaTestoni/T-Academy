package br.com.exemplo02.controle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.exemplo02.modelo.PostagemModelo;
import br.com.exemplo02.repositorio.PostagemRepositorio;

@RestController
@RequestMapping("/postagens")
public class PostagemControle {
    
    @Autowired
    private PostagemRepositorio acao;

    @PostMapping("")
    public PostagemModelo cadastrar(@RequestBody PostagemModelo obj){
        return acao.save(obj);
    }

    @GetMapping("")
    public Iterable<PostagemModelo> selecionar(){
        return acao.findAll();

    }
}
