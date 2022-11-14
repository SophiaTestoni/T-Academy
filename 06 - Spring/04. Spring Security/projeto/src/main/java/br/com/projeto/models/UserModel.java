package br.com.projeto.models;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@Entity
@Table(name = "tb_users")
//Quando alguém passar um user e uma senha, com o userDetails ele vai chamar as regras do security
//Pedimos para complementar alguns métodos que estão abaixo dos get n set
public class UserModel implements UserDetails{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String user;
    private String password;

    @ManyToMany
    @JoinTable(
    name = "tb_users_role",
    joinColumns = {@JoinColumn(name="user_id", referencedColumnName = "id")},
    inverseJoinColumns = {@JoinColumn(name = "role_id", referencedColumnName = "id")}
    )
    private List<RoleModel> roles = new ArrayList<>();

    public List<RoleModel> getRoles() {
        return this.roles;
    }

    public void setRoles(List<RoleModel> roles) {
        this.roles = roles;
    }

    
    public long getId() {
        return this.id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUser() {
        return this.user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    //Quais são as roles o usuário vai ter (admin? comum? ambos?)
    public Collection<? extends GrantedAuthority> getAuthorities() {
        
        return this.roles;
    }

    @Override
    //Usuário
    public String getUsername() {

        return this.user;
    }

    @Override
    public boolean isAccountNonExpired() {
        // TODO Auto-generated method stub
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        // TODO Auto-generated method stub
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        // TODO Auto-generated method stub
        return true;
    }

    @Override
    public boolean isEnabled() {
        // TODO Auto-generated method stub
        return true;
    }
    
}
