package br.com.servico1.controle;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controle {

    @GetMapping("/verificar/{numero}")
    public String parImpar(@PathVariable int numero){
        return numero % 2 == 0 ? "O número é par." : "O número é ímpar.";
    }

    
}
