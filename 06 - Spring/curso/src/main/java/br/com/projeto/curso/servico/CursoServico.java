package br.com.projeto.curso.servico;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import br.com.projeto.curso.modelo.CursoModelo;
import br.com.projeto.curso.modelo.ErroModelo;
import br.com.projeto.curso.repositorio.CursoRepositorio;

//Essa classe vai ser responsável por validações e regras de negócio.
@Service
public class CursoServico {

    @Autowired
    private ErroModelo erro_modelo;

    @Autowired
    private CursoRepositorio acao;

    //Método para cadastrar
    //Não sabe qual classe vai retornar pois pode ser um erro ou um cursoModelo, por isso utilizar o ResponseEntity
    public ResponseEntity<?> cadastrar(CursoModelo obj){

        if(obj.getNome().equals("")){
            erro_modelo.setMensagem("O nome do curso é obrigatório.");
            return new ResponseEntity<ErroModelo>(erro_modelo, HttpStatus.BAD_REQUEST);

        }else if(obj.getNome().length() < 5){
            erro_modelo.setMensagem("O nome do curso precisa conter pelo menos 5 caracteres.");
            return new ResponseEntity<ErroModelo>(erro_modelo, HttpStatus.BAD_REQUEST);

        }else if(obj.getValor() <= 0){
            erro_modelo.setMensagem("Informe um valor válido.");
            return new ResponseEntity<ErroModelo>(erro_modelo, HttpStatus.BAD_REQUEST);
        
        }else if(acao.countByNome(obj.getNome()) > 0){
            erro_modelo.setMensagem("O curso informado já está cadastrado.");
            return new ResponseEntity<ErroModelo>(erro_modelo, HttpStatus.BAD_REQUEST);

        }else {
        // no front-end posso trabalhar só com retorno do status, por isso o Http
        return new ResponseEntity<CursoModelo>(acao.save(obj), HttpStatus.OK);

        }
    }

    //Método para selecionar todos os cursos
    public ResponseEntity<?> selecionar(){
        if(acao.count() == 0){
            erro_modelo.setMensagem("Não há cursos cadastrados");
            return new ResponseEntity<ErroModelo>(erro_modelo, HttpStatus.OK);
        }else {

            return new ResponseEntity<Iterable<CursoModelo>>(acao.findAll(), HttpStatus.OK);
        }
    }

    //Método responsável por remover um curso
    public ResponseEntity<?> remover(long codigo){
        if(acao.countByCodigo(codigo) == 0){
            erro_modelo.setMensagem("O código informado não existe");
            return new ResponseEntity<ErroModelo>(erro_modelo, HttpStatus.NOT_FOUND);
        }else{
            acao.deleteById(codigo);
            erro_modelo.setMensagem("O curso foi removido com sucesso");
            return new ResponseEntity<ErroModelo>(erro_modelo, HttpStatus.OK);

        }
    }
}
