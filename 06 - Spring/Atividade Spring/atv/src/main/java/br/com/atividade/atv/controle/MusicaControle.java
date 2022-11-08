package br.com.atividade.atv.controle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.atividade.atv.modelo.MusicaModelo;
import br.com.atividade.atv.repositorio.MusicaRepositorio;

@RestController
@RequestMapping("/musicas")
public class MusicaControle {

    @Autowired
    private MusicaRepositorio acao;

    @PostMapping("")
    public MusicaModelo cadastrar(@RequestBody MusicaModelo obj){
        return acao.save(obj);
    }

    @GetMapping("")
    public Iterable<MusicaModelo> selecionar(){
        return acao.findAll();
    }
    
}
