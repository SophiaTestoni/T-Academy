package br.com.dto.controle;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import br.com.dto.dtoUsuario.DtoUsuario;
import br.com.dto.dtoUsuario.RetornoDtoUsuario;
import br.com.dto.modelo.UsuarioModelo;
import br.com.dto.repositorio.UsuarioRepositorio;

@RestController
public class UsuarioControle {
    
    @Autowired
    private UsuarioRepositorio usuarioRepositorio;

    @PostMapping("")
    //Chamo no requestBody o DTO mas como nosso repositorio é do tipo UsuarioModelo,
    //Com o método criado no DTOUsuario, eu passo o método para retornar o padrão criado
    //Com construtor e método criado no RetornoDtoUsuario, eu passo o método para que mostre somente
    //conteúdos que declarei não sensíveis.
    public RetornoDtoUsuario cadastrar(@RequestBody DtoUsuario dtoUsuario){
        //Vai salvar as informações conforme padrão criado (mesmo que eu passe adm vai ser usuário).
        UsuarioModelo usuarioModelo = usuarioRepositorio.save(dtoUsuario.transformarUsuarioModelo());
        //Vai retornar apenas as informações que eu permito serem visualizadas (sem a senha).
        return RetornoDtoUsuario.retornoDTO(usuarioModelo);

    }

}
