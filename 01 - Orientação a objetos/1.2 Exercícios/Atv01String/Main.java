package Atv01String;

import javax.swing.JOptionPane;

public class Main {

	public static void main(String[] args) {
		
		//String palavra = "proway";
		String palavra = JOptionPane.showInputDialog("Informe a palavra:");
		
		//Laço for
		
		for(int i = 0; i < palavra.length(); i++) {
			//System.out.println(palavra.charAt(i));
			
			String letra = String.valueOf(palavra.charAt(i));
			
			if(i % 2 ==0) {
				
				System.out.println(letra.toUpperCase());
			} else {
				
				System.out.println(letra.toLowerCase());
				
			}
			
		}
		
		
		
		

	}

}
