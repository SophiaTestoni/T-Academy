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
import br.com.atividade.atv.modelo.PlaylistModelo;
import br.com.atividade.atv.repositorio.PlaylistRepositorio;

@RestController
@RequestMapping("/playlists")
@CrossOrigin(origins = "*")
public class PlaylistControle {
    
    @Autowired
    private PlaylistRepositorio acao;

    // CADASTRAR - CRIAR PLAYLIST
    @PostMapping("")
    public PlaylistModelo cadastrar(@RequestBody PlaylistModelo obj){
        return acao.save(obj);
      }

    //LISTAR TODAS AS PLAYLISTS
    @GetMapping("")
    public Iterable<PlaylistModelo> selecionar(){
        return acao.findAll();
    }

    //FILTRAR POR ID
    @GetMapping("/{id}") // FILTRO - COMO UM WHERE
    public PlaylistModelo filtrar(@PathVariable long id){
        return acao.findById(id);
    }

    //PESQUISA POR NOME DA PLAYLIST
    @GetMapping("/pesquisa/{playlist}")
    public Iterable<PlaylistModelo> pesquisa(@PathVariable String playlist){
      return acao.findByPlaylistContaining(playlist);
  }
    
    // ALTERA O NOME DA PLAYLIST
    @PutMapping("/alterarPlaylist")
    public PlaylistModelo alterar(@RequestBody PlaylistModelo obj){
      return acao.save(obj);
  }

    //UPDATE DE MÚSICAS (incluir música para a playlist)
    @PutMapping("/{id}")
    public PlaylistModelo alterar(@PathVariable long id, @RequestBody MusicaModelo obj){
      PlaylistModelo am = acao.findById(id);
      am.getMusicas().add(obj);
      acao.save(am);
      return am;
  }

    // RETIRA A MÚSICA DA PLAYLIST e não do banco
    @PutMapping("/removerMusicaPlaylist/{id}")
    public int removerMusicaPlaylist(@PathVariable long id, @RequestBody MusicaModelo obj) {
      PlaylistModelo pm = acao.findById(id);
      int indice = -1;
      for(int i=0; i<pm.getMusicas().size(); i++){
          if(obj.getId() == pm.getMusicas().get(i).getId()){
              pm.getMusicas().remove(i);
          }
      }
        acao.save(pm);
        return indice;
  }
 
    // DELETE PLAYLIST
    @DeleteMapping("remover/{id}")
    public void remover(@PathVariable long id){
      acao.deleteById(id);
  }
}

