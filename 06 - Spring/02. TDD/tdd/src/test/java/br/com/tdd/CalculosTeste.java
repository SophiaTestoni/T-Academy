package br.com.tdd;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;

import org.junit.Test;

//Só vai rodar o TDD
public class CalculosTeste {

    //Método
    //Quando quero que dê erro, passo o erro que quero que aconteça
    //.class no final pois é um erro de classe.
    @Test(expected = NumberFormatException.class)
    public void efetuarTeste(){

        //Instanciar obj da classe cálculos
        Calculos c = new Calculos();
        double resultado = c.divisao("a", "2");
        //Serve para verificar se a informação está correta
        assertEquals(resultado, 5);
    }

    @Test
    public void testeControle(){
        //instanciei o objeto Controle e chamei o método de retornaNome para ele validar
        Controle c = new Controle();
        String retorno = c.retornaNome("Ana");

        //Se não for igual a null, está correto.
        //Também pode ser utilizar o not null
        assertNotEquals(retorno, null);
    }
    
}
