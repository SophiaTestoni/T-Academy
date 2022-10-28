package AtvAvaliativaF;

//Getters n Setters Marca

public class Marca {
	
	
	private String nome;

 public Marca(String nome)
 {
     this.nome = nome;
 }
 
//Retornando vazio para poder instanciar no menu
 public Marca() {
 	
 }

 public void setNome(String nome)
 {
     this.nome = nome;
 }

 public String getNome()
 {
     return this.nome;
 }

}
