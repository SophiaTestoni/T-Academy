package br.com.projeto;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootApplication
public class ProjetoApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProjetoApplication.class, args);

		//Criptografia
		System.err.println("Administrador -> " + new BCryptPasswordEncoder().encode("123"));
		System.err.println("Usuário -> " + new BCryptPasswordEncoder().encode("abc"));


	}

}
