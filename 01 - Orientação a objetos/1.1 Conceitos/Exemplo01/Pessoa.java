package Exemplo01;

import javax.swing.JOptionPane;

public class Pessoa {

	// Atributos (caracteristicas)

	String nome;
	int idade;
	double altura;
	
	// metodo para obter os dados
	
	void obterDados() {
		
		nome = JOptionPane.showInputDialog("Infome seu nome:");
		idade = Integer.parseInt(JOptionPane.showInputDialog("Infome sua idade:"));
		altura = Double.parseDouble(JOptionPane.showInputDialog("Infome sua altura:"));
		
		
	}
		// metodo para retornar os dados
	void retornarDados() {
		
		String mensagem = "Nome: " + nome;
			   mensagem+= "\nIdade: " + idade;
			   mensagem+= "\nAltura: " + altura;
			   
			   JOptionPane.showMessageDialog(null, mensagem);
	}
}
