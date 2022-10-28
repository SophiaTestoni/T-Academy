package Exemplo05;

import javax.swing.JOptionPane;

public class Colaborador {

	//Atributos
	protected String nome;
	protected int idade;
	
	// metodo para obter o nome e a idade
	protected void obterDadosColaborador() {
		
		nome = JOptionPane.showInputDialog("Informe o nome");
		idade = Integer.parseInt(JOptionPane.showInputDialog("Informe a idade"));
	}
}
