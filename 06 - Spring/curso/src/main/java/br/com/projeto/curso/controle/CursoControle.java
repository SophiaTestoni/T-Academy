package br.com.projeto.curso.controle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import br.com.projeto.curso.modelo.CursoModelo;
import br.com.projeto.curso.servico.CursoServico;

@RestController
public class CursoControle {

    @Autowired
    private CursoServico servico;
    
    @PostMapping("")
    public ResponseEntity<?> cadastrar(@RequestBody CursoModelo obj){
        return servico.cadastrar(obj);
    }

    @GetMapping("")
    public ResponseEntity<?> selecionar(){
        return servico.selecionar();
    }

    @DeleteMapping("/{codigo}")
    public ResponseEntity<?> remover(@PathVariable long codigo){
        return servico.remover(codigo);
        
    }
}
