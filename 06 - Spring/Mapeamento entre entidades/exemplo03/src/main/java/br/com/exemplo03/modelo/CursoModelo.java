package br.com.exemplo03.modelo;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "cursos")
public class CursoModelo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long codigo;
    private String curso;

    //Para que o spring nao crie duas tabelas auxiliares eu informo no mappedBy o nome 
    // que dei no AlunoModelo do arraylist para passar que já está mapeado e nao precisa criar duas tabelas
    // iguais auxiliares.
    @ManyToMany(mappedBy = "cursos")
    private List<AlunoModelo> alunos = new ArrayList<>();


    public long getCodigo() {
        return this.codigo;
    }

    public void setCodigo(long codigo) {
        this.codigo = codigo;
    }

    public String getCurso() {
        return this.curso;
    }

    public void setCurso(String curso) {
        this.curso = curso;
    }

    public List<AlunoModelo> getAlunos() {
        return this.alunos;
    }

    public void setAlunos(List<AlunoModelo> alunos) {
        this.alunos = alunos;
    }

    
}
