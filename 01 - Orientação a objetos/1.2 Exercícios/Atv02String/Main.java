package Atv02String;

import javax.swing.JOptionPane;

public class Main {

	public static void main(String[] args) {	
		int contagem = 0; 
	      String palavra = JOptionPane.showInputDialog("Insira a palavra:"); 
	 
	       for (int i=0 ; i<palavra.length(); i++){ 
	         char v = palavra.charAt(i); 
	          if(v == 'a'|| v == 'e'|| v == 'i' ||v == 'o' ||v == 'u'){ 
	             contagem++; 
	          } 
	       } 
	       System.out.println("O número de vogais é "+contagem); 
	    } 
	 } 