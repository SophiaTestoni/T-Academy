package br.com.exemplo03.modelo;

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
@Table(name = "alunos")
public class AlunoModelo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long codigo;
    private String aluno;

    @ManyToMany
    @JoinTable(
        name = "tabela_auxiliar", //Faz um codigo_aluno na tabela auxiliar e referencia o codigo do alunos
        joinColumns = {@JoinColumn(name = "codigo_aluno", referencedColumnName = "codigo")}, 
                                //Faz um codigo_aluno na tabela auxiliar e referencia o codigo do cursos
        inverseJoinColumns = {@JoinColumn(name = "codigo_curso", referencedColumnName = "codigo")}
        //O join pega as infos do modeloa atual e o inverse pega do array
    )
    //Se não tiver o ArrayList nesse caso senão não gera a tabela auxiliar
    private List<CursoModelo> cursos = new ArrayList<>();



    public long getCodigo() {
        return this.codigo;
    }

    public void setCodigo(long codigo) {
        this.codigo = codigo;
    }

    public String getAluno() {
        return this.aluno;
    }

    public void setAluno(String aluno) {
        this.aluno = aluno;
    }

    public List<CursoModelo> getCursos() {
        return this.cursos;
    }

    public void setCursos(List<CursoModelo> cursos) {
        this.cursos = cursos;
    }
    
}
