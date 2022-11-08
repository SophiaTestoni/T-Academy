package br.com.atividade.atv.controle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.atividade.atv.modelo.ArtistaModelo;
import br.com.atividade.atv.repositorio.ArtistaRepositorio;


@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/artistas")
public class ArtistaControle {
    
    @Autowired
    private ArtistaRepositorio acao;

    // CADASTRO
    @PostMapping("")
    public ArtistaModelo cadastrar(@RequestBody ArtistaModelo obj){
        return acao.save(obj);
    }
    //MOSTRAR TODOS
    @GetMapping("")
    public Iterable<ArtistaModelo> selecionar(@RequestBody ArtistaModelo obj){
        return acao.findAll();
    }

    //UPDATE DE MÚSICAS
    
}
