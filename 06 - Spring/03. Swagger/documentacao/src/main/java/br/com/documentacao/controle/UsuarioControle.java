package br.com.documentacao.controle;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UsuarioControle {

    @PostMapping("")
    public void cadastrar(){}

    @GetMapping("")
    public void selecionar(){}

    @PutMapping("")
    public void alterar(){}

    @DeleteMapping("")
    public void remover(){}

    @PostMapping("/{nome}")
    public String exibirNome(@PathVariable String nome){
        return nome;
    }
    
}
