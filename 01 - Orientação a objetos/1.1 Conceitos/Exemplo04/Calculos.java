package Exemplo04;

public class Calculos {
	
	// atributo contador
	private static int contador = 0;
	
	// construtor
	
	public Calculos() {
		
		contador++;
		System.out.println(contador);
	}

	// metodo de soma
	
	// static: nao precisa criar um objeto, assim nao instanciando (new)
	public static void soma(int n1, int n2) {
		
		System.out.println(n1 + n2);
		
	}
}
