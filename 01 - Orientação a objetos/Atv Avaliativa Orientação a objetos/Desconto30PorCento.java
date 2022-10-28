package AtvAvaliativaF;

//Polimorfismo - desconto de 30% implementando a interface de Desconto igual o de 10%
public class Desconto30PorCento implements Desconto {
	
	public double CalcularDesconto(double valor) {
        return valor * 0.7;
    }
}
