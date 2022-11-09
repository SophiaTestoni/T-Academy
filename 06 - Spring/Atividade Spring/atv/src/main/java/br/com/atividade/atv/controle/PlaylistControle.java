package br.com.atividade.atv.controle;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.atividade.atv.modelo.PlaylistModelo;
import br.com.atividade.atv.repositorio.PlaylistRepositorio;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/playlists")
public class PlaylistControle {
    
    private PlaylistRepositorio acao;

      // CADASTRAR
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

    // DELETE -- COM VALIDAÇÃO, NÃO SENDO POSSÍVEL EXCLUIR SE TIVER MÚSICA VINCULADA
   
    // ALTERA O NOME DA PLAYLIST
    @PutMapping("")
    public PlaylistModelo alterar(@RequestBody PlaylistModelo obj){
      return acao.save(obj);
  }

    //PESQUISA POR NOME DA PLAYLIST
    @GetMapping("/pesquisa/{playlist}")
    public Iterable<PlaylistModelo> pesquisa(@PathVariable String playlist){
      return acao.findByPlaylistContaining(playlist);
  }

//   //UPDATE DE MÚSICAS (incluir música para a playlist)
//   @PutMapping("/{id_artista}")
//   public PlaylistModelo alterar(@PathVariable long id_artista, @RequestBody MusicaModelo obj){
//       PlaylistModelo am = acao.findById(id_artista);
//       am.getMusicas().add(obj);
//       acao.save(am);
//       return am;
//   }

}
