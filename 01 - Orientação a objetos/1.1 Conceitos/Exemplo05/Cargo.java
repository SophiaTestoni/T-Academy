package Exemplo05;

import javax.swing.JOptionPane;

public class Cargo extends Colaborador {
	
	//Atributos
	private String cargo;
	private double salario;
	
	// metodo para obter o cargo e a salário
	private void obterDadosCargo() {
		
		cargo = JOptionPane.showInputDialog("Informe o cargo");
		salario = Double.parseDouble(JOptionPane.showInputDialog("Informe o salário"));

}
	
	// construtor
	public Cargo() {
	obterDadosColaborador();
	obterDadosCargo();
	
	System.out.println("Nome" + nome);
	System.out.println("Idade" + idade);
	System.out.println("Cargo" + cargo);
	System.out.println("Salário" + salario);
	
	
	}
}