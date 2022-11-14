package br.com.projeto.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.projeto.models.UserModel;
import br.com.projeto.repositories.UserRepository;

//UserDetailsServicesImpl > pois vamos implementar/alterar algumas características dessa classe
// que já existe no security mas trabalha com dados em memória (e queremos no banco)
@Service
//Se não usar Transactional ele não vai localizar o user e a role, ele procura na tabela e depois
//continua executando o programa
@Transactional
public class UserDetailsServicesImpl implements UserDetailsService{

    @Autowired
    private UserRepository userRepository;

    @Override
    //loadUserByUsername vai pegar o username
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        UserModel userModel = userRepository.findByUser(username)
        .orElseThrow(() -> new UsernameNotFoundException("Usuário não encontrado"));
        
        return new User(
            userModel.getUser(), 
            userModel.getPassword(), 
            true, 
            true, 
            true, 
            true, 
            userModel.getAuthorities());
    }
}
