package Atv02Math;

import javax.swing.JOptionPane;

public class Atv02 {

	public static void main(String[] args) {
	
		int limiteMinimo = 0;
		int limiteMaximo = 100;
		int i = 0;
		int contador = 0;
		int palpite = 0;
		int diferenca = 0;
		
		double aleatorio = Math.random();
		
		int numeroGerado = (int) Math.round(limiteMinimo + aleatorio * limiteMaximo);
		
		System.out.println(numeroGerado);
		
		// laço
		
		do {
		
		// Contador
		contador++;

	
		// Obter palpite
		
		boolean validaPalpite = false;
		
		do {
			palpite = Integer.parseInt(JOptionPane.showInputDialog("Informe um número"));
			
			if(palpite < 1 || palpite > 100) {
				
				JOptionPane.showMessageDialog(null, "Número inválido, escolha um número entre 1 e 100!");
			} else {
				
				validaPalpite = true;
			}
			
		} while(validaPalpite = false);
		
		
		// Diferença
		
		if(palpite > numeroGerado) {
			
		diferenca = palpite - numeroGerado;
		
		} else {
			
			diferenca = numeroGerado - palpite;
		}
		
		//Dicas
		
		if(diferenca ==0) {
			
			JOptionPane.showMessageDialog(null, "Você acertou!");
		} 
		
		else if(diferenca <=10) {
			
			JOptionPane.showMessageDialog(null, "Você está perto");
			
		} else if(diferenca <=20) {
			
			JOptionPane.showMessageDialog(null, "Você está longe");
		}else {
			
			JOptionPane.showMessageDialog(null, "Você está muito longe");
		}
			
		} while(palpite != numeroGerado);
	}

}
