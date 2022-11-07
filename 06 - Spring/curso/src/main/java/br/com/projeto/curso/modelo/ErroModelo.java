package br.com.projeto.curso.modelo;

import org.springframework.stereotype.Component;

//Validações
@Component // modelo que não gera tabela no banco e pode retornar mensagem de erro sendo necessário
// @JavaBean <= esse é a mesma coisa mas é mais antigo
public class ErroModelo {

    //Atributo de mensagem
    private String mensagem;

    public String getMensagem() {
        return this.mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }
    
}
