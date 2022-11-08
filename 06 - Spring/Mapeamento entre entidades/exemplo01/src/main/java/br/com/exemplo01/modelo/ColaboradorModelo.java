package br.com.exemplo01.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "colaboradores")
public class ColaboradorModelo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long codigo;
    private String nome;
    //Dessa forma criamos uma chave estrangeira - podendo extrair o codigo do CargoModelo.
    @OneToOne
    //Nome da coluna e informação caracteristica que será utilizado para gerar a chave estrangeira.
    //Ele cria uma coluna nova na tabela colaboradores que irá refereciar o "codigo" da tabela de cargos, devido ao OneToOne.
    @JoinColumn(name = "codigo_cargo", referencedColumnName = "codigo")
    private CargoModelo cargo;

    public long getCodigo() {
        return this.codigo;
    }

    public void setCodigo(long codigo) {
        this.codigo = codigo;
    }

    public String getNome() {
        return this.nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public CargoModelo getCargo() {
        return this.cargo;
    }

    public void setCargo(CargoModelo cargo) {
        this.cargo = cargo;
    }
    
}
