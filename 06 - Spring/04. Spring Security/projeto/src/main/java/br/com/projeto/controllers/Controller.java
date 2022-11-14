package br.com.projeto.controllers;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controller {

    @GetMapping("")
    public String main(){
        return "Rota pública.";
    }

    @PostMapping("")
    public String add(){
        return "Rota para efetuar um cadastro.";
    }
    
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @GetMapping("/admin")
    public String admin(){
        return "Rota exclusiva para o administrador.";
    }
    @PreAuthorize("hasRole('ROLE_USER')")
    @GetMapping("/user")
    public String user(){
        return "Rota exclusiva para o usuário comum.";
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_ADMIN')")
    @GetMapping("/all")
    public String all(){
        return "Rota exclusiva para administradores e usuários comuns.";
    }
}
