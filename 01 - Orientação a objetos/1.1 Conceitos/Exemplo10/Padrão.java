package Exemplo10;

public class Padrão {
	
	//Vale-transporte
	
	public void ValeTransporte(double salario) {
		
		System.out.println("Vale transporte R$" + (salario * 0.06)); //6%
	}
	//Vale-alimentação
	
		public void ValeAlimentacao(double salario) {
			
			System.out.println("Vale alimentação R$" + (salario * 0.1)); //10%
		}

}
