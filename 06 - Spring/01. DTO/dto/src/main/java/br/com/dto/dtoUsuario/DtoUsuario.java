package br.com.dto.dtoUsuario;

import br.com.dto.modelo.UsuarioModelo;

public class DtoUsuario {

    //Atributos
    private String nome;
    private String email;
    private String senha;
    private String nivel; 
    
    //Get e Set
    public String getNome() {
        return this.nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return this.senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getNivel() {
        return this.nivel;
    }

    public void setNivel(String nivel) {
        this.nivel = nivel;
    }

    //Método para transformar em um objeto do tipo UsuarioModelo
    //Esse método irá executar o construtor do UsuarioModelo
    public UsuarioModelo transformarUsuarioModelo(){
        return new UsuarioModelo(nome, email, senha, nivel);

    }
}
