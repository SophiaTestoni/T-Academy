package br.com.projeto.loja.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "loja")
@Getter
@Setter
public class LojaModelo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long codigo;

    @NotEmpty(message = "Informe o nome do produto.") // obrigando que o campo produto nao pode ser null
    @Length(min = 3, message = "O nome do produto precisa ter pelo menos três caracteres.")
    private String produto;

    @Min(value = 1, message = "O produto precisa custar pelo menos R$ 1,00.")
    private double valor;
    
}
