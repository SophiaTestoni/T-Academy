package pacote;

public class Aluno {
	
	//Atributos 
	private String nome;
	private double nota1, nota2;
	
	// Construtor
	public Aluno(String nome, double nota1, double nota2) {
		this.nome = nome;
		this.nota1 = nota1;
		this.nota2 = nota2;
	}
	
	// Calculo média
	private double media(){
		return (nota1 + nota2)/2;
		
	}
	
	//Retorno
	public String retorno(){
		String mensagem = nome + " obteve a média " + media();
		return mensagem;
	}

}
