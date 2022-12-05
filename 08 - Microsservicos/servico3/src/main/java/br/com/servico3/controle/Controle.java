package br.com.servico3.controle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class Controle {

    @Autowired
    private RestTemplate restTemplate;

    @GetMapping("/")
    public String inicio(){
        return "Hello World!";
    }

    @GetMapping("/{numero}")
    public String chamarServico(@PathVariable int numero){
        String servico1 = restTemplate.getForObject("http://servico1/verificar/{numero}", String.class, numero);
        String servico2 = restTemplate.getForObject("http://servico2/verificar/{numero}", String.class, numero);

        return servico1 + "<hr>" + servico2;

    }

    
}
