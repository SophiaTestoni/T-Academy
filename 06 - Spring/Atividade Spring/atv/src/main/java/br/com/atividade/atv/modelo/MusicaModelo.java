package br.com.atividade.atv.modelo;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "musicas")
public class MusicaModelo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String musica;
    private String link;

    //Para que o spring nao crie duas tabelas auxiliares eu informo no mappedBy o nome 
    // que dei no AlunoModelo do arraylist para passar que já está mapeado e nao precisa criar duas tabelas
    // iguais auxiliares.
    @ManyToMany(mappedBy = "musicas")
    private List<PlaylistModelo> musicas = new ArrayList<>();

    public long getId() {
        return this.id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getMusica() {
        return this.musica;
    }

    public void setMusica(String musica) {
        this.musica = musica;
    }

    public String getLink() {
        return this.link;
    }

    public void setLink(String link) {
        this.link = link;
    }
}
