package br.com.projeto.pessoa.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity // pra gerar tabela no banco
@Table(name = "pessoas")
public class PessoaModelo {

    @Id // chave primária
    @GeneratedValue(strategy = GenerationType.IDENTITY) // auto incremento
    private long codigo;
    private String nome;
    private int idade;

    public long getCodigo() {
        return this.codigo;
    }

    public void setCodigo(long codigo) {
        this.codigo = codigo;
    }

    public String getNome() {
        return this.nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getIdade() {
        return this.idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }
}
