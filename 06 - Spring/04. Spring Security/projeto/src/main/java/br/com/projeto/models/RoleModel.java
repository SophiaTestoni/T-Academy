package br.com.projeto.models;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;

import br.com.projeto.enums.RoleName;

@Entity
@Table(name = "tb_roles")
//GrantedAuthority a role será uma informação toString para q o banco saiba que é um varChar
public class RoleModel implements GrantedAuthority {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    //Informar que meu enum será do tipo STRING
    @Enumerated(EnumType.STRING)
    private RoleName roleName;

    @Override
    //Aqui eu passo o toString para que o sistema saiba que é uma String mesmo.
    public String getAuthority() {
        return this.roleName.toString();
    }

    public long getId() {
        return this.id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public RoleName getRoleName() {
        return this.roleName;
    }

    public void setRoleName(RoleName roleName) {
        this.roleName = roleName;
    }
    
}
