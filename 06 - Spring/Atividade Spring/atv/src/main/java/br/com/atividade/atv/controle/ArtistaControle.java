package br.com.atividade.atv.controle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.atividade.atv.modelo.ArtistaModelo;
import br.com.atividade.atv.modelo.MusicaModelo;
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
    //LISTAR TODAS OS ARTISTAS
    @GetMapping("")
    public Iterable<ArtistaModelo> selecionar(){
        return acao.findAll();
    }

    //FILTRAR POR ID
    @GetMapping("/{id}") // FILTRO - COMO UM WHERE
    public ArtistaModelo filtrar(@PathVariable long id){
        return acao.findById(id);
    }

    // DELETE -- COM VALIDAÇÃO, NÃO SENDO POSSÍVEL EXCLUIR SE TIVER MÚSICA VINCULADA
    @DeleteMapping("/{id}")
    public void remover(@PathVariable long id){
        ArtistaModelo am = acao.findById(id);
        if(am.getMusicas().size() == 0){
            acao.deleteById(id);
        }else{
            throw new IllegalArgumentException("Há música(s) vinculada(s) nesse artista");
    }
}

    // ALTERA O NOME DO ARTISTA
    @PutMapping("")
    public ArtistaModelo alterar(@RequestBody ArtistaModelo obj){
        return acao.save(obj);
    }

    //PESQUISA POR NOME DO ARTISTA
    @GetMapping("/pesquisa/{artista}")
    public Iterable<ArtistaModelo> pesquisa(@PathVariable String artista){
        return acao.findByArtistaContaining(artista);
    }

    //UPDATE DE MÚSICAS (incluir música para o artista)
    @PutMapping("/{id_artista}")
    public ArtistaModelo alterar(@PathVariable long id_artista, @RequestBody MusicaModelo obj){
        ArtistaModelo am = acao.findById(id_artista);
        am.getMusicas().add(obj);
        acao.save(am);
        return am;
    }
}
