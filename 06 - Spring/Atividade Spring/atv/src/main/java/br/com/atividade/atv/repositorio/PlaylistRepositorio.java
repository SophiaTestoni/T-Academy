package br.com.atividade.atv.repositorio;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.atividade.atv.modelo.PlaylistModelo;

@Repository
public interface PlaylistRepositorio extends CrudRepository<PlaylistModelo, Long> {

    PlaylistModelo findById(long id);

    Iterable<PlaylistModelo>findByPlaylistContaining(String playlist);

    @Query(value = "DELETE FROM playlists_musicas WHERE codigo_musica = ? AND codigo_playlist = ?", nativeQuery = true)
    void removerMusicaPlaylist(long codigoMusica, long codigoPlaylist);
    
}
