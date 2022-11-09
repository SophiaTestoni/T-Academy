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

import br.com.atividade.atv.modelo.MusicaModelo;
import br.com.atividade.atv.repositorio.MusicaRepositorio;

@RestController
@RequestMapping("/musicas")
@CrossOrigin(origins = "*")
public class MusicaControle {

    @Autowired
    private MusicaRepositorio acao;

    // CADASTRAR
    @PostMapping("")
    public MusicaModelo cadastrar(@RequestBody MusicaModelo obj){
        return acao.save(obj);
    }

    // LISTAR TODAS AS MÚSICAS
    @GetMapping("")
    public Iterable<MusicaModelo> selecionar(){
        return acao.findAll();
    }

     //FILTRAR POR ID
    @GetMapping("/{id}") // FILTRO - COMO UM WHERE
    public MusicaModelo filtrar(@PathVariable long id){
        return acao.findById(id);
    }

    // DELETE
    @DeleteMapping("/{id}")
    public void remover(@PathVariable long id){
        acao.deleteById(id);
    }

     // ALTERA O NOME DA MÚSICA
     @PutMapping("")
     public MusicaModelo alterar(@RequestBody MusicaModelo obj){
         return acao.save(obj);
     }

    //PESQUISA POR NOME DA MUSICA
    @GetMapping("/pesquisa/{musica}")
    public Iterable<MusicaModelo> pesquisa(@PathVariable String musica){
        return acao.findByMusicaContaining(musica);
    }
    
}
