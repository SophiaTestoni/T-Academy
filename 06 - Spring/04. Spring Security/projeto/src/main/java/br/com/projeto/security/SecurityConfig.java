package br.com.projeto.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
// import org.springframework.security.core.userdetails.User;
//  import org.springframework.security.core.userdetails.UserDetails;
// import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
// import org.springframework.security.provisioning.InMemoryUserDetailsManager;

//Sobreescrever caracteristicas de depencias do spring security utilizar o Configuration
import org.springframework.security.web.SecurityFilterChain;
@Configuration
//EnableGlobalMethodSecurity informará que o Controller terá acesso aos roles, user e passwords
//que criamos abaixo
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig {

    //Método para validar requisições/rotas
    //throws Exception Irá funcionar como um try catch
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
       
        //Configurar o HTTP (se a rota estará livre ou não)
        http
        //sempre ter um httpBasic no spring security (basicamente um padrão)
        .httpBasic()
        .and()
        //authorizeHttpRequests() = através de uma requisição http haverá uma filtragem
        //anyRequest() = qualquer rota e qualquer requisição (delete, post, put, etc) farão parte dessa filtragem
        //authenticated() = para informar qm poderá ou não acessar
        //nas versões antigas havia o .permitAll() que permitia que todas as rotas pudessem ser acessadas
        .authorizeHttpRequests().anyRequest().authenticated();

        //Retorno
        return http.build();
    }

    //Método para permitir acesso sem precisar de autenticação
    @Bean // << @Autowired de método
    //Vai ignorar no authenticated() quando a rota estiver vazia ("/")
    public WebSecurityCustomizer webSecurityCustomizer(){
        return(web)-> web.ignoring().antMatchers("/");
    }

    // //Criação de credenciais em mémoria
    // @Bean
    // //UserDetailsService essa é a classe que rege as credenciais
    // public UserDetailsService users(){
    //     //Criar usuário do tipo administrador -- o User do user.builder é do security
    //     UserDetails admin = User.builder()
    //     .username("admin")
    //     .password(passwordEncoder().encode("123"))
    //     //No security todos os roles PRECISAM ser em LETRA MAIÚSCULA
    //     .roles("ADMIN")
    //     .build();

    //     //Criar usuário simples -- o User do user.builder é do security
    //     UserDetails user = User.builder()
    //     .username("user")
    //     .password(passwordEncoder().encode("abc"))
    //     //No security todos os roles PRECISAM ser em LETRA MAIÚSCULA
    //     .roles("USER")
    //     .build();

    //     //Retorno
    //     return new InMemoryUserDetailsManager(admin,user);
    // }

    //Criptografar senha
    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }
}
