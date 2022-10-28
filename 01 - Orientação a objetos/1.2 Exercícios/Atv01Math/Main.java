package Atv01Math;

import javax.swing.JOptionPane;

public class Main {

	public static void main(String[] args) {
		
		String menu = "Escolha um cálculo:";
		   menu+= "\n1) Somar";
		   menu+= "\n2) Subtrair";
		   menu+= "\n3) Multiplicar";
		   menu+= "\n4) Divisão";
		   menu+= "\n5) Seno";
		  
		int calculo = Integer.parseInt(JOptionPane.showInputDialog(menu));
		
		int numero1, numero2;
		
		switch (calculo) {
		case 1:
			numero1 = Integer.parseInt(JOptionPane.showInputDialog("Informe o primeiro número"));
			numero2 = Integer.parseInt(JOptionPane.showInputDialog("Informe o segundo número"));
			
			Calculos.somar(numero1, numero2);
		break;
		
		case 2: 
			numero1 = Integer.parseInt(JOptionPane.showInputDialog("Informe o primeiro número"));
			numero2 = Integer.parseInt(JOptionPane.showInputDialog("Informe o segundo número"));
			
			Calculos.subtrair(numero1, numero2);
		break;
		
		case 3:
			numero1 = Integer.parseInt(JOptionPane.showInputDialog("Informe o primeiro número"));
			numero2 = Integer.parseInt(JOptionPane.showInputDialog("Informe o segundo número"));
			
			Calculos.multiplicar(numero1, numero2);
		break;
			
		case 4:
			numero1 = Integer.parseInt(JOptionPane.showInputDialog("Informe o primeiro número"));
			numero2 = Integer.parseInt(JOptionPane.showInputDialog("Informe o segundo número"));
			
			Calculos.dividir(numero1, numero2);
		break;
			
		case 5:
			
			numero1 = Integer.parseInt(JOptionPane.showInputDialog("Informe o primeiro número"));
			Calculos.seno(numero1);
			
		break;
		
		default:
			JOptionPane.showMessageDialog(null, "Opção não encontrada");
		}

}
}
