package AtvOOb02;

public class Main {

	public static void main(String[] args) {
		
		double montante; // quantia em valor final de cada ano
		double inicial = 1000.0; // quantidade inicial antes dos juros
        double juros = 0.00583; // taxa de juros
       
		
        //calculando 1 ano de juros até 10 anos
        for (int meses = 1 ; meses <= 12 ; meses++) {
        	inicial+= inicial * juros;
        	System.out.printf("%.2f %n", inicial);
        					// duas casas depois da virgula
        	

	}

}
}
