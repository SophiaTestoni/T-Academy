package AtvAvaliativaF;

public class Produto {

// Getters n Setters Produto - Atributos da classe Produto
	private String nome;
    private double preco;
    private Marca marca; // Um produto precisa ter marca
    
// Usando this. para mostrar que não são variáveis simples e sim da classe Produto

    public Produto(String nome, double preco, Marca marca){
        this.nome = nome;
        this.preco = preco;
        this.marca = marca;
    }
// Retornando vazio para poder instanciar no menu
    public Produto() {
     	
    }

    public void setMarca(Marca m){
        this.marca = m;
    }

    public Marca getMarca(){
        return this.marca;
    }

    public void setNome(String nome){
        this.nome = nome;
    }

    public String getNome()  {
        return this.nome;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public double getPreco() {
        return this.preco;
    }
}

