package br.com.exemplo02.modelo;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "postagens")
public class PostagemModelo {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long codigo;
    private String titulo;
    private String texto;
    //Lista de objetos diferentes java.util
    //Uma postagem pode ter vários comentarios - Criar uma coluna de codigo_postagem
    @OneToMany
    @JoinColumn(name = "codigo_postagem")
    private List<ComentarioModelo> comentarios;

    public long getCodigo() {
        return this.codigo;
    }

    public void setCodigo(long codigo) {
        this.codigo = codigo;
    }

    public String getTitulo() {
        return this.titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getTexto() {
        return this.texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public List<ComentarioModelo> getComentarios() {
        return this.comentarios;
    }

    public void setComentarios(List<ComentarioModelo> comentarios) {
        this.comentarios = comentarios;
    }
}
