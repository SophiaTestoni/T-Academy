package br.com.crud.produto.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

// criar tabela no banco de dados -> Entity // a Table irá renomear a tabela
@Entity 
@Table(name = "produtos")
public class ProdutoModelo {

    @Id // o ID está fazendo a Primary Key
    @GeneratedValue(strategy = GenerationType.IDENTITY) // E aqui está gerando o auto_increment
    private int codigo;
    private String nome;
    private double valor;

    // Getters n Setters 
    public int getCodigo() {
        return this.codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNome() {
        return this.nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getValor() {
        return this.valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

}
