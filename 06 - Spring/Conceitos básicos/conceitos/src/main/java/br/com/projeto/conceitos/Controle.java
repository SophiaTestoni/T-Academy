package br.com.projeto.conceitos;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/principal")
public class Controle {
    
    @GetMapping("")
    public String inicio(){
        return "Hello World!";

    }

    @GetMapping("/sobre")
    public String sobre(){
        return "Sobre o projeto...";

    }

    @GetMapping("/contato")
    public String contato(){
        return "Fale conosco.";

    }
}
