package br.com.tdd;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controle {

    @PostMapping("/{nome}")
    public String retornaNome(@PathVariable String nome){
        return nome;
    }
}
