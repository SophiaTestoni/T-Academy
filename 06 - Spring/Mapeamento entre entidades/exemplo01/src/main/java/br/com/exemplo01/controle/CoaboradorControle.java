package br.com.exemplo01.controle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.exemplo01.modelo.ColaboradorModelo;
import br.com.exemplo01.repositorio.ColaboradorRepositorio;

@RestController
@RequestMapping("/colaboradores")
public class CoaboradorControle {

    @Autowired
    private ColaboradorRepositorio acao;

    @PostMapping("")
    public ColaboradorModelo cadastrar(@RequestBody ColaboradorModelo obj){
        return acao.save(obj);
    }

    @GetMapping("")
    public Iterable<ColaboradorModelo> selecionar(){
        return acao.findAll();
    }
    
}
