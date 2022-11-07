package br.com.projeto.loja.controle;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import br.com.projeto.loja.modelo.LojaModelo;
import br.com.projeto.loja.repositorio.LojaRepositorio;

@RestController
public class LojaControle {

    @Autowired
    private LojaRepositorio acao;
   
    @GetMapping("")
    public Iterable<LojaModelo> listar(){
        return acao.findAll();
    }
    
    @PostMapping("")
    public LojaModelo cadastrar(@Valid @RequestBody LojaModelo obj){
        return acao.save(obj);
    }
}
