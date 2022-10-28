package Exemplo03;

public class Acao {
	
	//construtor
	
	public Acao() {
		
		System.out.println("Construtor executado!");
	}
	
	public Acao(String nome) {
		
		System.out.println("Bom dia! " + nome);
	}
	
	public Acao(String nome, int idade) {
		
		System.out.println("Olá! " + nome + "sua idade é " + idade + ".");
	}
}
