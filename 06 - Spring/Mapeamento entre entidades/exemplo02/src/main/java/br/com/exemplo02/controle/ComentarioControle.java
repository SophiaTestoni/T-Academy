package br.com.exemplo02.controle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.exemplo02.modelo.ComentarioModelo;
import br.com.exemplo02.repositorio.ComentarioRepositorio;

@RestController
@RequestMapping("/comentarios")
public class ComentarioControle {

    @Autowired
    private ComentarioRepositorio acao;

    @PostMapping("")
    public ComentarioModelo cadastrar(@RequestBody ComentarioModelo obj){
        return acao.save(obj);
    }
    @GetMapping("")
    public Iterable<ComentarioModelo> selecionar(){
        return acao.findAll();
    }
}
