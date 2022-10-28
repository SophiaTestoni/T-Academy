package AtvAvaliativaF;

public class Validation {
	
// Classe para validar os caracteres - não pode cadastrar marcas com menos de 2 caracteres e mais de 40

    public static boolean ValidateNomeMarca(String valor){
    	
        if (valor == "" ||  valor.length() < 2  || valor.length() > 40) {
            return false;
        }
        return true;
    }
}
