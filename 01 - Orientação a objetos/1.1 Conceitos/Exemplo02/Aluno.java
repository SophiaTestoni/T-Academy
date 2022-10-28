package Exemplo02;

import javax.swing.JOptionPane;

public class Aluno {
	
	/* DEFAULT: Quando nao especifica o modificador de acesso
	 * PUBLIC: Publico: vou poder visualizar atributos e objetos dentro de diferentes projetos
	 * PRIVATE: Privado: atributos visiveis apenas nas classes que foram criados
	 * PROTECTED: Protegido: ficam visiveis apenas do mesmo pacote, mas se a classe tiver
 sido _herdado_ em outro pacote tbm fica visível */
	
	// atributos
	private String nome;
	private double nota1, nota2;
	
	// metodo para obter os dados do aluno
	
	private void obterDados() {
		
		nome = JOptionPane.showInputDialog("Informe o nome do aluno:");
		nota1 = Double.parseDouble(JOptionPane.showInputDialog("Primeira nota:"));
		nota2 = Double.parseDouble(JOptionPane.showInputDialog("Segunda nota:"));
		
	}
	
	// metodo de média - sempre que nao usar o void, usar o return
	private double media() {
		
		return (nota1 + nota2)/2;
	}
	
	// situação do aluno
	
	private String situacao(double media) {
		// substituiu if (se chama ternário)
		return media >=7 ? "aprovado(a)" : "reprovado(a)";
		
	}

	// metodo de mensagem
	
	private void mensagem() {
	
	JOptionPane.showMessageDialog(null, nome + "obteve a média " + media() + "e está" + situacao(media()));

	}
	
	// Iniciar o sistema
	
	public void iniciar() {
		
		obterDados();
		mensagem();
	}
	

}
