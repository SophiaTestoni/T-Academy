package br.com.projeto.loja.valida;

    //Retirado do site do Ralf sobre Spring para que a mensagem de erro fique somente a frase que cadastramos
    //na validação do IF.

     // Importar Map e HashMap
     import java.util.HashMap;
     import java.util.Map;

     // Importar http, validation, bind, context e servlet
     import org.springframework.http.HttpHeaders;
     import org.springframework.http.HttpStatus;
     import org.springframework.http.ResponseEntity;
     import org.springframework.validation.FieldError;
     import org.springframework.web.bind.MethodArgumentNotValidException;
     import org.springframework.web.bind.annotation.ControllerAdvice;
     import org.springframework.web.context.request.WebRequest;
     import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

     @ControllerAdvice
     public class Validacao extends ResponseEntityExceptionHandler{
         
         @Override
         protected ResponseEntity<Object> handleMethodArgumentNotValid(MethodArgumentNotValidException ex,
                 HttpHeaders headers, HttpStatus status, WebRequest request) {
             
             Map<String, String> errors = new HashMap<>();
             ex.getBindingResult().getAllErrors().forEach((error) ->{
                 
                 String fieldName = ((FieldError) error).getField();
                 String message = error.getDefaultMessage();
                 errors.put(fieldName, message);
             });
             return new ResponseEntity<Object>(errors, HttpStatus.BAD_REQUEST);
         }

     }
