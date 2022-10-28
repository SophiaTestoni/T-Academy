package AtvOOb03;

import javax.swing.JOptionPane;

public class Main {

	public static void main(String[] args) {
		
		int mes = Integer.parseInt(JOptionPane.showInputDialog("Informe um mês"));
		//int mes = 0;
		int dia = Integer.parseInt(JOptionPane.showInputDialog("Informe um dia"));
	
		retornaDia(mes, dia);
}

	public static void retornaDia(int mes, int dia){
	
	if(mes > 1 && mes <= 12) {
		
		mes = mes -= 1;
		System.out.println(mes);
	}
	
	else {
		
		JOptionPane.showMessageDialog(null, "Mês inválido");
	}
		if(dia > 1 && dia <= 31) {
			
			dia = dia -= 1;
			System.out.println(dia);
			
		} else if (dia == 1) {
			
			dia = 31;
			System.out.println(dia);
			
		} 
			
}
}