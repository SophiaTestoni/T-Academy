package AtvAvaliativaF;

//Polimorfismo - desconto de 10% implementando a interface de Desconto

public class Desconto10PorCento implements Desconto {
	
	 public double CalcularDesconto(double valor) {
         return valor * 0.9;
     }
}
