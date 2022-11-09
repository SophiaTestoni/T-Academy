package br.com.atividade.atv.modelo;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "playlists")
public class PlaylistModelo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String playlist;

    @ManyToMany
    @JoinTable(
        name = "playlists_musicas", 
        joinColumns = {@JoinColumn(name = "codigo_playlist", referencedColumnName = "id")}, 
        inverseJoinColumns = {@JoinColumn(name = "codigo_musica", referencedColumnName = "id")}
    )
    private List<MusicaModelo> musicas = new ArrayList<>();

    public long getId() {
        return this.id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getPlaylist() {
        return this.playlist;
    }

    public void setPlaylist(String playlist) {
        this.playlist = playlist;
    }

    public List<MusicaModelo> getMusicas() {
        return this.musicas;
    }

    public void setMusicas(List<MusicaModelo> musicas) {
        this.musicas = musicas;
    }
    
}
